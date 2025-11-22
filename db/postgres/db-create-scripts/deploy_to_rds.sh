#!/bin/bash

# RDS Database Deployment Script
# Usage: ./deploy_to_rds.sh [dev|test|prod] [region] [profile]
# Example: ./deploy_to_rds.sh dev us-east-1 datahub-rep

set -e

ENV=${1:-dev}
AWS_DEFAULT_REGION=${2:-us-east-1}
AWS_PROFILE=${3:-${AWS_PROFILE:-datahub-rep}}
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# IMPORTANT: Unset any existing AWS credentials from environment
# This ensures we use the profile credentials, not environment variables
unset AWS_ACCESS_KEY_ID
unset AWS_SECRET_ACCESS_KEY
unset AWS_SESSION_TOKEN

# Set AWS profile and region
export AWS_PROFILE="$AWS_PROFILE"
export AWS_DEFAULT_REGION="$AWS_DEFAULT_REGION"

echo "========================================="
echo "RDS Database Schema Deployment"
echo "Environment: $ENV"
echo "AWS Region: $AWS_DEFAULT_REGION"
echo "AWS Profile: $AWS_PROFILE"
echo "========================================="

# Validate environment
if [ "$ENV" != "prod" ] && [ "$ENV" != "dev" ] && [ "$ENV" != "test" ]; then
    echo "Error: Invalid environment. Use 'dev', 'test', or 'prod'"
    exit 1
fi

# Verify AWS credentials
echo ""
echo "Verifying AWS credentials..."
AWS_IDENTITY=$(aws sts get-caller-identity --output json 2>&1)
if [ $? -ne 0 ]; then
    echo "Error: Failed to verify AWS credentials"
    echo "$AWS_IDENTITY"
    echo ""
    echo "Please check:"
    echo "  1. AWS profile '$AWS_PROFILE' exists in ~/.aws/credentials"
    echo "  2. Credentials are valid"
    echo "  3. Run: aws configure --profile $AWS_PROFILE"
    exit 1
fi

echo "✓ AWS Account: $(echo $AWS_IDENTITY | jq -r .Account)"
echo "✓ AWS User: $(echo $AWS_IDENTITY | jq -r .Arn)"
echo ""

# Get RDS endpoint
echo "Getting RDS endpoint..."
RDS_ENDPOINT=$(aws rds describe-db-instances \
  --db-instance-identifier datahub-postgresql-$ENV \
  --region $AWS_DEFAULT_REGION \
  --query 'DBInstances[0].Endpoint.Address' \
  --output text)

if [ -z "$RDS_ENDPOINT" ]; then
    echo "Error: Could not get RDS endpoint for datahub-postgresql-$ENV"
    exit 1
fi

echo "RDS Endpoint: $RDS_ENDPOINT"

# Database configuration
DB_NAME="datahub_$ENV"
DB_USER="datahubpostgres$ENV"

# Prompt for password
echo ""
read -sp "Enter database master password: " DB_PASSWORD
echo ""

export PGPASSWORD="$DB_PASSWORD"

# Test connection
echo "Testing connection..."
if ! psql -h "$RDS_ENDPOINT" -U "$DB_USER" -d "$DB_NAME" -c "SELECT version();" > /dev/null 2>&1; then
    echo "Error: Could not connect to database"
    echo ""
    echo "Common issues:"
    echo "  1. Password is incorrect"
    echo "     - Default password from RDS.yaml is 'REPLACEME'"
    echo "     - Check if you've updated it in AWS Console"
    echo ""
    echo "  2. Security group doesn't allow your IP"
    echo "     - Run: ./add_ip_to_sg.sh $ENV $AWS_DEFAULT_REGION $AWS_PROFILE"
    echo "     - Or manually add your IP to security group 'datahub-db-sg-$ENV'"
    echo ""
    echo "  3. RDS instance is not available"
    echo "     - Check status: aws rds describe-db-instances --db-instance-identifier datahub-postgresql-$ENV --region $AWS_DEFAULT_REGION --query 'DBInstances[0].DBInstanceStatus'"
    echo ""
    echo "  4. Network connectivity issues"
    echo "     - Test: nc -zv $RDS_ENDPOINT 5432"
    echo ""
    exit 1
fi

echo "✓ Connection successful"
echo ""

# Ask for confirmation
echo "About to deploy database schema to:"
echo "  Environment: $ENV"
echo "  Endpoint: $RDS_ENDPOINT"
echo "  Database: $DB_NAME"
echo ""
read -p "Continue? (yes/no): " -r
if [[ ! $REPLY =~ ^[Yy][Ee][Ss]$ ]]; then
    echo "Deployment cancelled"
    exit 0
fi

echo ""
echo "========================================="
echo "Running SQL Scripts"
echo "========================================="

# Run scripts in order
SCRIPTS=(
    "01_create_user_roles.sql"
    "02_create_base_db.sql"
    "03_populate_base_tables.sql"
    "04_populate_variable_tables.sql"
)

for script in "${SCRIPTS[@]}"; do
    if [ -f "$SCRIPT_DIR/$script" ]; then
        echo ""
        echo "Running $script..."
        if psql -h $RDS_ENDPOINT -U $DB_USER -d $DB_NAME -f "$SCRIPT_DIR/$script"; then
            echo "✓ $script completed successfully"
        else
            echo "✗ Error running $script"
            exit 1
        fi
    else
        echo "⚠ Warning: $script not found, skipping"
    fi
done

# Clear password
unset PGPASSWORD

echo ""
echo "========================================="
echo "Database deployment completed!"
echo "========================================="
echo ""
echo "Next steps:"
echo "1. Update Secrets Manager with database credentials:"
echo "   aws secretsmanager update-secret \\"
echo "     --secret-id application_$ENV \\"
echo "     --secret-string '{...}'"
echo ""
echo "2. Verify database schema:"
echo "   psql -h $RDS_ENDPOINT -U $DB_USER -d $DB_NAME -c '\\dt'"
echo ""
echo "3. Test application connectivity"

