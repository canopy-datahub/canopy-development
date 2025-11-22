# OpenSearch Reindex AWS Lambda

## Overview
This is the AWS Lambda version of the OpenSearch reindex script. It refreshes OpenSearch indices by pulling data from PostgreSQL and indexing it into AWS OpenSearch Service.

## Architecture

```
AWS Lambda (VPC)
    ↓
    ├─→ AWS Secrets Manager (get credentials)
    ├─→ RDS PostgreSQL (fetch data)
    └─→ AWS OpenSearch Service (index data)
```

## Files

### Core Files
- **`opensearch_reindex_aws.py`** - AWS Lambda handler (production)
- **`opensearch_reindex_local.py`** - Local development script
- **`requirements_aws.txt`** - Python dependencies for AWS Lambda
- **`deploy_aws.sh`** - Automated deployment script

### Index Mapping Files
- **`search_index_mapping.json`** - Study search index mapping
- **`variable_index_mapping.json`** - Variable search index mapping
- **`autocomplete_index_mapping.json`** - Autocomplete index mapping

### Configuration Files
- **`config_local.py`** - Local development configuration (not deployed to Lambda)

## Key Differences: AWS vs Local

| Feature | AWS Lambda | Local Script |
|---------|-----------|--------------|
| OpenSearch Connection | AWS OpenSearch Service (IAM auth) | Local Docker (basic auth) |
| Database Connection | RDS via VPC | Local PostgreSQL |
| Configuration | AWS Secrets Manager | config_local.py |
| Authentication | AWS4Auth (IAM) | Username/Password |
| SSL/TLS | Required (port 443) | Disabled (port 9200) |
| Docker Management | N/A | Auto-starts containers |

## AWS Lambda Handler

### Function Signature
```python
def lambda_handler(event, context):
    """
    Args:
        event: {
            "indices": ["study_search", "variable_search", "autocomplete"]  # Optional
        }
        context: Lambda context
    
    Returns:
        {
            "statusCode": 200,
            "body": {
                "message": "OpenSearch indices refreshed successfully",
                "results": {
                    "study_search": {"status": "completed", "documents": 150},
                    "variable_search": {"status": "completed", "documents": 2500},
                    "autocomplete": {"status": "completed", "documents": 300}
                }
            }
        }
    """
```

### Event Parameters
- **`indices`** (optional): Array of indices to refresh. Default: all indices
  - Options: `["study_search", "variable_search", "autocomplete"]`

### Examples

**Refresh all indices:**
```json
{}
```

**Refresh specific indices:**
```json
{
  "indices": ["study_search", "variable_search"]
}
```

## Deployment

The Lambda function is deployed in two steps:
1. **Upload Lambda code to S3** (using `deploy_aws.sh`)
2. **Deploy Lambda via CloudFormation** (creates/updates the Lambda function)

### Prerequisites

#### Required CloudFormation Stacks (Deploy First)
The following stacks must be deployed **before** the Lambda stack (see `InstallGuide.ipynb`):

1. ✅ **Networking** - VPC, Subnets, Security Groups
2. ✅ **S3** - Creates `datahub-lambda-artifacts-{DataHubUniqueId}-{ENV}` bucket
3. ✅ **SecretsManager** - Creates `application_{ENV}` secret
4. ✅ **LoadBalancer** - Application Load Balancer (for VPC imports)
5. ✅ **RDS** - PostgreSQL database
6. ✅ **OpenSearch** - OpenSearch domain

Where `{ENV}` is one of: `dev`, `test`, or `prod`

#### Additional Requirements
1. AWS CLI configured with appropriate credentials
2. Python 3.11
3. Access to S3 bucket: `datahub-lambda-artifacts-{DataHubUniqueId}-{ENV}`
4. Secrets Manager configured (see below)

### Deployment Steps

#### Step 1: Deploy CloudFormation Stacks

