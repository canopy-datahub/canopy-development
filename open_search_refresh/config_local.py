# Local configuration for OpenSearch Docker deployment
# All database settings are loaded from environment variables

import os

LOCAL_CONFIG = {
    # Database configuration - loaded from environment variables
    "database": {
        "host": os.environ.get('host', 'localhost'),
        "port": int(os.environ.get('port', '5432')),
        "dbname": os.environ.get('dbname', 'postgres'),
        "user": os.environ.get('dbuser', 'postgres'),
        "password": os.environ.get('password', 'postgres'),
    },
    # OpenSearch configuration
    "opensearch": {
        "host": os.environ.get('SEARCH_HOST', 'localhost'),
        "port": int(os.environ.get('SEARCH_PORT', '9200')),
        "username": os.environ.get('SEARCH_USERNAME', 'admin'),
        "password": os.environ.get('SEARCH_PASSWORD', 'admin'),
    }
}
