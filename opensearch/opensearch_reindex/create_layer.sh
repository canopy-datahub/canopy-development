#!/bin/bash
# create_complete_arm64_layer.sh
#
# Creates a Lambda layer with all dependencies for ARM64 architecture
# Dependencies: psycopg2-binary, opensearch-py, requests-aws4auth, boto3, requests
#
# Usage: ./create_complete_arm64_layer.sh [layer-name] [region] [profile]
# Example: ./create_complete_arm64_layer.sh dependency-layer us-east-1 datahub-rep

set -e

LAYER_NAME="${1:-dependency-layer}"
REGION="${2:-us-east-1}"
PROFILE="${3:-datahub-rep}"

echo "=========================================="
echo "Creating Complete Lambda Layer"
echo "=========================================="
echo ""
echo "Layer Name:    $LAYER_NAME"
echo "Architecture:  ARM64 (aarch64)"
echo "Runtime:       Python 3.11"
echo "Region:        $REGION"
echo "Profile:       $PROFILE"
echo ""
echo "Dependencies:"
echo "  - psycopg2-binary (PostgreSQL adapter)"
echo "  - opensearch-py (OpenSearch client)"
echo "  - requests-aws4auth (AWS auth for requests)"
echo "  - boto3 (AWS SDK - optional, already in runtime)"
echo "  - requests (HTTP library - dependency of above)"
echo ""
echo "=========================================="
echo ""

# Check Docker is installed
if ! command -v docker &> /dev/null; then
    echo "❌ ERROR: Docker is required but not installed"
    echo ""
    echo "Install Docker:"
    echo "  macOS:   brew install --cask docker"
    echo "  Linux:   sudo apt-get install docker.io"
    echo "  Windows: https://www.docker.com/products/docker-desktop"
    echo ""
    exit 1
fi

# Check Docker is running
if ! docker ps &> /dev/null; then
    echo "❌ ERROR: Docker is not running"
    echo "Please start Docker and try again"
    exit 1
fi

echo "✅ Docker is available and running"
echo ""

# Clean up previous builds
echo "Step 1: Cleaning up previous builds..."
rm -rf python layer.zip build_output.log
echo "✅ Cleaned up"
echo ""

# Create directory structure
echo "Step 2: Creating layer structure..."
mkdir -p python
echo "✅ Created python/ directory"
echo ""

# Install dependencies using Docker
echo "Step 3: Installing dependencies using Docker..."
echo "This may take 2-3 minutes..."
echo ""

docker run --rm \
  --platform linux/arm64 \
  --entrypoint /bin/bash \
  -v "$PWD":/var/task \
  public.ecr.aws/lambda/python:3.11-arm64 \
  -c "
    set -e
    cd /var/task
    
    echo '=== Installing dependencies ==='
    pip install \
      psycopg2-binary==2.9.9 \
      opensearch-py \
      requests-aws4auth \
      boto3 \
      requests \
      -t python/ \
      --no-cache-dir \
      --upgrade
    
    echo ''
    echo '=== Installation Summary ==='
    pip list --path python/ --format columns
    
    echo ''
    echo '=== Verifying psycopg2 binary ==='
    find python/psycopg2 -name '_psycopg*.so' -exec ls -lh {} \;
    
    echo ''
    echo '=== Checking binary architecture ==='
    find python/psycopg2 -name '_psycopg*.so' | head -1 | xargs -I {} sh -c 'echo \"Binary: {}\" && ls -lh {}'
  " 2>&1 | tee build_output.log

if [ ${PIPESTATUS[0]} -ne 0 ]; then
    echo ""
    echo "❌ ERROR: Docker build failed"
    echo "Check build_output.log for details"
    exit 1
fi

echo ""
echo "✅ Docker build completed"
echo ""

# Verify the binary exists and is correct architecture
echo "Step 4: Verifying layer contents locally..."
echo ""

# Check python directory exists
if [ ! -d "python" ]; then
    echo "❌ ERROR: python/ directory was not created"
    exit 1
fi

echo "✅ python/ directory exists"

# Check psycopg2 exists
if [ ! -d "python/psycopg2" ]; then
    echo "❌ ERROR: psycopg2 was not installed"
    echo ""
    echo "Contents of python/:"
    ls -la python/
    exit 1
fi

echo "✅ psycopg2 package found"

# Check for the binary
BINARY=$(find python/psycopg2 -name "_psycopg*.so" 2>/dev/null | head -1)
if [ -z "$BINARY" ]; then
    echo "❌ ERROR: psycopg2 binary not found"
    echo ""
    echo "Contents of python/psycopg2/:"
    ls -la python/psycopg2/
    exit 1
fi

echo "✅ Binary found: $(basename $BINARY)"

# Verify architecture
if echo "$BINARY" | grep -q "aarch64"; then
    echo "✅ Binary name indicates ARM64 (aarch64)"
else
    echo "⚠️  WARNING: Binary name doesn't contain 'aarch64'"
    echo "   Binary: $BINARY"
    echo ""
    read -p "Continue anyway? (y/n) " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        echo "Aborted"
        exit 1
    fi
