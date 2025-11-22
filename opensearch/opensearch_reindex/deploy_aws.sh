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

# Install dependencies
echo "Installing dependencies..."
pip install -r requirements_aws.txt -t package/ --quiet --platform manylinux2014_aarch64 --only-binary=:all:

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

# Check if package is too large (Lambda limit is 50MB zipped, 250MB unzipped)
PACKAGE_SIZE_BYTES=$(stat -f%z opensearch-refresh-lambda.zip 2>/dev/null || stat -c%s opensearch-refresh-lambda.zip)
if [ $PACKAGE_SIZE_BYTES -gt 52428800 ]; then
    echo "⚠ Warning: Package size exceeds 50MB. Consider using Lambda layers for dependencies."
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

# Check if Lambda function exists and optionally update it
echo "Checking if Lambda function exists..."
if aws lambda get-function --function-name "$LAMBDA_FUNCTION" &> /dev/null; then
    echo "✓ Lambda function exists: $LAMBDA_FUNCTION"
    
    # Ask if user wants to update the function code immediately
    read -p "Update Lambda function code now? (y/N): " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        echo "Updating Lambda function code..."
        aws lambda update-function-code \
            --function-name "$LAMBDA_FUNCTION" \
            --s3-bucket "$S3_BUCKET" \
            --s3-key "opensearch-refresh/opensearch-refresh-lambda.zip" \
            --output json > /dev/null
        
        if [ $? -eq 0 ]; then
            echo "✓ Lambda function code updated successfully"
            
            # Wait for update to complete
            echo "Waiting for Lambda update to complete..."
            aws lambda wait function-updated --function-name "$LAMBDA_FUNCTION"
            echo "✓ Lambda function is ready"
        else
            echo "✗ Failed to update Lambda function code"
            exit 1
        fi
    else
        echo "⚠ Skipping immediate update. Lambda will use new code on next CloudFormation deployment."
    fi
else
    echo "⚠ Lambda function does not exist yet."
    echo "   It will be created when you deploy the Lambda CloudFormation stack."
fi

# Clean up
echo "Cleaning up..."
rm -rf package
rm -f opensearch-refresh-lambda.zip

echo ""
echo "========================================="
echo "Lambda code uploaded successfully!"
echo "========================================="
echo ""
echo "Next steps:"
echo ""
echo "1. Deploy/Update Lambda via CloudFormation:"
echo "   cd /path/to/datahub-cloud-replication"
echo "   aws cloudformation deploy \\"
echo "     --stack-name DataHub-Lambda-$ENV \\"
echo "     --template-file modules/Lambda.yaml \\"
echo "     --parameter-overrides file://parameters-$ENV.json \\"
echo "     --capabilities CAPABILITY_NAMED_IAM \\"
echo "     --region us-east-1 \\"
echo "     --tags projectname=datahub environment=$ENV"
echo ""
echo "2. Verify Secrets Manager contains required configuration:"
echo "   aws secretsmanager get-secret-value --secret-id application_$ENV --query SecretString --output text | jq"
echo ""
echo "   Required fields in secret (from SecretsManager.yaml):"
echo "   - opensearch.hostname: OpenSearch domain endpoint"
echo "   - opensearch.port: 443"
echo "   - opensearch.username: opensearch"
echo "   - opensearch.password: OpenSearch password"
echo "   - host: RDS Proxy or RDS endpoint"
echo "   - port: 5432"
echo "   - dbname: Database name (e.g., DataHub_dev)"
echo "   - dbuser: Database username"
echo "   - password: Database password"
echo ""
echo "3. Get required endpoints (if needed):"
echo ""
echo "   OpenSearch endpoint:"
echo "   aws opensearch describe-domain \\"
echo "     --domain-name datahub-opensearch-$ENV \\"
echo "     --query 'DomainStatus.Endpoint' \\"
echo "     --output text"
echo ""
echo "   RDS endpoint:"
echo "   aws rds describe-db-instances \\"
echo "     --db-instance-identifier datahub-postgresql-$ENV \\"
echo "     --query 'DBInstances[0].Endpoint.Address' \\"
echo "     --output text"
echo ""
echo "4. Test the Lambda function:"
echo "   aws lambda invoke \\"
echo "     --function-name $LAMBDA_FUNCTION \\"
echo "     --payload '{}' \\"
echo "     response.json"
echo "   cat response.json"
echo ""
echo "5. Check CloudWatch Logs:"
echo "   aws logs tail /aws/lambda/$LAMBDA_FUNCTION --follow"

