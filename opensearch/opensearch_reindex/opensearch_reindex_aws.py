"""
AWS Lambda version of OpenSearch Reindex
This script is designed to run in AWS Lambda and connect to AWS OpenSearch Service
"""

from opensearchpy import OpenSearch, helpers, RequestsHttpConnection
import os
import json
import logging
import psycopg2
import boto3
from requests_aws4auth import AWS4Auth
from opensearchpy.exceptions import OpenSearchException

# Configure logging
logger = logging.getLogger()
logger.setLevel(logging.INFO)

# Index configurations
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
    vv.variable,
    MAX(vv.variable_label) as variable_label,
    MAX(COALESCE(NULLIF(TRIM(vv.variable_section), ''), 'unknown')) as section,
    MIN(vv.variable_id) as variable_id,
    ARRAY_AGG(COALESCE(NULLIF(TRIM(vs.title), ''), 'unknown') ORDER BY vv.study_id) as study_name,
    MAX(COALESCE(NULLIF(TRIM(vv.variable_datatype), ''), 'unknown')) as datatype,
    ARRAY_AGG(vv.study_id ORDER BY vv.study_id) as study_id
FROM public.view_variables vv
LEFT JOIN public.view_study vs ON vv.study_id = vs.study_id 
GROUP BY vv.variable
"""


def get_secrets():
    """
    Retrieve configuration from AWS Secrets Manager
    
    Returns:
        dict: Configuration including opensearch_host, db credentials
    """
    region = os.environ.get('REGION_NAME', 'us-east-1')
    secret_name = os.environ.get('SECRET_NAME', 'application_dev')
    
    logger.info(f"Retrieving secrets from: {secret_name} in region: {region}")
    
    # Create a Secrets Manager client
    try:
        session = boto3.session.Session()
        client = session.client(
            service_name='secretsmanager',
            region_name=region
        )
        
        response = client.get_secret_value(SecretId=secret_name)
        secret = json.loads(response['SecretString'])
        
        logger.info("Successfully retrieved secrets from Secrets Manager")
        return secret
        
    except Exception as e:
        logger.error(f"Error retrieving secrets: {e}")
        raise


def get_opensearch_client():
    """
    Create OpenSearch client using basic auth from Secrets Manager
    
    Returns:
        OpenSearch: Configured OpenSearch client
    """
    try:
        # Get configuration from secrets
        secrets = get_secrets()
        
        # Extract OpenSearch configuration from secrets
        host = secrets.get('SEARCH_HOST')
        username = secrets.get('SEARCH_USERNAME')
        password = secrets.get('SEARCH_PASSWORD')
        port = '443'
        
        if not host:
            raise ValueError("SEARCH_HOST not found in secrets")
        
        auth = (username, password)
        
        logger.info(f"Connecting to OpenSearch: {host}:{port}")
        
        # Create OpenSearch client with basic auth
        client = OpenSearch(
            hosts=[{'host': host, 'port': int(port)}],
            http_auth=auth,
            use_ssl=True,
            verify_certs=True,
            ssl_assert_hostname=False,
            ssl_show_warn=False,
            timeout=60,
            max_retries=3,
            retry_on_timeout=True
        )
        
        # Test connection
        health = client.cluster.health()
        logger.info(f"Successfully connected to OpenSearch: {host}")
        logger.info(f"Cluster health: {health['status']}")
        
        return client
        
    except Exception as e:
        logger.error(f"Error connecting to OpenSearch: {e}")
        raise


def get_database_connection():
    """
    Create PostgreSQL database connection using credentials from Secrets Manager
    
    Returns:
        psycopg2.connection: Database connection
    """
    try:
        # Get configuration from secrets
        secrets = get_secrets()
        
        # SecretsManager.yaml uses: host, port, dbname, dbuser, password
        db_config = {
            'host': secrets.get('host'),
            'port': secrets.get('port', '5432'),
            'dbname': secrets.get('dbname'),
            'user': secrets.get('dbuser'),
            'password': secrets.get('password')
        }
        
        logger.info(f"Connecting to database: {db_config['host']}:{db_config['port']}/{db_config['dbname']}")
        
        connection = psycopg2.connect(**db_config)
        logger.info("Successfully connected to PostgreSQL database")
        
        return connection
        
    except psycopg2.Error as e:
        logger.error(f"Database connection error: {e}")
        raise
    except Exception as e:
        logger.error(f"Error getting database connection: {e}")
        raise


def load_index_mapping(index_mapping_file_name):
    """
    Load index mapping from JSON file
    
    Args:
        index_mapping_file_name: Name of the mapping file
        
    Returns:
        dict: Index mapping configuration
    """
    try:
        with open(index_mapping_file_name, 'r') as f:
            mapping = json.load(f)
            logger.info(f"Loaded index mapping from {index_mapping_file_name}")
            return mapping
            
    except FileNotFoundError:
        logger.warning(f"{index_mapping_file_name} not found, using default mapping")
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
        logger.error(f"Error parsing {index_mapping_file_name}: {e}")
        raise


def clear_docs(client, index_name):
    """
    Clear all documents from an index
    
    Args:
        client: OpenSearch client
        index_name: Name of the index to clear
    """
    try:
        query = {
            'query': {
                'match_all': {}
            }
        }
        result = client.delete_by_query(index=index_name, body=query, refresh=True)
        logger.info(f"Cleared {result['deleted']} documents from index {index_name}")
        
    except Exception as e:
        logger.error(f"Error clearing documents from {index_name}: {e}")
        raise


def create_index_from_db(client, index_name, index_mapping_file_name, connection, query, is_autocomplete=False, recreate=False):
    """
    Create/update index from database with custom query and document structure

    Args:
        client: OpenSearch client
        index_name: Name of the index to create
        index_mapping_file_name: JSON file containing index mapping
        connection: Database connection
        query: Custom SQL query
        is_autocomplete: Whether this is an autocomplete index
        recreate: If True, drop the index first so it is rebuilt with the
                  current mapping file (a plain refresh only clears documents
                  and leaves the existing mapping untouched). Use when the
                  mapping has changed, e.g. new fields added.
    """
    try:
        # Load index mapping
        mapping = load_index_mapping(index_mapping_file_name)

        # Optionally drop the index so it is recreated with the current mapping
        if recreate and client.indices.exists(index=index_name):
            client.indices.delete(index=index_name)
            logger.info(f"Deleted index {index_name} for recreation with current mapping")

        # Create the index if it doesn't exist
        if not client.indices.exists(index=index_name):
            try:
                client.indices.create(index=index_name, body=mapping)
                logger.info(f"Created index {index_name} with custom mapping")
            except Exception as e:
                logger.error(f"Failed to create index with mapping: {e}")
                # Fallback to simple index creation
                client.indices.create(index=index_name)
                logger.info(f"Created index {index_name} with default mapping")
        else:
            logger.info(f"Index {index_name} already exists")
        
        # Clear existing documents
        clear_docs(client, index_name)
        
        # Read data from the database
        cur = connection.cursor()
        cur.execute(query)
        
        logger.info(f"Fetched data from database for index {index_name}")
        
        # Prepare bulk data
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
                # Study/Variable search document structure
                doc = {
                    "_index": index_name,
                    '_id': row[0],  # use study_id or variable name as doc id
                    "_source": dict(zip([desc[0] for desc in cur.description], row))
                }
            bulk_data.append(doc)
        
        # Bulk index into OpenSearch
        logger.info(f"Bulk indexing {len(bulk_data)} documents into {index_name}")
        success_count, errors = helpers.bulk(client, bulk_data, raise_on_error=False)
        
        if errors:
            logger.warning(f"Bulk indexing completed with {len(errors)} errors")
        else:
            logger.info(f"Successfully bulk-indexed {success_count} documents")
        
        # Close cursor
        cur.close()
        
        # Refresh index
        client.indices.refresh(index=index_name)
        logger.info(f"Refreshed index {index_name}")
        
        return success_count
        
    except Exception as e:
        logger.error(f"Error creating index {index_name}: {e}")
        raise


def refresh_index(client, index_name, index_mapping_file_name, recreate=False):
    """
    Refresh a specific index with data from database

    Args:
        client: OpenSearch client
        index_name: Name of the index to refresh
        index_mapping_file_name: Mapping file for the index
        recreate: If True, drop and recreate the index so mapping changes apply

    Returns:
        int: Number of documents indexed
    """
    connection = None
    try:
        connection = get_database_connection()

        if index_name == study_search_index_name:
            doc_count = create_index_from_db(
                client, index_name, index_mapping_file_name,
                connection, query=study_search_query, recreate=recreate
            )
        elif index_name == variable_index_name:
            doc_count = create_index_from_db(
                client, index_name, index_mapping_file_name,
                connection, query=variable_query, recreate=recreate
            )
        else:  # autocomplete
            doc_count = create_index_from_db(
                client, index_name, index_mapping_file_name,
                connection, query=autocomplete_query, is_autocomplete=True, recreate=recreate
            )

        return doc_count
        
    finally:
        if connection:
            connection.close()
            logger.info("Database connection closed")


def lambda_handler(event, context):
    """
    AWS Lambda handler function
    
    Args:
        event: Lambda event object (can specify which indices to refresh)
        context: Lambda context object
        
    Returns:
        dict: Response with statusCode and results
    """
    logger.info("Lambda function started")
    logger.info(f"Event: {json.dumps(event)}")
    
    results = {}
    errors = []
    
    try:
        # Get OpenSearch client
        client = get_opensearch_client()
        
        # Determine which indices to refresh (default: all)
        indices_to_refresh = event.get('indices', ['study_search', 'variable_search', 'autocomplete'])
        # Indices to drop-and-recreate (applies mapping changes); default: none
        indices_to_recreate = event.get('recreate', [])

        # Refresh study search index
        if 'study_search' in indices_to_refresh:
            try:
                logger.info(f"Starting refresh for index: {study_search_index_name}")
                doc_count = refresh_index(client, study_search_index_name, study_search_index_mapping_file_name,
                                          recreate='study_search' in indices_to_recreate)
                results['study_search'] = {
                    'status': 'completed',
                    'documents': doc_count
                }
                logger.info(f"Completed refresh for {study_search_index_name}: {doc_count} documents")
            except Exception as e:
                error_msg = f"Error refreshing study_search: {str(e)}"
                logger.error(error_msg)
                errors.append(error_msg)
                results['study_search'] = {'status': 'failed', 'error': str(e)}
        
        # Refresh autocomplete index
        if 'autocomplete' in indices_to_refresh:
            try:
                logger.info(f"Starting refresh for index: {autocomplete_index_name}")
                doc_count = refresh_index(client, autocomplete_index_name, autocomplete_index_mapping_file_name,
                                          recreate='autocomplete' in indices_to_recreate)
                results['autocomplete'] = {
                    'status': 'completed',
                    'documents': doc_count
                }
                logger.info(f"Completed refresh for {autocomplete_index_name}: {doc_count} documents")
            except Exception as e:
                error_msg = f"Error refreshing autocomplete: {str(e)}"
                logger.error(error_msg)
                errors.append(error_msg)
                results['autocomplete'] = {'status': 'failed', 'error': str(e)}
        
        # Refresh variable search index
        if 'variable_search' in indices_to_refresh:
            try:
                logger.info(f"Starting refresh for index: {variable_index_name}")
                doc_count = refresh_index(client, variable_index_name, variable_index_mapping_file_name,
                                          recreate='variable_search' in indices_to_recreate)
                results['variable_search'] = {
                    'status': 'completed',
                    'documents': doc_count
                }
                logger.info(f"Completed refresh for {variable_index_name}: {doc_count} documents")
            except Exception as e:
                error_msg = f"Error refreshing variable_search: {str(e)}"
                logger.error(error_msg)
                errors.append(error_msg)
                results['variable_search'] = {'status': 'failed', 'error': str(e)}
        
        # Determine overall status
        if errors:
            status_code = 207  # Multi-Status (partial success)
            message = f"OpenSearch refresh completed with {len(errors)} error(s)"
        else:
            status_code = 200
            message = "OpenSearch indices refreshed successfully"
        
        logger.info(f"Lambda execution completed: {message}")
        
        return {
            'statusCode': status_code,
            'body': json.dumps({
                'message': message,
                'results': results,
                'errors': errors if errors else None
            })
        }
        
    except Exception as e:
        error_msg = f"Fatal error in lambda_handler: {str(e)}"
        logger.error(error_msg)
        return {
            'statusCode': 500,
            'body': json.dumps({
                'message': 'OpenSearch refresh failed',
                'error': error_msg
            })
        }

