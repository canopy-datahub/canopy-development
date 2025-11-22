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

## Deployment Methods

### Method 1: Automated Deployment Script (Recommended)

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

**Note:** The script follows the same AWS credential handling as InstallGuide.ipynb to ensure it uses the correct AWS account.

### Method 2: Manual Deployment

#### Step 1: Set Master Password

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

#### Step 2: Get RDS Endpoint

```bash
RDS_ENDPOINT=$(aws rds describe-db-instances \
  --db-instance-identifier datahub-postgresql-dev \
  --region us-east-1 \
  --query 'DBInstances[0].Endpoint.Address' \
  --output text)

echo "RDS Endpoint: $RDS_ENDPOINT"
```

#### Step 3: Test Connection

```bash
export PGPASSWORD="YourSecurePassword123!"

psql -h $RDS_ENDPOINT \
  -U datahubpostgresdev \
  -d datahub_dev \
  -c "SELECT version();"
```

#### Step 4: Run SQL Scripts

```bash
cd /Users/ycao77/dataHub/datahub-development/db/postgres/db-create-scripts

# Run scripts in order
psql -h $RDS_ENDPOINT -U datahubpostgresdev -d datahub_dev -f 01_create_user_roles.sql
psql -h $RDS_ENDPOINT -U datahubpostgresdev -d datahub_dev -f 02_create_base_db.sql
psql -h $RDS_ENDPOINT -U datahubpostgresdev -d datahub_dev -f 03_populate_base_tables.sql
psql -h $RDS_ENDPOINT -U datahubpostgresdev -d datahub_dev -f 04_populate_variable_tables.sql
psql -h $RDS_ENDPOINT -U datahubpostgresdev -d datahub_dev -f 05_populate_test_data.sql

# Clear password
unset PGPASSWORD
```

## Network Access

### Option 1: Public Access (Current Configuration)

RDS.yaml has `PubliclyAccessible: true`, so you can connect directly if:
1. Your IP is allowed in the security group
2. You have internet connectivity

**Add your IP to security group:**
```bash
# Get your public IP
MY_IP=$(curl -s https://checkip.amazonaws.com)

# Get security group ID
SG_ID=$(aws ec2 describe-security-groups \
  --filters "Name=group-name,Values=datahub-db-sg-dev" \
  --region us-east-1 \
  --query 'SecurityGroups[0].GroupId' \
  --output text)

# Add your IP
aws ec2 authorize-security-group-ingress \
  --group-id $SG_ID \
  --protocol tcp \
  --port 5432 \
  --cidr $MY_IP/32 \
  --region us-east-1
```

### Option 2: VPC Access (More Secure)

Connect from an EC2 instance or use AWS Systems Manager Session Manager:

```bash
# Connect to EC2 instance in same VPC
aws ssm start-session --target i-1234567890abcdef0

# Then run psql from EC2
psql -h datahub-postgresql-dev.xxxxx.us-east-1.rds.amazonaws.com \
  -U datahubpostgresdev \
  -d datahub_dev
```

### Option 3: SSH Tunnel via Bastion

```bash
# Create SSH tunnel
ssh -i ~/.ssh/your-key.pem -L 5432:$RDS_ENDPOINT:5432 ec2-user@bastion-host

# In another terminal, connect via tunnel
psql -h localhost -U datahubpostgresdev -d datahub_dev
```

## Post-Deployment Steps

### 1. Update Secrets Manager

After deployment, update the `application_{ENV}` secret with correct credentials:

```bash
# Get current secret
aws secretsmanager get-secret-value \
  --secret-id application_dev \
  --query SecretString \
  --output text > secret.json

# Edit secret.json to update:
# - "host": RDS endpoint
# - "dbname": "datahub_dev"
# - "dbuser": "datahub_user" (created by 01_create_user_roles.sql)
# - "password": password for datahub_user

# Update secret
aws secretsmanager update-secret \
  --secret-id application_dev \
  --secret-string file://secret.json

# Clean up
rm secret.json
```

### 2. Verify Schema

```bash
# List all tables
psql -h $RDS_ENDPOINT -U datahubpostgresdev -d datahub_dev -c "\dt"

# Check specific tables
psql -h $RDS_ENDPOINT -U datahubpostgresdev -d datahub_dev -c "
  SELECT table_name 
  FROM information_schema.tables 
  WHERE table_schema = 'public' 
  ORDER BY table_name;
"

# Verify data
psql -h $RDS_ENDPOINT -U datahubpostgresdev -d datahub_dev -c "
  SELECT COUNT(*) FROM variables;
  SELECT COUNT(*) FROM study;
"
```