Follow the complete deployment guide in `InstallGuide.ipynb` to deploy all required CloudFormation stacks, including the Lambda stack.

The Lambda CloudFormation stack deployment is covered in **Section 17** of the InstallGuide.

#### Step 2: Upload Lambda Code to S3

Before or after deploying the Lambda CloudFormation stack, upload the Lambda code:

```bash
cd /Users/ycao77/dataHub/datahub-development/opensearch/opensearch_reindex

# Upload to dev environment
./deploy_aws.sh dev stanford

# Upload to test environment
./deploy_aws.sh test stanford

# Upload to prod environment
./deploy_aws.sh prod stanford
```

**Script Usage:**
```bash
./deploy_aws.sh [env] [DataHubUniqueId]
```

- **env**: `dev`, `test`, or `prod` (default: `dev`)
- **DataHubUniqueId**: Unique identifier for S3 bucket (default: `stanford`)
  - S3 bucket: `datahub-lambda-artifacts-{DataHubUniqueId}-{env}`

**What the script does:**
1. Installs Python dependencies for arm64
2. Packages Lambda code with mapping files
3. Uploads to S3: `s3://datahub-lambda-artifacts-{DataHubUniqueId}-{ENV}/opensearch-refresh/opensearch-refresh-lambda.zip`
4. (Optional) Updates existing Lambda function code if already deployed

**Note:** You can upload code before or after CloudFormation deployment:
- **Before**: Upload code first, then deploy CloudFormation stack (Lambda will use the code immediately)
- **After**: Deploy CloudFormation stack first (will fail to run), then upload code and update Lambda

### Updating Lambda Code (After Initial Deployment)

Once the Lambda is deployed via CloudFormation, you can update just the code without redeploying the entire stack:

```bash
# Upload new code to S3 and optionally update Lambda
./deploy_aws.sh dev stanford

# The script will ask if you want to update the Lambda immediately
```

Or manually update:
```bash
aws lambda update-function-code \
  --function-name DataHub-OpenSearchRefresh-dev \
  --s3-bucket datahub-lambda-artifacts-{DataHubUniqueId}-dev \
  --s3-key opensearch-refresh/opensearch-refresh-lambda.zip
```

## AWS Secrets Manager Configuration

### Required Secret Structure

**Secret Name:** `application_{ENV}` where `{ENV}` is `dev`, `test`, or `prod`

Examples: `application_dev`, `application_test`, `application_prod`

**Secret Value (JSON):**

The secret is created by the SecretsManager CloudFormation stack and contains the following required fields:

```json
{
  "opensearch.hostname": "vpc-datahub-opensearch-dev-xxxxx.us-east-1.es.amazonaws.com",
  "opensearch.port": "443",
  "opensearch.scheme": "https",
  "opensearch.username": "opensearch",
  "opensearch.password": "your-opensearch-password",
  "host": "datahub-dev-db-proxy.proxy-xxxxx.us-east-1.rds.amazonaws.com",
  "port": "5432",
  "dbname": "DataHub_dev",
  "dbuser": "datahub_user",
  "password": "your-db-password",
  "engine": "postgres"
}
```

**Note:** The secret contains many other fields used by other services. The Lambda only uses the fields listed above.

### Get OpenSearch Endpoint

```bash
# For dev environment
aws opensearch describe-domain \
  --domain-name datahub-opensearch-dev \
  --query 'DomainStatus.Endpoint' \
  --output text

# For test environment
aws opensearch describe-domain \
  --domain-name datahub-opensearch-test \
  --query 'DomainStatus.Endpoint' \
  --output text

# For prod environment
aws opensearch describe-domain \
  --domain-name datahub-opensearch-prod \
  --query 'DomainStatus.Endpoint' \
  --output text
```

### Update Secret

The secret is created by the SecretsManager CloudFormation stack. To update it:

