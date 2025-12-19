# OpenSearch Reindex AWS Lambda

## Overview
This is the AWS Lambda version of the OpenSearch reindex script. It refreshes OpenSearch indices by pulling data from PostgreSQL and indexing it into AWS OpenSearch Service.

**⚠️ Deployment Order**: 
1. Create Lambda layer (`create_layer.sh`) - **MUST BE FIRST**
2. Upload Lambda code (`deploy_aws.sh`)
3. Deploy Lambda via CloudFormation

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
- **`requirements_aws.txt`** - Python dependencies for AWS Lambda (used by layer)
- **`create_layer.sh`** - Creates Lambda layer with dependencies (run first)
- **`deploy_aws.sh`** - Packages and uploads Lambda code to S3

### Index Mapping Files
- **`search_index_mapping.json`** - Study search index mapping
- **`variable_index_mapping.json`** - Variable search index mapping
- **`autocomplete_index_mapping.json`** - Autocomplete index mapping

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

The Lambda function is deployed in three steps:
1. **Create Lambda Layer** (using `create_layer.sh`) - **MUST BE DONE FIRST**
2. **Upload Lambda code to S3** (using `deploy_aws.sh`)
3. **Deploy Lambda via CloudFormation** (creates/updates the Lambda function)

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

#### Step 1: Create Lambda Layer (REQUIRED FIRST)

**⚠️ IMPORTANT**: You must create the Lambda layer **before** deploying the Lambda function. The Lambda function depends on this layer for its dependencies (psycopg2-binary, opensearch-py, etc.).

```bash
cd ~/dataHub/datahub-development/opensearch/opensearch_reindex

# Create layer for dev environment
./create_layer.sh dependency-layer us-east-1 datahub-rep

# For test environment
./create_layer.sh dependency-layer us-east-1 datahub-rep

# For prod environment
./create_layer.sh dependency-layer us-east-1 datahub-rep
```

**Script Usage:**
```bash
./create_layer.sh [layer-name] [region] [profile]
```

- **layer-name**: Name of the Lambda layer (default: `dependency-layer`)
- **region**: AWS region (default: `us-east-1`)
- **profile**: AWS CLI profile (default: `datahub-rep`)

**What the script does:**
1. Uses Docker to build ARM64-compatible Python dependencies
2. Packages dependencies into a Lambda layer ZIP
3. Publishes the layer to AWS Lambda
4. Outputs the Layer ARN for use in CloudFormation

**Prerequisites:**
- Docker must be installed and running
- AWS CLI configured with appropriate credentials
- Lambda permissions to publish layers

**Note: The script will output the Layer ARN. Make sure this ARN matches what's configured in `Lambda.yaml` (or update `Lambda.yaml` with the new ARN).**

#### Step 3: Upload Lambda Code to S3

Before or after deploying the Lambda CloudFormation stack, upload the Lambda code:

```bash
cd ~/dataHub/datahub-development/opensearch/opensearch_reindex

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
1. Packages Lambda code with mapping files (dependencies come from the layer)
2. Uploads to S3: `s3://datahub-lambda-artifacts-{DataHubUniqueId}-{ENV}/opensearch-refresh/opensearch-refresh-lambda.zip`
3. (Optional) Updates existing Lambda function code if already deployed

**Note:** 
- Dependencies (psycopg2-binary, opensearch-py, etc.) are provided by the Lambda layer created in Step 1
- The deployment package only contains your code and mapping files
- You can upload code before or after CloudFormation deployment:
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

**Note**: 
- If you only changed the Lambda code (not dependencies), you only need to run `deploy_aws.sh`
- If you need to update dependencies (e.g., upgrade psycopg2-binary or opensearch-py), you must:
  1. Recreate the layer: `./create_layer.sh dependency-layer us-east-1 datahub-rep`
  2. **Update the layer ARN** in `datahub-cloud-replication/modules/Lambda.yaml` (at line 272). 
  3. Redeploy the Lambda CloudFormation stack

## AWS Secrets Manager Configuration

### Required Secret Structure

**Secret Name:** `application_{ENV}` where `{ENV}` is `dev`, `test`, or `prod`

Examples: `application_dev`, `application_test`, `application_prod`

**Secret Value (JSON):**

The secret is created by the SecretsManager CloudFormation stack and contains the following required fields:

```json
{
  "SEARCH_HOST": "vpc-datahub-opensearch-dev-xxxxx.us-east-1.es.amazonaws.com",
  "SEARCH_USERNAME": "opensearch",
  "SEARCH_PASSWORD": "Changeme@2025",
  "host": "datahub-dev-db-proxy.proxy-xxxxx.us-east-1.rds.amazonaws.com",
  "port": "5432",
  "dbname": "datahub_dev",
  "dbuser": "datahub_user",
  "password": "your-db-password",
  "dbDriverClassName": "org.postgresql.Driver"
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