fi

# Check other dependencies
echo ""
echo "Checking other dependencies:"
for dep in opensearchpy requests_aws4auth boto3 requests; do
    if [ -d "python/$dep" ] || ls python/${dep}* 2>/dev/null | grep -q .; then
        echo "  ✅ $dep"
    else
        echo "  ⚠️  $dep (might be named differently)"
    fi
done

echo ""
echo "Layer directory size:"
du -sh python/

echo ""

# Create ZIP
echo "Step 5: Creating ZIP archive..."
zip -r layer.zip python/ -q

if [ $? -ne 0 ]; then
    echo "❌ ERROR: Failed to create ZIP file"
    exit 1
fi

LAYER_SIZE=$(du -h layer.zip | cut -f1)
echo "✅ Layer ZIP created: $LAYER_SIZE"

# Verify ZIP contents
echo ""
echo "Verifying ZIP contents..."
ZIP_CHECK=$(unzip -l layer.zip | grep -c "python/psycopg2/_psycopg.*\.so")
if [ "$ZIP_CHECK" -eq 0 ]; then
    echo "❌ ERROR: psycopg2 binary not found in ZIP!"
    echo ""
    echo "ZIP contents:"
    unzip -l layer.zip | head -30
    exit 1
fi

echo "✅ ZIP contains psycopg2 binary"
echo ""

# Get AWS account ID
echo "Step 6: Getting AWS account information..."
ACCOUNT_ID=$(aws sts get-caller-identity --profile "$PROFILE" --query Account --output text 2>/dev/null)

if [ -z "$ACCOUNT_ID" ]; then
    echo "❌ ERROR: Failed to get AWS account ID"
    echo "Please check your AWS profile: $PROFILE"
    exit 1
fi

echo "✅ AWS Account ID: $ACCOUNT_ID"
echo ""

# Publish layer
echo "Step 7: Publishing layer to AWS Lambda..."
echo "This may take 1-2 minutes for large layers..."
echo ""

LAYER_OUTPUT=$(aws lambda publish-layer-version \
  --layer-name "$LAYER_NAME" \
  --description "Complete dependencies for ARM64 Python 3.11 - Built $(date +%Y-%m-%d\ %H:%M)" \
  --zip-file fileb://layer.zip \
  --compatible-runtimes python3.11 \
  --compatible-architectures arm64 \
  --region "$REGION" \
  --profile "$PROFILE" \
  2>&1)

if [ $? -ne 0 ]; then
    echo "❌ ERROR: Failed to publish layer"
    echo ""
    echo "Error details:"
    echo "$LAYER_OUTPUT"
    echo ""
    
    # Check if it's a permissions issue
    if echo "$LAYER_OUTPUT" | grep -q "AccessDenied"; then
        echo "This appears to be a permissions issue."
        echo "Make sure your AWS profile has lambda:PublishLayerVersion permission"
    fi
    
    exit 1
fi

# Extract Layer ARN and Version
LAYER_ARN=$(echo "$LAYER_OUTPUT" | jq -r '.LayerVersionArn' 2>/dev/null)
LAYER_VERSION=$(echo "$LAYER_OUTPUT" | jq -r '.Version' 2>/dev/null)

if [ -z "$LAYER_ARN" ] || [ "$LAYER_ARN" = "null" ]; then
    echo "❌ ERROR: Could not extract Layer ARN from response"
    echo ""
    echo "Response:"
    echo "$LAYER_OUTPUT"
    exit 1
fi

echo "✅ Layer published successfully!"
echo ""

# Display results
echo "=========================================="
echo "SUCCESS!"
echo "=========================================="
echo ""
echo "Layer Details:"
echo "  Name:         $LAYER_NAME"
echo "  Version:      $LAYER_VERSION"
echo "  Architecture: arm64"
echo "  Runtime:      python3.11"
echo "  Size:         $LAYER_SIZE"
echo "  Region:       $REGION"
echo ""
echo "Layer ARN:"
echo "  $LAYER_ARN"
echo ""
echo "=========================================="
echo "CloudFormation Configuration"
echo "=========================================="
echo ""
echo "Add this to your Lambda in Lambda.yaml:"
echo ""
echo "OpenSearchReindexLambda:"
echo "  Type: AWS::Lambda::Function"
echo "  Properties:"
echo "    Architectures:"
echo "      - arm64"
echo "    Layers:"
echo "      - !Sub \"arn:aws:lambda:\${AWS::Region}:\${AWS::AccountId}:layer:${LAYER_NAME}:${LAYER_VERSION}\""
echo ""
echo "Or use the full ARN directly:"
echo "    Layers:"
echo "      - $LAYER_ARN"
echo ""


# Cleanup
echo "Cleaning up temporary files..."
rm -rf python layer.zip

echo "✅ Cleanup complete"
echo ""

echo "=========================================="
echo "✅ All Done!"
echo "=========================================="
echo ""