### 3. Create Application User

The `01_create_user_roles.sql` script should create the `datahub_user` role. Verify:

```bash
psql -h $RDS_ENDPOINT -U datahubpostgresdev -d datahub_dev -c "\du"
```

### 4. Test Application Connectivity

Test that the Lambda/ECS services can connect:

```bash
# Test from Lambda (if deployed)
aws lambda invoke \
  --function-name DataHub-OpenSearchRefresh-dev \
  --payload '{}' \
  response.json

# Check logs for database connection
aws logs tail /aws/lambda/DataHub-OpenSearchRefresh-dev --follow
```

## Troubleshooting

### Connection Timeout

**Symptoms:**
```
psql: could not connect to server: Connection timed out
```

**Solutions:**
1. Check security group allows your IP on port 5432
2. Verify RDS instance is in "available" state
3. Check VPC routing and network ACLs

### Authentication Failed

**Symptoms:**
```
psql: FATAL: password authentication failed for user "datahubpostgresdev"
```

**Solutions:**
1. Verify you updated the master password
2. Check username matches: `datahubpostgres{ENV}`
3. Ensure password doesn't have special characters that need escaping

### Database Does Not Exist

**Symptoms:**
```
psql: FATAL: database "datahub_dev" does not exist
```

**Solutions:**
1. Verify RDS.yaml `DBName` parameter
2. Check CloudFormation stack created database
3. Create database manually if needed:
   ```bash
   psql -h $RDS_ENDPOINT -U datahubpostgresdev -d postgres -c "CREATE DATABASE datahub_dev;"
   ```

### Script Errors

**Symptoms:**
```
ERROR: relation "table_name" already exists
```

**Solutions:**
1. Scripts may have already run
2. Drop and recreate database if needed (dev/test only):
   ```bash
   psql -h $RDS_ENDPOINT -U datahubpostgresdev -d postgres -c "DROP DATABASE datahub_dev;"
   psql -h $RDS_ENDPOINT -U datahubpostgresdev -d postgres -c "CREATE DATABASE datahub_dev;"
   ```
3. Run scripts again

## Script Execution Order

The scripts must be run in this order:

1. **`01_create_user_roles.sql`** - Creates users and roles
   - Creates `datahub_admin` role
   - Creates `datahub_user` role
   - Sets up permissions

2. **`02_create_base_db.sql`** - Creates schema
   - Creates all tables
   - Creates views
   - Creates functions and triggers
   - Sets up indexes

3. **`03_populate_base_tables.sql`** - Populates lookup data
   - Inserts reference data
   - Populates entity types
   - Adds property definitions

4. **`04_populate_variable_tables.sql`** - Populates variable data
   - Inserts core variables
   - Adds variable properties
   - Sets up variable relationships

5. **`05_populate_test_data.sql`** - Adds test data (optional)
   - Creates test studies
   - Adds sample data
   - For dev/test environments only

## Security Best Practices

1. **Change Default Password**: Always update `REPLACEME` password
2. **Use Strong Passwords**: Minimum 12 characters, mixed case, numbers, symbols
3. **Limit Public Access**: Set `PubliclyAccessible: false` in production
4. **Use RDS Proxy**: Enable RDS Proxy for connection pooling and security
5. **Enable SSL**: Require SSL connections in production
6. **Rotate Credentials**: Regularly rotate database passwords
7. **Use Secrets Manager**: Store credentials in Secrets Manager, not in code
8. **Audit Access**: Enable RDS audit logging

## Production Considerations

For production deployment:

1. **Backup First**: Create snapshot before running scripts
   ```bash
   aws rds create-db-snapshot \
     --db-instance-identifier datahub-postgresql-prod \
     --db-snapshot-identifier datahub-prod-pre-deployment-$(date +%Y%m%d)
   ```

2. **Test in Lower Environment**: Always test in dev/test first

3. **Schedule Maintenance Window**: Run during low-traffic period

4. **Monitor Performance**: Watch CloudWatch metrics during deployment

5. **Have Rollback Plan**: Keep backup and rollback scripts ready

6. **Skip Test Data**: Don't run `05_populate_test_data.sql` in production

## Support

For issues:
1. Check CloudWatch Logs for RDS
2. Review RDS Events in AWS Console
3. Verify security group and network configuration
4. Check database parameter group settings

