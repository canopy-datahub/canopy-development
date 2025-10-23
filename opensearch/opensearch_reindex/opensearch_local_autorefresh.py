from opensearchpy import OpenSearch, helpers
import os
import json
import logging
import psycopg2
import sys
import subprocess
import time
from opensearchpy.exceptions import OpenSearchException

# Import local configuration
from config_local import LOCAL_CONFIG

logger = logging.getLogger()

autocomplete_index_name = "study_autocomplete_v001"
autocomplete_index_mapping_file_name = "autocomplete_index_mapping.json"
autocomplete_query = "SELECT distinct property_value as phrase FROM study_property_value where entity_property_id in (2, 5, 21, 22, 26, 81, 82)"
study_search_index_name = "study_search"
study_search_index_mapping_file_name = "search_index_mapping.json"
study_search_query = "SELECT * FROM public.view_study_for_es where status='Approved'"
variable_index_name = "variable_search"
variable_index_mapping_file_name = "variable_index_mapping.json"
variable_query = """
SELECT 
    vsv.variable, 
    vsv.variable_label, 
    vsv.section, 
    vsv.variable_id,
    vs.title as study_name,
    vsv.datatype
FROM public.view_study_variables vsv
LEFT JOIN public.view_study vs ON vsv.study_id = vs.study_id 
WHERE vsv.is_tier1_variable = true
"""

def load_index_mapping(index_mapping_file_name):
    """Load index mapping from JSON file"""
    try:
        with open(index_mapping_file_name, 'r') as f:
            return json.load(f)
    except FileNotFoundError:
        print(f"Warning: {index_mapping_file_name} not found, using default mapping")
        return {
            "mappings": {
                "properties": {
                    "id": {"type": "integer"},
                    "title": {"type": "text"},
                    "description": {"type": "text"},
                    "status": {"type": "keyword"},
                    "created_at": {"type": "date"},
                    "updated_at": {"type": "date"}
                }
            }
        }
    except json.JSONDecodeError as e:
        print(f"Error parsing search_index_mapping.json: {e}")
        return None


def start_opensearch_docker():
    """Start OpenSearch using Docker Compose"""
    try:
        print("Starting OpenSearch Docker containers...")
        result = subprocess.run(['docker-compose', 'up', '-d'], 
                              capture_output=True, text=True, timeout=60)
        
        if result.returncode == 0:
            print("✓ OpenSearch Docker containers started successfully")
            return True
        else:
            print(f"✗ Failed to start Docker containers: {result.stderr}")
            return False
    except subprocess.TimeoutExpired:
        print("✗ Timeout starting Docker containers")
        return False
    except FileNotFoundError:
        print("✗ docker-compose command not found")
        return False
    except Exception as e:
        print(f"✗ Error starting Docker containers: {e}")
        return False


def wait_for_opensearch(max_retries=30, delay=2):
    """Wait for OpenSearch to be ready"""
    print("Waiting for OpenSearch to be ready...")
    
    for attempt in range(max_retries):
        try:
            client = get_opensearch_client()
            # Test basic connectivity
            client.cluster.health()
            print(f"✓ OpenSearch is ready after {attempt + 1} attempts")
            return True
        except Exception:
            if attempt < max_retries - 1:
                print(f"Attempt {attempt + 1}/{max_retries}: OpenSearch not ready yet, waiting {delay}s...")
                time.sleep(delay)
            else:
                print("✗ OpenSearch failed to start within expected time")
                return False
    
    return False


def get_database_connection():
    db_config = LOCAL_CONFIG["database"]
    print("connecting to database...")
    print(f"Database: {db_config['host']}:{db_config['port']}/{db_config['dbname']}")

    try:
        connection_params = {
            "host": db_config["host"],
            "user": db_config["user"],
            "password": db_config["password"],
            "dbname": db_config["dbname"],
            "port": db_config["port"],
        }
        
        connection = psycopg2.connect(**connection_params)
        logger.info("SUCCESS: Connection to local Postgres instance succeeded")
        return connection

    except psycopg2.Error as e:
        logger.error("ERROR: Unexpected error: Could not connect to local Postgres instance.")
        logger.error(e)
        sys.exit(1)


