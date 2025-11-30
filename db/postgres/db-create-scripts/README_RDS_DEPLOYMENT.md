# RDS Database Deployment Guide

## Overview
This guide explains how to deploy the DataHub database schema to an AWS RDS PostgreSQL instance.

## Prerequisites

1. ✅ RDS instance deployed via CloudFormation (`DataHub-RDS-{ENV}` stack)
2. ✅ PostgreSQL client (`psql`) installed locally
3. ✅ AWS CLI configured with appropriate credentials
   - AWS profile configured (default: `datahub-rep`)
   - Run `aws configure --profile datahub-rep` to set up credentials
   - Or use existing profile with `--profile` parameter
4. ✅ Network access to RDS (security group configured)

**Note:** The script automatically handles AWS credentials similar to InstallGuide.ipynb:
- Unsets any existing AWS environment credentials
- Uses AWS profile for authentication (default: `datahub-rep`)
- Sets region (default: `us-east-1`)

## Database Configuration

From `RDS.yaml`:
- **DB Instance Identifier**: `datahub-postgresql-{ENV}`
- **Database Name**: `datahub_{ENV}` (e.g., `datahub_dev`)
- **Master Username**: `datahubpostgres{ENV}` (e.g., `datahubpostgresdev`)
- **Port**: `5432`
- **Engine**: PostgreSQL 16.9

## Deployment

#### (Optional) Set Master Password

The RDS instance is created with password `"REPLACEME"`. Update it:

```bash
aws rds modify-db-instance \
  --db-instance-identifier datahub-postgresql-dev \
  --master-user-password "YourSecurePassword123!" \
  --apply-immediately \
  --region us-east-1

# Wait for modification to complete
aws rds wait db-instance-available \
  --db-instance-identifier datahub-postgresql-dev \
  --region us-east-1
```


### Automated Deployment Script

```bash
cd /Users/ycao77/dataHub/datahub-development/db/postgres/db-create-scripts

# Deploy to dev (uses default profile: datahub-rep, region: us-east-1)
./deploy_to_rds.sh dev

# Deploy with specific region
./deploy_to_rds.sh dev us-east-1

# Deploy with specific region and profile
./deploy_to_rds.sh dev us-east-1 datahub-rep

# Deploy to test
./deploy_to_rds.sh test us-east-1

# Deploy to prod
./deploy_to_rds.sh prod us-east-1
```

**Script Usage:**
```bash
./deploy_to_rds.sh [env] [region] [profile]
```

**Parameters:**
- `env`: Environment (`dev`, `test`, or `prod`) - default: `dev`
- `region`: AWS region - default: `us-east-1`
- `profile`: AWS profile name - default: `datahub-rep`

**What the script does:**
1. Unsets existing AWS environment credentials (like InstallGuide.ipynb)
2. Sets AWS profile and region
3. Verifies AWS credentials
4. Gets RDS endpoint from AWS
5. Tests database connection
6. Asks for confirmation
7. Runs all SQL scripts in order:
   - `01_create_user_roles.sql` - Creates database users and roles
   - `02_create_base_db.sql` - Creates tables, views, functions
   - `03_populate_base_tables.sql` - Populates lookup tables
   - `04_populate_variable_tables.sql` - Populates variable data
   - `05_populate_test_data.sql` - Adds test data (optional, for dev/test environments only)

**Note:** The script follows the same AWS credential handling as InstallGuide.ipynb to ensure it uses the correct AWS account.


## Post-Deployment Steps

### Update Secrets Manager

After deployment, update the `application_{ENV}` secret with correct credentials:

```bash
# Get current secret
aws secretsmanager get-secret-value \
  --secret-id application_dev \
  --query SecretString \
  --output text > secret.json

# Edit secret.json to update:
# - "host": RDS endpoint
# - "dbname": "datahub_{ENV}"
# - "dbuser": "datahubpostgres{ENV}" (This is RDS master role or use other roles created by 01_create_user_roles.sql)
# - "password": password for dbuser

# Update secret
aws secretsmanager update-secret \
  --secret-id application_dev \
  --secret-string file://secret.json

# Clean up
rm secret.json
```