```bash
# Get current secret
aws secretsmanager get-secret-value \
  --secret-id application_dev \
  --query SecretString \
  --output text > current_secret.json

# Edit the JSON file to update opensearch.hostname, host, passwords, etc.
# Then update the secret:
aws secretsmanager update-secret \
  --secret-id application_dev \
  --secret-string file://current_secret.json
```

**Important fields to update:**
- `opensearch.hostname`: Get from OpenSearch domain endpoint (see above)
- `opensearch.password`: Set OpenSearch master password
- `host`: RDS Proxy or RDS instance endpoint
- `dbname`: Database name (e.g., `DataHub_dev`)
- `dbuser`: Database username
- `password`: Database password

## Lambda Configuration

### Environment Variables
- **`REGION_NAME`**: AWS region (e.g., `us-east-1`)
- **`SECRET_NAME`**: Secrets Manager secret name (e.g., `application_dev`, `application_test`, `application_prod`)
- **`STUDY_SEARCH_INDEX`**: Study search index name (default: `study_search`)
- **`VARIABLE_SEARCH_INDEX`**: Variable search index name (default: `variable_search`)
- **`AUTOCOMPLETE_INDEX`**: Autocomplete index name (default: `study_autocomplete_v001`)

### Lambda Settings
- **Runtime**: Python 3.11
- **Architecture**: arm64
- **Memory**: 2048 MB
- **Timeout**: 900 seconds (15 minutes)
- **Ephemeral Storage**: 1024 MB

### VPC Configuration
- **Subnets**: Private subnets in 2 availability zones
- **Security Group**: ECS host security group (must allow access to RDS and OpenSearch)

### IAM Permissions Required

The Lambda execution role needs:

```json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "secretsmanager:GetSecretValue"
      ],
      "Resource": "arn:aws:secretsmanager:*:*:secret:application_*"
    },
    {
      "Effect": "Allow",
      "Action": [
        "es:ESHttpGet",
        "es:ESHttpPut",
        "es:ESHttpPost",
        "es:ESHttpDelete"
      ],
      "Resource": "arn:aws:es:*:*:domain/datahub-opensearch-*/*"
    },
    {
      "Effect": "Allow",
      "Action": [
        "ec2:CreateNetworkInterface",
        "ec2:DescribeNetworkInterfaces",
        "ec2:DeleteNetworkInterface"
      ],
      "Resource": "*"
    },
    {
      "Effect": "Allow",
      "Action": [
        "logs:CreateLogGroup",
        "logs:CreateLogStream",
        "logs:PutLogEvents"
      ],
      "Resource": "arn:aws:logs:*:*:*"
    }
  ]
}
```

## Testing

### Invoke Lambda

```bash
# Refresh all indices
aws lambda invoke \
  --function-name DataHub-OpenSearchRefresh-dev \
  --payload '{}' \
  response.json

cat response.json
```

### Refresh Specific Indices

```bash
# Only refresh study search
aws lambda invoke \
  --function-name DataHub-OpenSearchRefresh-dev \
  --payload '{"indices": ["study_search"]}' \
  response.json
```

### View Logs

```bash
# Tail logs in real-time
aws logs tail /aws/lambda/DataHub-OpenSearchRefresh-dev --follow

# Get recent logs
aws logs tail /aws/lambda/DataHub-OpenSearchRefresh-dev --since 1h
```

## Monitoring

### CloudWatch Metrics
- **Invocations**: Number of times Lambda is invoked
- **Duration**: Execution time
- **Errors**: Failed invocations
- **Throttles**: Rate-limited invocations

### CloudWatch Logs
Log groups: `/aws/lambda/DataHub-OpenSearchRefresh-{ENV}` where `{ENV}` is `dev`, `test`, or `prod`

Key log messages:
- `Successfully connected to OpenSearch: {host}`
- `Cluster health: {status}`
- `Successfully connected to PostgreSQL database`
- `Bulk indexing {count} documents into {index}`
- `Successfully bulk-indexed {count} documents`
- `Completed refresh for {index}: {count} documents`

