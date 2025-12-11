#!/bin/bash

# OpenSearch Reindex AWS Lambda - Code Upload Script
# 
# This script uploads Lambda code to S3. After uploading, you need to:
# 1. Deploy the Lambda CloudFormation stack (first time), OR
# 2. Update the Lambda function code (if already deployed)
#
# Usage: ./deploy_aws.sh [env] [DataHubUniqueId]
# Example: ./deploy_aws.sh dev stanford
#          ./deploy_aws.sh test stanford
#          ./deploy_aws.sh prod stanford

set -e

ENV=${1:-dev}
DATAHUB_UNIQUE_ID=${2:-stanford}
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo "========================================="
echo "OpenSearch Reindex Lambda - Code Upload"
echo "Environment: $ENV"
echo "DataHubUniqueId: $DATAHUB_UNIQUE_ID"
echo "========================================="

# Validate environment
if [ "$ENV" != "prod" ] && [ "$ENV" != "dev" ] && [ "$ENV" != "test" ]; then
    echo "Error: Invalid environment. Use 'dev', 'test', or 'prod'"
    exit 1
fi

# Set S3 bucket and Lambda function name using environment variable
S3_BUCKET="datahub-lambda-artifacts-${DATAHUB_UNIQUE_ID}-${ENV}"
LAMBDA_FUNCTION="DataHub-OpenSearchRefresh-${ENV}"

echo "S3 Bucket: $S3_BUCKET"
echo "Lambda Function: $LAMBDA_FUNCTION"
echo ""

# Clean up previous build
echo "Cleaning up previous build..."
rm -rf package
rm -f opensearch-refresh-lambda.zip

# Create package directory
echo "Creating package directory..."
mkdir -p package

# Copy source files
echo "Copying source files..."
cp opensearch_reindex_aws.py package/
cp variable_index_mapping.json package/
cp search_index_mapping.json package/
cp autocomplete_index_mapping.json package/

# Create deployment package
echo "Creating deployment package..."
cd package
zip -r ../opensearch-refresh-lambda.zip . -q
cd ..

PACKAGE_SIZE=$(du -h opensearch-refresh-lambda.zip | cut -f1)
echo "Package size: $PACKAGE_SIZE"

# Verify package is small (should be <100KB without dependencies)
if command -v stat &> /dev/null; then
    PACKAGE_SIZE_BYTES=$(stat -f%z opensearch-refresh-lambda.zip 2>/dev/null || stat -c%s opensearch-refresh-lambda.zip 2>/dev/null)
    if [ $PACKAGE_SIZE_BYTES -gt 1048576 ]; then  # 1MB
        echo ""
        echo "⚠️  WARNING: Package is larger than expected (>1MB)"
        echo "Package should be <100KB with only code."
        echo "It may contain dependencies that should be in the layer."
        echo ""
        echo "Package contents:"
        unzip -l opensearch-refresh-lambda.zip | head -30
        echo ""
        read -p "Continue anyway? (y/n) " -n 1 -r
        echo
        if [[ ! $REPLY =~ ^[Yy]$ ]]; then
            echo "Aborted"
            exit 1
        fi
    else
        echo "✓ Package size is reasonable (<1MB, code only)"
    fi
fi

# Upload to S3
echo "Uploading to S3..."
aws s3 cp opensearch-refresh-lambda.zip "s3://${S3_BUCKET}/opensearch-refresh/opensearch-refresh-lambda.zip"

if [ $? -eq 0 ]; then
    echo "✓ Successfully uploaded to S3"
else
    echo "✗ Failed to upload to S3"
    exit 1
fi