def create_index_from_db(client, index_name, index_mapping_file_name, connection, query, is_autocomplete=False):
    """
    Create index from database with custom query and document structure
    
    Args:
        client: OpenSearch client
        index_name: Name of the index to create
        index_mapping_file_name: JSON file containing index mapping
        connection: Database connection
        query: Custom SQL query
        is_autocomplete: Whether this is an autocomplete index
    """
    # Load index mapping
    mapping = load_index_mapping(index_mapping_file_name)
    if mapping is None:
        print("Error: Could not load index mapping, aborting")
        return

    # Create the index if it doesn't exist, using the provided mapping
    if not client.indices.exists(index=index_name):
        try:
            client.indices.create(index=index_name, body=mapping)
            print(f"✓ Created index {index_name} with custom mapping")
        except Exception as e:
            print(f"✗ Failed to create index with mapping: {e}")
            # Fallback to simple index creation
            client.indices.create(index=index_name)
            print(f"✓ Created index {index_name} with default mapping")
    else:
        print(f"✓ Index {index_name} already exists")

    # clear out existing docs in index
    clear_docs(client, index_name)

    # Read data from the database and bulk index into OpenSearch
    cur = connection.cursor()
    cur.execute(query)

    # Bulk indexing
    bulk_data = []
    doc_id = 1  # For autocomplete, use sequential IDs
    
    for row in cur:
        if is_autocomplete:
            # Autocomplete document structure
            doc = {
                "_index": index_name,
                '_id': doc_id,
                "_source": {
                    "phrase": row[0],  # property_value as phrase
                    "suggest": {
                        "input": [row[0]]  # Use the phrase as input for suggestions
                    }
                }
            }
            doc_id += 1
        else:
            # Study search document structure
            doc = {
                "_index": index_name,
                '_id': row[0],  # use study id as doc id
                "_source": dict(zip([desc[0] for desc in cur.description], row))  # populate with column_name:row
            }
        bulk_data.append(doc)

    # serialized bulk raising an exception on error
    print("Pushing data to OpenSearch")
    response = helpers.bulk(client, bulk_data)
    print(f"Bulk-inserted {response[0]} items (bulk).")

    # Close connections
    connection.close()

    # refresh index
    client.indices.refresh(index=index_name)


def get_opensearch_client():
    opensearch_config = LOCAL_CONFIG["opensearch"]
    auth = (opensearch_config["username"], opensearch_config["password"])

    try:
        client = OpenSearch(
            hosts=[{"host": opensearch_config["host"], "port": opensearch_config["port"]}],
            http_auth=auth,
            use_ssl=False,
            verify_certs=False,
            ssl_assert_hostname=False,
            ssl_show_warn=False,
            timeout=30
        )
        
        # Test connection
        client.cluster.health()
        print("SUCCESS: OpenSearch connection established")
        print(f"OpenSearch: {opensearch_config['host']}:{opensearch_config['port']}")
        return client
        
    except Exception as e:
        logger.error(f"ERROR: OpenSearch connection failed: {e}")
        return None


def connect_opensearch_create_index(client, index_name, index_mapping_file_name):
    connection = get_database_connection()
    if index_name == study_search_index_name:
        create_index_from_db(client, index_name, index_mapping_file_name, connection, query=study_search_query)
    elif index_name == variable_index_name:
        create_index_from_db(client, index_name, index_mapping_file_name, connection, query=variable_query)
    else:
        create_index_from_db(client, index_name, index_mapping_file_name, connection, query=autocomplete_query, is_autocomplete=True)


def clear_docs(client, index_name):
    query = {
        'query': {
            'match_all': {}
        }
    }
    client.delete_by_query(index=index_name, body=query, refresh=True)
    print("SUCCESS: Deleting OpenSearch Index Details Succeeded")
    logger.info("SUCCESS: Deleting OpenSearch Index Details Succeeded")


def main():
    try:
        # Try to get OpenSearch client
        client = get_opensearch_client()
        
        # If connection failed, try to start Docker containers
        if client is None:
            print("OpenSearch connection failed, attempting to start Docker containers...")
            
            if start_opensearch_docker():
                # Wait for OpenSearch to be ready
                if wait_for_opensearch():
                    client = get_opensearch_client()
                else:
                    print("Failed to start OpenSearch, exiting")
                    sys.exit(1)
            else:
                print("Failed to start Docker containers, exiting")
                sys.exit(1)
        
        if client is None:
            print("Still cannot connect to OpenSearch after starting containers")
            sys.exit(1)
        
        # print(f"Starting OpenSearch refresh for index: {study_search_index_name}")
        # connect_opensearch_create_index(client, study_search_index_name, study_search_index_mapping_file_name)
        
        # print(f"Starting OpenSearch refresh for index: {autocomplete_index_name}")
        # connect_opensearch_create_index(client, autocomplete_index_name, autocomplete_index_mapping_file_name)
        
        print(f"Starting OpenSearch refresh for index: {variable_index_name}")
        connect_opensearch_create_index(client, variable_index_name, variable_index_mapping_file_name)
        
        print("OpenSearch Index AutoRefresh Completed Successfully!")
        
    except Exception as e:
        print(f"ERROR: An error occurred: {e}")
        sys.exit(1)


if __name__ == "__main__":
    main()
