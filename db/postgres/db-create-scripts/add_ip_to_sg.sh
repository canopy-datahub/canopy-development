#!/bin/bash

# Script to add your IP to RDS security group
# Usage: ./add_ip_to_sg.sh [dev|test|prod] [region] [profile]

set -e

ENV=${1:-dev}
AWS_DEFAULT_REGION=${2:-us-east-1}
AWS_PROFILE=${3:-${AWS_PROFILE:-datahub-rep}}

# Unset existing AWS credentials
unset AWS_ACCESS_KEY_ID
unset AWS_SECRET_ACCESS_KEY
unset AWS_SESSION_TOKEN

# Set AWS profile and region
export AWS_PROFILE="$AWS_PROFILE"
export AWS_DEFAULT_REGION="$AWS_DEFAULT_REGION"

echo "========================================="
echo "Add IP to RDS Security Group"
echo "Environment: $ENV"
echo "AWS Region: $AWS_DEFAULT_REGION"
echo "AWS Profile: $AWS_PROFILE"
echo "========================================="
echo ""

# Get your public IP
echo "Getting your public IP..."
MY_IP=$(curl -s https://checkip.amazonaws.com)
if [ -z "$MY_IP" ]; then
    echo "Error: Could not determine your public IP"
    exit 1
fi
echo "✓ Your IP: $MY_IP"
echo ""

# Get security group ID
echo "Getting security group ID..."
SG_ID=$(aws ec2 describe-security-groups \
  --filters "Name=group-name,Values=datahub-db-sg-$ENV" \
  --region $AWS_DEFAULT_REGION \
  --query 'SecurityGroups[0].GroupId' \
  --output text)

if [ -z "$SG_ID" ] || [ "$SG_ID" == "None" ]; then
    echo "Error: Could not find security group 'datahub-db-sg-$ENV'"
    echo "Make sure the RDS stack is deployed."
    exit 1
fi
echo "✓ Security Group ID: $SG_ID"
echo ""

# Check if IP is already authorized
echo "Checking if IP is already authorized..."
EXISTING=$(aws ec2 describe-security-groups \
  --group-ids $SG_ID \
  --region $AWS_DEFAULT_REGION \
  --query "SecurityGroups[0].IpPermissions[?FromPort==\`5432\`].IpRanges[?CidrIp==\`$MY_IP/32\`].CidrIp" \
  --output text)

if [ ! -z "$EXISTING" ]; then
    echo "✓ Your IP ($MY_IP/32) is already authorized"
    exit 0
fi

# Add IP to security group
echo "Adding your IP to security group..."
aws ec2 authorize-security-group-ingress \
  --group-id $SG_ID \
  --protocol tcp \
  --port 5432 \
  --cidr $MY_IP/32 \
  --region $AWS_DEFAULT_REGION

if [ $? -eq 0 ]; then
    echo "✓ Successfully added $MY_IP/32 to security group"
    echo ""
    echo "You can now connect to the RDS instance!"
    echo "Run: ./deploy_to_rds.sh $ENV $AWS_DEFAULT_REGION $AWS_PROFILE"
else
    echo "✗ Failed to add IP to security group"
    exit 1
fi

