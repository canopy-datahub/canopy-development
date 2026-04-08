#!/usr/bin/env python3
"""
deploy_lambda.py

OpenSearch Reindex AWS Lambda - Code Upload Script

This script uploads Lambda code to S3. After uploading, you need to:
1. Deploy the Lambda CloudFormation stack (first time), OR
2. Update the Lambda function code (if already deployed)

Usage: python deploy_lambda.py <project-name> <env> <unique-id>
Example: python deploy_lambda.py datahub dev stanford
         python deploy_lambda.py datahub test stanford
         python deploy_lambda.py myproject prod myorg
"""

import argparse
import os
import shutil
import subprocess
import sys
import zipfile
from pathlib import Path


class LambdaDeployer:
    """Deploys Lambda code to S3 for AWS Lambda deployment."""
    
    REQUIRED_FILES = [
        "opensearch_reindex_aws.py",
        "variable_index_mapping.json",
        "search_index_mapping.json",
        "autocomplete_index_mapping.json"
    ]
    
    def __init__(self, project_name: str, env: str, unique_id: str):
        self.project_name = project_name
        self.env = env
        self.unique_id = unique_id
        self.s3_bucket = f"{project_name}-lambda-artifacts-{unique_id}-{env}"
        self.lambda_function = f"{project_name}-OpenSearchRefresh-{env}"
        self.package_dir = Path("package")
        self.zip_file = Path("opensearch-refresh-lambda.zip")
        
    def print_header(self):
        """Print script header with configuration."""
        print("=" * 41)
        print("OpenSearch Reindex Lambda - Code Upload")
        print(f"Project Name: {self.project_name}")
        print(f"Environment: {self.env}")
        print(f"Unique ID: {self.unique_id}")
        print("=" * 41)
        print()
        print(f"S3 Bucket: {self.s3_bucket}")
        print(f"Lambda Function: {self.lambda_function}")
        print()
        
    def validate_environment(self):
        """Validate environment parameter."""
        valid_envs = ["dev", "test", "prod"]
        if self.env not in valid_envs:
            print(f"❌ ERROR: Invalid environment '{self.env}'")
            print(f"Valid options: {', '.join(valid_envs)}")
            sys.exit(1)
            
    def validate_files(self):
        """Validate required files exist."""
        missing_files = []
        for file_name in self.REQUIRED_FILES:
            if not Path(file_name).exists():
                missing_files.append(file_name)
                
        if missing_files:
            print("❌ ERROR: Required files not found:")
            for file_name in missing_files:
                print(f"  - {file_name}")
            print()
            print("Make sure you're running this script from the correct directory:")
            print("  cd ~/dataHub/datahub-development/opensearch/opensearch_reindex")
            sys.exit(1)
            
    def cleanup(self):
        """Clean up previous build."""
        print("Cleaning up previous build...")
        if self.package_dir.exists():
            shutil.rmtree(self.package_dir)
        if self.zip_file.exists():
            self.zip_file.unlink()
        print("✅ Cleaned up")
        print()
        
    def create_package(self):
        """Create package directory and copy source files."""
        print("Creating package directory...")
        self.package_dir.mkdir(exist_ok=True)
        print("✅ Package directory created")
        print()
        
        print("Copying source files...")
        for file_name in self.REQUIRED_FILES:
            src = Path(file_name)
            dst = self.package_dir / file_name
            shutil.copy2(src, dst)
            print(f"  ✅ {file_name}")
        print()
        
    def create_zip(self):
        """Create deployment package."""
        print("Creating deployment package...")
        
        with zipfile.ZipFile(self.zip_file, 'w', zipfile.ZIP_DEFLATED) as zipf:
            for file_path in self.package_dir.rglob('*'):
                if file_path.is_file():
                    arcname = file_path.relative_to(self.package_dir)
                    zipf.write(file_path, arcname)
                    
        size_bytes = self.zip_file.stat().st_size
        size_kb = size_bytes / 1024
        size_mb = size_bytes / (1024 * 1024)
        
        if size_mb >= 1:
            print(f"✅ Package created: {size_mb:.2f} MB")
        else:
            print(f"✅ Package created: {size_kb:.2f} KB")
        print()
        
        # Verify package size
        if size_bytes > 1048576:  # 1MB
            print("⚠️  WARNING: Package is larger than expected (>1MB)")
            print("Package should be <100KB with only code.")
            print("It may contain dependencies that should be in the layer.")
            print()
            print("Package contents:")
            with zipfile.ZipFile(self.zip_file, 'r') as zipf:
                files = zipf.namelist()
                for i, file_name in enumerate(files[:30]):
                    print(f"  {file_name}")
                if len(files) > 30:
                    print(f"  ... and {len(files) - 30} more files")
            print()
            response = input("Continue anyway? (y/n) ")
            if response.lower() != 'y':
                print("Aborted")
                sys.exit(1)
        else:
            print("✅ Package size is reasonable (<1MB, code only)")
        print()
        
    def upload_to_s3(self):
        """Upload to S3."""
        print("Uploading to S3...")
        
        s3_path = f"s3://{self.s3_bucket}/opensearch-refresh/opensearch-refresh-lambda.zip"
        
        try:
            subprocess.run(
                ["aws", "s3", "cp", str(self.zip_file), s3_path],
                check=True,
                stdout=subprocess.PIPE,
                stderr=subprocess.PIPE
            )
            print(f"✅ Successfully uploaded to S3")
            print(f"   Location: {s3_path}")
            print()
        except subprocess.CalledProcessError as e:
            print("❌ Failed to upload to S3")
            print()
            if e.stderr:
                print("Error details:")
                print(e.stderr.decode())
            sys.exit(1)
            
    def print_next_steps(self):
        """Print next steps for deployment."""
        print("=" * 41)
        print("Next Steps")
        print("=" * 41)
        print()
        print("If this is your FIRST deployment:")
        print("  1. Deploy the Lambda CloudFormation stack")
        print("     Follow InstallGuide.ipynb - Lambda Stack section")
        print()
        print("If the Lambda is ALREADY deployed:")
        print("  You can update the Lambda function code with:")
        print()
        print(f"  aws lambda update-function-code \\")
        print(f"    --function-name {self.lambda_function} \\")
        print(f"    --s3-bucket {self.s3_bucket} \\")
        print(f"    --s3-key opensearch-refresh/opensearch-refresh-lambda.zip")
        print()
        print("=" * 41)
        print()
        
    def run(self):
        """Execute the complete deployment workflow."""
        self.print_header()
        self.validate_environment()
        self.validate_files()
        self.cleanup()
        self.create_package()
        self.create_zip()
        self.upload_to_s3()
        self.print_next_steps()
        
        print("✅ Deployment complete!")
        print()


def main():
    """Main entry point."""
    parser = argparse.ArgumentParser(
        description="Upload Lambda code to S3 for AWS Lambda deployment",
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="""
Examples:
  python deploy_lambda.py datahub dev stanford
  python deploy_lambda.py datahub test stanford
  python deploy_lambda.py myproject prod myorg
        """
    )
    
    parser.add_argument(
        "project_name",
        help="Project name (e.g., datahub, myproject)"
    )
    parser.add_argument(
        "env",
        choices=["dev", "test", "prod"],
        help="Environment: dev, test, or prod"
    )
    parser.add_argument(
        "unique_id",
        help="Unique identifier for S3 bucket naming (e.g., stanford, myorg)"
    )
    
    args = parser.parse_args()
    
    deployer = LambdaDeployer(args.project_name, args.env, args.unique_id)
    deployer.run()


if __name__ == "__main__":
    main()

