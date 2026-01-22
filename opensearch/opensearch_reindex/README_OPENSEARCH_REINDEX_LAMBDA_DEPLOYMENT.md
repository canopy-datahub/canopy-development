# OpenSearch Reindex AWS Lambda

## Overview
This is the AWS Lambda version of the OpenSearch reindex script. It refreshes OpenSearch indices by pulling data from PostgreSQL and indexing it into AWS OpenSearch Service.

**⚠️ Deployment Order**: 
1. Create Lambda layer (`create_layer.py`) - **MUST BE FIRST**
2. Upload Lambda code (`deploy_lambda.py`)
3. Deploy Lambda via CloudFormation

## Architecture

```
AWS Lambda
    ↓
    ├─→ AWS Secrets Manager (get credentials)
    ├─→ RDS PostgreSQL (fetch data)
    └─→ AWS OpenSearch Service (index data)
```

## Files

### Core Files
- **`opensearch_reindex_aws.py`** - AWS Lambda handler (production)
- **`create_layer.py`** - Python script to create Lambda layer with dependencies (run first)
- **`deploy_lambda.py`** - Python script to package and upload Lambda code to S3

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
1. **Create Lambda Layer** (using `create_layer.py`) - **MUST BE DONE FIRST**
2. **Upload Lambda code to S3** (using `deploy_lambda.py`)
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
1. **AWS CLI** configured with appropriate credentials
2. **Python 3.11+** (for running the deployment scripts)
3. **Docker** (for building the Lambda layer)
4. Access to S3 bucket: `datahub-lambda-artifacts-{DataHubUniqueId}-{ENV}`
5. Secrets Manager configured (see below)

### Deployment Steps

#### Step 1: Create Lambda Layer (REQUIRED FIRST)

**⚠️ IMPORTANT**: You must create the Lambda layer **before** deploying the Lambda function. The Lambda function depends on this layer for its dependencies (psycopg2-binary, opensearch-py, etc.).

```bash
cd ~/dataHub/datahub-development/opensearch/opensearch_reindex

# Create layer for dev environment
python create_layer.py dependency-layer us-east-1 datahub-rep

# For test environment
python create_layer.py dependency-layer us-east-1 datahub-rep

# For prod environment
python create_layer.py dependency-layer us-east-1 datahub-rep
```

**Script Usage:**
```bash
python create_layer.py [layer-name] [region] [profile]
```

**Parameters:**

- **layer-name**: Name of the Lambda layer (default: `dependency-layer`)
- **region**: AWS region (default: `us-east-1`)
- **profile**: AWS CLI profile (default: `datahub-rep`)

#### What the script does

1. ✅ Validates Docker is installed and running
2. 🐳 Uses Docker to build ARM64-compatible Python dependencies
   - `psycopg2-binary==2.9.9`
   - `opensearch-py`
   - `requests-aws4auth`
   - `boto3`
   - `requests`
3. 📦 Packages dependencies into a Lambda layer ZIP
4. ☁️ Publishes the layer to AWS Lambda
5. 📋 Outputs the Layer ARN for use in CloudFormation

#### Important Notes

- The script will output the **Layer ARN**
- Make sure this ARN matches what's configured in [`Lambda.yaml`](../../../datahub-cloud-replication/modules/Lambda.yaml) (line 272)
- If the ARN is different, update `Lambda.yaml` with the new ARN before deploying the Lambda stack

#### Step 2: Upload Lambda Code to S3

Before deploying the Lambda CloudFormation stack, upload the Lambda code.

```bash
cd ~/dataHub/datahub-development/opensearch/opensearch_reindex

# Upload to dev environment
python deploy_lambda.py dev stanford

# Upload to test environment
python deploy_lambda.py test stanford

# Upload to prod environment
python deploy_lambda.py prod stanford
```

**Script Usage:**
```bash
python deploy_lambda.py [env] [DataHubUniqueId]
```

**Parameters:**

- **env**: `dev`, `test`, or `prod` (default: `dev`)
- **DataHubUniqueId**: Unique identifier for S3 bucket (default: `stanford`)
  - S3 bucket: `datahub-lambda-artifacts-{DataHubUniqueId}-{env}`

#### What the script does

1. ✅ Validates environment and required files
2. 📦 Packages Lambda code with mapping files:
   - `opensearch_reindex_aws.py`
   - `search_index_mapping.json`
   - `variable_index_mapping.json`
   - `autocomplete_index_mapping.json`
