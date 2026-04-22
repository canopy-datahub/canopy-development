# RDS Database Deployment Guide

## Overview
This guide explains how to deploy the DataHub database schema to an AWS RDS PostgreSQL instance.

## Prerequisites

1. ✅ RDS instance deployed via CloudFormation (`${CANOPY_PROJECT_NAME}-RDS-${CANOPY_ENV}` stack)
2. ✅ Python 3.7+ installed (macOS/Linux/Windows)
3. ✅ PostgreSQL client (`psql`) installed and on PATH (macOS/Linux/Windows)
4. ✅ AWS CLI installed and on PATH with appropriate credentials
5. ✅ Network access to RDS (security group configured)

**Note:** The script automatically handles AWS credentials similar to InstallGuide.ipynb:
- Unsets any existing AWS environment credentials
- Uses AWS profile for authentication (default: `datahub-rep`)
- Sets region (default: `us-east-1`)

## Database Configuration

From [`RDS.yaml`](../../../canopy-cloud-replication/modules/RDS.yaml):
- **DB Instance Identifier**: `${CANOPY_PROJECT_NAME}-postgresql-${CANOPY_ENV}`
- **Database Name**: `${CANOPY_PROJECT_NAME}_${CANOPY_ENV}` (e.g., `datahub_dev`)
- **Master Username**: `${CANOPY_PROJECT_NAME}postgres${CANOPY_ENV}` (e.g., `datahubpostgresdev`)
- **Port**: `5432`
- **Engine**: PostgreSQL 16.9

## Deployment

### Automated Deployment Script

```bash
cd ${CANOPY_HOME}/canopy-development/db/postgres/db-create-scripts
```

**Script Usage:**
```bash
python deploy_to_rds.py --project-name <project-name> --env <env> --region <region> --profile <profile>

# Examples:
# Deploy to dev (uses default profile: datahub-rep, region: us-east-1)
python deploy_to_rds.py --project-name datahub --env dev

# Deploy with specific region and profile
python deploy_to_rds.py --project-name datahub --env dev --region us-east-2 --profile my-profile

# Deploy to test
python deploy_to_rds.py --project-name datahub --env test --region us-east-1 --profile datahub-rep

# Deploy to prod
python deploy_to_rds.py --project-name datahub --env prod --region us-east-1 --profile datahub-rep

# Deploy with custom project name
python deploy_to_rds.py --project-name myproject --env dev --region us-east-1 --profile datahub-rep
```

**Parameters:**
- `--project-name`: Project name (e.g., `canopy`) - **REQUIRED**
- `--env`: Environment (`dev`, `test`, or `prod`) - default: `dev`
- `--region`: AWS region - default: `us-east-1`
- `--profile`: AWS profile name - default: `datahub-rep`

**What the script does:**
1. Unsets existing AWS environment credentials
2. Sets AWS profile and region
3. Verifies AWS credentials
4. Gets RDS endpoint from AWS
5. Tests database connection
6. Asks for confirmation
7. Runs all SQL scripts in order:
   - `01_create_user_roles.sql` - Creates database users and roles
   - `02_create_base_db.sql` - Creates tables, views, functions
   - `03_populate_base_tables.sql` - Populates data in lookup tables
   - `04_populate_variable_tables.sql` - Populates variable data
   - `05_populate_test_data.sql` - Adds test data (optional, for dev/test environments only)

**Note:** The script follows the same AWS credential handling as InstallGuide.ipynb to ensure it uses the correct AWS account.


## Post-Deployment Steps

### Update Secrets Manager

After deployment, update the `application_${CANOPY_ENV}` secret with correct RDS credentials.

**⚠️ Important**: The values you set here must match your RDS configuration in [`RDS.yaml`](../../../canopy-cloud-replication/modules/RDS.yaml). If you modify the database name, username, or other settings in `RDS.yaml`, you must update them here as well.

#### Step 1: Get RDS Endpoint (Host)
The RDS endpoint should be printed when you run `deploy_to_rds.py`, if not, please run the following again to get the endpoint.

```bash
# Get RDS endpoint
aws rds describe-db-instances \
  --db-instance-identifier ${CANOPY_PROJECT_NAME}-postgresql-${CANOPY_ENV} \
  --region ${AWS_REGION} \
  --profile ${AWS_PROFILE} \
  --query 'DBInstances[0].Endpoint.Address' \
  --output text

# Example output: datahub-postgresql-dev.cyhmos66o8v8.us-east-1.rds.amazonaws.com
```

#### Step 2: Update Parameter Files

Before updating Secrets Manager, ensure the RDS credentials in your parameter files match:

**Files to update:**
- `canopy-cloud-replication/parameters-${CANOPY_ENV}.json`

**Update these parameters:**
```json
{
  "DataHubUserUsername": "datahub_user",
  "DataHubUserPassword": "REPLACEME"
}
```

**⚠️ Note**: These credentials are for the `datahub_user` role created by `01_create_user_roles.sql`, not the RDS master user.

**⚠️ Important Consistency Checks:**

1. **Database Name**: Must match between:
   - `RDS.yaml` → `DBName` parameter
   - `SecretsManager.yaml` → `dbname` field
   - This guide → `${CANOPY_PROJECT_NAME}_${CANOPY_ENV}`

2. **Database User**: Must match between:
   - `parameters-*.json` → `DataHubUserUsername`
   - `01_create_user_roles.sql` → role created

3. **Database Password**: Must match between:
   - `parameters-*.json` → `DataHubUserPassword`
   - `01_create_user_roles.sql` → role password
