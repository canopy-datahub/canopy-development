# OpenSearch Local AutoRefresh

This is a local version of the OpenSearch refresh application, working with OpenSearch Docker deployment and local PostgreSQL databases. All configuration is done through environment variables.

## Prerequisites

- Python 3.12
- Docker and Docker Compose
- **PostgreSQL database running locally** (required)
- pip (Python package manager)

## Before Running

### Ensure PostgreSQL is Running

**Before running the application, make sure your local PostgreSQL database is running:**

#### On macOS:
```bash
# Check if PostgreSQL is running
brew services list | grep postgresql

# Start PostgreSQL if not running
brew services start postgresql
```

#### On Linux:
```bash
# Check if PostgreSQL is running
sudo systemctl status postgresql

# Start PostgreSQL if not running
sudo systemctl start postgresql
```

#### On Windows:
```bash
# Check if PostgreSQL service is running
sc query postgresql

# Start PostgreSQL if not running
net start postgresql
```

#### Using Docker:
```bash
# Start PostgreSQL with Docker
docker run --name postgres -e POSTGRES_PASSWORD=your_password -e POSTGRES_DB=your_dbname -p 5432:5432 -d postgres:13
```

**Verify PostgreSQL connection:**
```bash
# Test connection with psql
psql -h localhost -p 5432 -U your_dbuser -d your_dbname
```

## Quick Start

### 1. Install Dependencies

```bash
pip install -r requirements.txt
```

### 2. Set Environment Variables

#### Option A: Set environment variables manually
```bash
# Database configuration
export host=localhost
export port=5432
export dbname=your_dbname
export dbuser=your_dbuser
export password=your_password

# OpenSearch configuration
export SEARCH_HOST=localhost
export SEARCH_PORT=9200
export SEARCH_USERNAME=admin
export SEARCH_PASSWORD=admin
```

#### Option B: Create a .env file
```bash
# Create .env file
cat > .env << EOF
export host=localhost
export port=5432
export dbname=your_dbname
export dbuser=your_dbuser
export password=your_password
export SEARCH_HOST=localhost
export SEARCH_PORT=9200
export SEARCH_USERNAME=admin
export SEARCH_PASSWORD=admin
EOF

# Source the environment variables
source .env
```

### 3. Run the Application

```bash
python opensearch_local_autorefresh.py
```

The application will:
1. **Automatically start OpenSearch** if it's not running
2. **Create indices** with custom mappings if they don't exist
3. **Index data** from PostgreSQL to OpenSearch
4. **Refresh multiple indices** (study_search and study_autocomplete_v001)

## How It Works

### Automatic Docker Startup
- If OpenSearch connection fails, the application automatically runs `docker-compose up -d`
- Waits for OpenSearch to be ready (up to 60 seconds)
- Retries the connection after startup

### Index Creation with Custom Mapping
- Loads mapping from JSON files (`search_index_mapping.json`, `autocomplete_index_mapping.json`)
- Creates indices with custom mappings if they don't exist
- Falls back to default mapping if custom mapping fails

### Multiple Index Support
- Refreshes `study_search` index for full-text search
- Refreshes `study_autocomplete_v001` index for autocomplete functionality
- Each index can have its own custom mapping

## Expected Output

When running successfully, you should see:

```
Starting OpenSearch refresh for index: study_search
✓ Created index study_search with custom mapping
Pushing data to OpenSearch
Bulk-inserted 2 items (bulk).
Starting OpenSearch refresh for index: study_autocomplete_v001
✓ Created index study_autocomplete_v001 with custom mapping
Pushing data to OpenSearch
Bulk-inserted 2 items (bulk).
OpenSearch Index AutoRefresh Completed Successfully!
```

## Files Overview

- `opensearch_local_autorefresh.py`: Main application file
- `config_local.py`: Configuration file (uses environment variables)
- `search_index_mapping.json`: Mapping for study search index
- `autocomplete_index_mapping.json`: Mapping for autocomplete index
- `docker-compose.yml`: Docker setup for OpenSearch
- `requirements.txt`: Python dependencies
- `README_LOCAL.md`: This documentation