3. ⬆️ Uploads to S3: `s3://datahub-lambda-artifacts-{DataHubUniqueId}-{ENV}/opensearch-refresh/opensearch-refresh-lambda.zip`
4. 📋 Displays next steps for deployment

#### Important Notes

- **Dependencies are NOT included** in the ZIP (they come from the Lambda layer created in Step 1)
- The deployment package **only contains code and mapping files** 

### Step 3: Deploy Lambda via CloudFormation

After creating the layer (Step 1) and uploading the code (Step 2), deploy the Lambda function using CloudFormation.

Follow [`InstallGuide.ipynb`](../../../datahub-cloud-replication/InstallGuide.ipynb) and run the **Lambda Stack** deployment step.

---

## Updating Lambda After Deployment

### Updating Lambda Code Only

If you only changed the Lambda code (not dependencies)
1. **Upload the new code**

```bash
python deploy_lambda.py [env] [DataHubUniqueId]
```

2. **Redeploy the Lambda CloudFormation stack** (via `InstallGuide.ipynb`)

### Updating Lambda Dependencies

If you need to update dependencies (e.g., upgrade `psycopg2-binary` or `opensearch-py`):

1. **Recreate the layer:**
   ```bash
   python create_layer.py dependency-layer us-east-1 datahub-rep
   ```

2. **Update the Layer ARN** in [`Lambda.yaml`](../../../datahub-cloud-replication/modules/Lambda.yaml) at line 272

3. **Redeploy the Lambda CloudFormation stack** (via `InstallGuide.ipynb`)

## Post-Deployment Steps - Updates Secrets 
### Required Secret Structure

**Secret Name:** `application_{ENV}` where `{ENV}` is `dev`, `test`, or `prod`

Examples: `application_dev`, `application_test`, `application_prod`

**Secret Value (JSON):**

The secret is created by the SecretsManager CloudFormation stack and contains the following required fields:

```json
{
  "SEARCH_HOST": "vpc-datahub-opensearch-dev-xxxxx.us-east-1.es.amazonaws.com",
  "SEARCH_USERNAME": "${OpenSearchUsername}",
  "SEARCH_PASSWORD": "${OpenSearchPassword}",
}
```
`SEARCH_USERNAME` and `SEARCH_PASSWORD` are configured in the datahub-cloud-replication/parameter-{ENV}.json. These credentials should be set before the OpenSearch deployment. 

`SEARCH_HOST` need to be updated in the SecretsManager CloudFormation after the OpenSearch deployment.


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
##### Method 1: Update via AWS CLI 
```bash
# Get current secret
aws secretsmanager get-secret-value \
  --secret-id application_dev \
  --query SecretString \
  --output text > current_secret.json

# Edit the JSON file to update SEARCH_HOST.
# Then update the secret:
aws secretsmanager update-secret \
  --secret-id application_dev \
  --secret-string file://current_secret.json

# Clean up
rm current_secret.json
```

##### Method 2: Update via CloudFormation Template

Alternatively, you can edit the secret directly in [`SecretsManager.yaml`](../../../datahub-cloud-replication/modules/SecretsManager.yaml) and redeploy the stack. 

Edit `SEARCH_HOST` stored in `SecretsManager.yaml` at line 96

**Then redeploy the SecretsManager stack:**

Follow [`InstallGuide.ipynb`](../../../datahub-cloud-replication/InstallGuide.ipynb) and rerun:
- **Step 4**: Set environment
- **Step 14**: Deploy SecretsManager stack (with updated Opensearch host)
This ensures all secrets are properly updated in AWS Secrets Manager.

---

## Quick Reference

### Full Deployment Workflow

```bash
# Navigate to directory
cd ~/dataHub/datahub-development/opensearch/opensearch_reindex

# Step 1: Create Lambda layer (REQUIRED FIRST)
python create_layer.py dependency-layer us-east-1 datahub-rep

# Step 2: Upload Lambda code
python deploy_lambda.py dev stanford

# Step 3: Deploy Lambda via CloudFormation (see Lambda Deployment in the InstallGuide.ipynb)

# Step 4: Redeploy SecretsManager via CloudFormation (see SecretsManager Deployment in the InstallGuide.ipynb)
```