## Scheduled Execution

### EventBridge Rule (CloudWatch Events)

Create a rule to run the Lambda on a schedule:

```bash
# Create rule to run daily at 2 AM UTC
aws events put-rule \
  --name DataHub-OpenSearchRefresh-Daily \
  --schedule-expression "cron(0 2 * * ? *)" \
  --state ENABLED

# Add Lambda as target
aws events put-targets \
  --rule DataHub-OpenSearchRefresh-Daily \
  --targets "Id"="1","Arn"="arn:aws:lambda:us-east-1:123456789012:function:DataHub-OpenSearchRefresh-dev"

# Grant EventBridge permission to invoke Lambda
aws lambda add-permission \
  --function-name DataHub-OpenSearchRefresh-dev \
  --statement-id DataHub-OpenSearchRefresh-Daily \
  --action lambda:InvokeFunction \
  --principal events.amazonaws.com \
  --source-arn arn:aws:events:us-east-1:123456789012:rule/DataHub-OpenSearchRefresh-Daily
```

## Troubleshooting

### Lambda Can't Connect to OpenSearch

**Symptoms:**
- Error: `Error connecting to OpenSearch`
- Timeout errors

**Solutions:**
1. Verify OpenSearch endpoint in Secrets Manager
2. Check security group allows Lambda → OpenSearch (port 443)
3. Verify Lambda is in correct VPC/subnets
4. Check IAM role has OpenSearch permissions

### Lambda Can't Connect to Database

**Symptoms:**
- Error: `Database connection error`
- `could not connect to server`

**Solutions:**
1. Verify database credentials in Secrets Manager
2. Check security group allows Lambda → RDS (port 5432)
3. Verify Lambda is in correct VPC/subnets
4. Test database connectivity from same VPC

### Lambda Timeout

**Symptoms:**
- Error: `Task timed out after 900.00 seconds`

**Solutions:**
1. Increase Lambda timeout (max 15 minutes)
2. Increase memory allocation (more memory = faster CPU)
3. Optimize database queries
4. Consider processing indices separately

### Package Too Large

**Symptoms:**
- Error uploading to Lambda
- Package size > 50MB

**Solutions:**
1. Use Lambda layers for large dependencies (psycopg2)
2. Remove unnecessary files from package
3. Use compiled dependencies for arm64

### Permission Denied

**Symptoms:**
- Error: `User is not authorized`
- `AccessDeniedException`

**Solutions:**
1. Check Lambda execution role has required permissions
2. Verify Secrets Manager resource policy
3. Check OpenSearch access policy

## Local Development

Use `opensearch_reindex_local.py` for local testing:

```bash
# Start local OpenSearch and PostgreSQL
docker-compose up -d

# Run local script
python opensearch_reindex_local.py
```

The local script will:
1. Try to connect to local OpenSearch
2. Auto-start Docker containers if needed
3. Wait for services to be ready
4. Refresh all indices

## Index Details

### Study Search Index
- **Name**: `study_search`
- **Documents**: Studies with status='Approved'
- **Source**: `view_study_for_es`
- **Document ID**: study_id

### Variable Search Index
- **Name**: `variable_search`
- **Documents**: Variables grouped by variable name
- **Source**: `view_variables` + `view_study`
- **Document ID**: variable name
- **Fields**: variable, variable_label, section, variable_id, study_name[], datatype, study_id[]

### Autocomplete Index
- **Name**: `study_autocomplete_v001`
- **Documents**: Unique property values for suggestions
- **Source**: `study_property_value` (specific entity_property_ids)
- **Document ID**: Sequential integer
- **Fields**: phrase, suggest.input[]

## Support

For issues or questions:
1. Check CloudWatch Logs for detailed error messages
2. Verify all prerequisites are met
3. Test connectivity from Lambda VPC
4. Review IAM permissions

