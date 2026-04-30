# OpenSearch Refresh Lambda Deployment

## Overview
This Lambda function refreshes OpenSearch indices for Canopy, including:
- `study_search` - Main study search index
- `variable_search` - Variable search index  
- `study_autocomplete_v001` - Autocomplete suggestions index

## Prerequisites
- AWS CLI configured with appropriate credentials
- Python 3.11
- Access to the Canopy Lambda artifacts S3 bucket

## Deployment Steps

### 1. Install Dependencies
```bash
cd ${CANOPY_HOME}/canopy-development/opensearch/opensearch_reindex

# Install dependencies to a package directory
pip install -r requirements.txt -t package/

# Copy source files to package directory
cp opensearch_local_autorefresh.py package/
cp variable_index_mapping.json package/
cp search_index_mapping.json package/
cp autocomplete_index_mapping.json package/
cp config_local.py package/
```

### 2. Create Lambda Deployment Package
```bash
cd package
zip -r ../opensearch-refresh-lambda.zip .
cd ..
```

### 3. Upload to S3

For **dev environment**:
```bash
aws s3 cp opensearch-refresh-lambda.zip s3://canopy-lambda-artifacts-dev/opensearch-refresh/opensearch-refresh-lambda.zip
```

For **prod environment**:
```bash
aws s3 cp opensearch-refresh-lambda.zip s3://canopy-lambda-artifacts-prod/opensearch-refresh/opensearch-refresh-lambda.zip
```

### 4. Update Lambda Function
After uploading to S3, the Lambda function will automatically use the new code on next deployment via CloudFormation.

To manually update an existing Lambda:
```bash
aws lambda update-function-code \
  --function-name Canopy-OpenSearchRefresh-dev \
  --s3-bucket canopy-lambda-artifacts-dev \
  --s3-key opensearch-refresh/opensearch-refresh-lambda.zip
```

## Environment Variables
The Lambda function uses the following environment variables (configured in Lambda.yaml):
- `REGION_NAME`: AWS region (e.g., "us-east-1")
- `SECRET_NAME`: AWS Secrets Manager secret name (e.g., "application_dev")
- `STUDY_SEARCH_INDEX`: Study search index name
- `VARIABLE_SEARCH_INDEX`: Variable search index name
- `AUTOCOMPLETE_INDEX`: Autocomplete index name

## Lambda Configuration
- **Handler**: `opensearch_local_autorefresh.lambda_handler`
- **Runtime**: Python 3.11
- **Memory**: 2048 MB
- **Timeout**: 900 seconds (15 minutes)
- **Architecture**: arm64

## Required IAM Permissions
The Lambda execution role needs:
- VPC access (to connect to RDS and OpenSearch)
- Secrets Manager read access
- CloudWatch Logs write access
- OpenSearch full access

## Testing
After deployment, you can test the Lambda function:
```bash
aws lambda invoke \
  --function-name Canopy-OpenSearchRefresh-dev \
  --payload '{}' \
  response.json

cat response.json
```

## Troubleshooting
- Check CloudWatch Logs for execution details
- Verify VPC configuration allows access to RDS and OpenSearch
- Ensure Secrets Manager contains correct database credentials
- Verify psycopg2 layer is attached to the Lambda

## Notes
- The function connects to PostgreSQL database to fetch data
- It creates/updates OpenSearch indices with proper mappings
- Indices are versioned to allow zero-downtime updates
- The function handles both study and variable data indexing

