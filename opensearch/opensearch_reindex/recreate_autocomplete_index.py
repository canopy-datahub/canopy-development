#!/usr/bin/env python3
"""
Script to delete and recreate the autocomplete index with proper mapping
"""

import os
import json
from opensearchpy import OpenSearch
from config_local import LOCAL_CONFIG

def get_opensearch_client():
    opensearch_config = LOCAL_CONFIG["opensearch"]
    auth = (opensearch_config["username"], opensearch_config["password"])

    client = OpenSearch(
        hosts=[{"host": opensearch_config["host"], "port": opensearch_config["port"]}],
        http_auth=auth,
        use_ssl=False,
        verify_certs=False,
        ssl_assert_hostname=False,
        ssl_show_warn=False,
        timeout=30
    )
    return client

def load_autocomplete_mapping():
    """Load autocomplete index mapping from JSON file"""
    try:
        with open('autocomplete_index_mapping.json', 'r') as f:
            return json.load(f)
    except FileNotFoundError:
        print("Warning: autocomplete_index_mapping.json not found, using default autocomplete mapping")
        return {
            "mappings": {
                "properties": {
                    "suggest": {
                        "type": "completion",
                        "analyzer": "simple"
                    },
                    "title": {"type": "text"},
                    "study_id": {"type": "long"}
                }
            }
        }
    except json.JSONDecodeError as e:
        print(f"Error parsing autocomplete_index_mapping.json: {e}")
        return None

def main():
    index_name = "study_autocomplete_v001"
    
    try:
        client = get_opensearch_client()
        
        # Check if index exists
        if client.indices.exists(index=index_name):
            print(f"Deleting existing index: {index_name}")
            client.indices.delete(index=index_name)
            print(f"✓ Deleted index: {index_name}")
        else:
            print(f"Index {index_name} does not exist")
        
        # Load mapping
        mapping = load_autocomplete_mapping()
        if mapping is None:
            print("Error: Could not load autocomplete mapping")
            return
        
        # Create index with proper mapping
        print(f"Creating index: {index_name} with autocomplete mapping")
        client.indices.create(index=index_name, body=mapping)
        print(f"✓ Created index: {index_name} with autocomplete mapping")
        
        # Verify the mapping
        mapping_response = client.indices.get_mapping(index=index_name)
        print("✓ Index mapping verified:")
        print(json.dumps(mapping_response[index_name]['mappings'], indent=2))
        
    except Exception as e:
        print(f"Error: {e}")

if __name__ == "__main__":
    main() 