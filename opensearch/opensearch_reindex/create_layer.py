#!/usr/bin/env python3
"""
create_layer.py

Creates a Lambda layer with all dependencies for ARM64 architecture
Dependencies: psycopg2-binary, opensearch-py, requests-aws4auth, boto3, requests

Usage: python create_layer.py [layer-name] [region] [profile]
Example: python create_layer.py dependency-layer us-east-1 datahub-rep
"""

import argparse
import json
import os
import shutil
import subprocess
import sys
import zipfile
from datetime import datetime
from pathlib import Path


class LayerCreator:
    """Creates and publishes AWS Lambda layers with Python dependencies."""
    
    DEPENDENCIES = [
        "psycopg2-binary==2.9.9",
        "opensearch-py",
        "requests-aws4auth",
        "boto3",
        "requests"
    ]
    
    def __init__(self, layer_name: str, region: str, profile: str):
        self.layer_name = layer_name
        self.region = region
        self.profile = profile
        self.python_dir = Path("python")
        self.zip_file = Path("layer.zip")
        self.log_file = Path("build_output.log")
        
    def print_header(self):
        """Print script header with configuration."""
        print("=" * 42)
        print("Creating Complete Lambda Layer")
        print("=" * 42)
        print()
        print(f"Layer Name:    {self.layer_name}")
        print(f"Architecture:  ARM64 (aarch64)")
        print(f"Runtime:       Python 3.11")
        print(f"Region:        {self.region}")
        print(f"Profile:       {self.profile}")
        print()
        print("Dependencies:")
        for dep in self.DEPENDENCIES:
            print(f"  - {dep}")
        print()
        print("=" * 42)
        print()
        
    def check_docker(self):
        """Verify Docker is installed and running."""
        print("Checking Docker...")
        
        # Check if Docker is installed
        if not shutil.which("docker"):
            print("❌ ERROR: Docker is required but not installed")
            print()
            print("Install Docker:")
            print("  macOS:   brew install --cask docker")
            print("  Linux:   sudo apt-get install docker.io")
            print("  Windows: https://www.docker.com/products/docker-desktop")
            print()
            sys.exit(1)
            
        # Check if Docker is running
        try:
            subprocess.run(
                ["docker", "ps"],
                check=True,
                stdout=subprocess.PIPE,
                stderr=subprocess.PIPE
            )
            print("✅ Docker is available and running")
            print()
        except subprocess.CalledProcessError:
            print("❌ ERROR: Docker is not running")
            print("Please start Docker and try again")
            sys.exit(1)
            
    def cleanup(self):
        """Clean up previous builds."""
        print("Step 1: Cleaning up previous builds...")
        if self.python_dir.exists():
            shutil.rmtree(self.python_dir)
        if self.zip_file.exists():
            self.zip_file.unlink()
        if self.log_file.exists():
            self.log_file.unlink()
        print("✅ Cleaned up")
        print()
        
    def create_directory(self):
        """Create layer directory structure."""
        print("Step 2: Creating layer structure...")
        self.python_dir.mkdir(exist_ok=True)
        print("✅ Created python/ directory")
        print()
        
    def install_dependencies(self):
        """Install dependencies using Docker."""
        print("Step 3: Installing dependencies using Docker...")
        print("This may take 2-3 minutes...")
        print()
        
        # Build pip install command
        pip_deps = " ".join(self.DEPENDENCIES)
        
        docker_command = [
            "docker", "run", "--rm",
            "--platform", "linux/arm64",
            "--entrypoint", "/bin/bash",
            "-v", f"{os.getcwd()}:/var/task",
            "public.ecr.aws/lambda/python:3.11-arm64",
            "-c", f"""
set -e
cd /var/task

echo '=== Installing dependencies ==='
pip install {pip_deps} -t python/ --no-cache-dir --upgrade

echo ''
echo '=== Installation Summary ==='
pip list --path python/ --format columns

echo ''
echo '=== Verifying psycopg2 binary ==='
find python/psycopg2 -name '_psycopg*.so' -exec ls -lh {{}} \\;

echo ''
echo '=== Checking binary architecture ==='
find python/psycopg2 -name '_psycopg*.so' | head -1 | xargs -I {{}} sh -c 'echo "Binary: {{}}" && ls -lh {{}}'
"""
        ]
        
        try:
            with open(self.log_file, "w") as log:
                result = subprocess.run(
                    docker_command,
                    stdout=subprocess.PIPE,
                    stderr=subprocess.STDOUT,
                    text=True,
                    check=True
                )
                # Write to log file
                log.write(result.stdout)
                # Also print to console
                print(result.stdout)
                
            print("✅ Docker build completed")
            print()
        except subprocess.CalledProcessError as e:
            print()
            print("❌ ERROR: Docker build failed")
            print(f"Check {self.log_file} for details")
            sys.exit(1)
            
    def verify_layer(self):
        """Verify layer contents locally."""
        print("Step 4: Verifying layer contents locally...")
        print()
        
        # Check python directory exists
        if not self.python_dir.exists():
            print("❌ ERROR: python/ directory was not created")
            sys.exit(1)
        print("✅ python/ directory exists")
        
        # Check psycopg2 exists
        psycopg2_dir = self.python_dir / "psycopg2"
        if not psycopg2_dir.exists():
            print("❌ ERROR: psycopg2 was not installed")
            print()
            print("Contents of python/:")
            for item in self.python_dir.iterdir():
                print(f"  {item.name}")
            sys.exit(1)
        print("✅ psycopg2 package found")
        
        # Check for the binary
        binary_files = list(psycopg2_dir.glob("_psycopg*.so"))
        if not binary_files:
            print("❌ ERROR: psycopg2 binary not found")
            print()
            print("Contents of python/psycopg2/:")
            for item in psycopg2_dir.iterdir():
                print(f"  {item.name}")
            sys.exit(1)
            
        binary = binary_files[0]
        print(f"✅ Binary found: {binary.name}")
        
        # Verify architecture
        if "aarch64" in binary.name:
            print("✅ Binary name indicates ARM64 (aarch64)")
        else:
            print("⚠️  WARNING: Binary name doesn't contain 'aarch64'")
            print(f"   Binary: {binary.name}")
            print()
            response = input("Continue anyway? (y/n) ")
            if response.lower() != 'y':
                print("Aborted")
                sys.exit(1)
                
        # Check other dependencies
        print()
        print("Checking other dependencies:")
        dep_checks = [
            ("opensearchpy", "opensearch-py"),
            ("requests_aws4auth", "requests-aws4auth"),
            ("boto3", "boto3"),
            ("requests", "requests")
        ]
        
        for dir_name, display_name in dep_checks:
            found = False
            for item in self.python_dir.iterdir():
                if dir_name in item.name.lower():
                    found = True
                    break
            if found:
                print(f"  ✅ {display_name}")
            else:
                print(f"  ⚠️  {display_name} (might be named differently)")
                
        print()
        print("Layer directory size:")
        total_size = sum(f.stat().st_size for f in self.python_dir.rglob('*') if f.is_file())
        size_mb = total_size / (1024 * 1024)
        print(f"  {size_mb:.2f} MB")
        print()
        
    def create_zip(self):
        """Create ZIP archive."""
        print("Step 5: Creating ZIP archive...")
        
        try:
            with zipfile.ZipFile(self.zip_file, 'w', zipfile.ZIP_DEFLATED) as zipf:
                for file_path in self.python_dir.rglob('*'):
                    if file_path.is_file():
                        arcname = file_path.relative_to(self.python_dir.parent)
                        zipf.write(file_path, arcname)
                        
            size_mb = self.zip_file.stat().st_size / (1024 * 1024)
            print(f"✅ Layer ZIP created: {size_mb:.2f} MB")
            
            # Verify ZIP contents
            print()
            print("Verifying ZIP contents...")
            with zipfile.ZipFile(self.zip_file, 'r') as zipf:
                files = zipf.namelist()
                psycopg_binaries = [f for f in files if '_psycopg' in f and f.endswith('.so')]
                
                if not psycopg_binaries:
                    print("❌ ERROR: psycopg2 binary not found in ZIP!")
                    print()
                    print("ZIP contents (first 30 files):")
                    for f in files[:30]:
                        print(f"  {f}")
                    sys.exit(1)
                    
            print("✅ ZIP contains psycopg2 binary")
            print()
            
        except Exception as e:
            print(f"❌ ERROR: Failed to create ZIP file: {e}")
            sys.exit(1)
            
    def get_aws_account(self):
        """Get AWS account information."""
        print("Step 6: Getting AWS account information...")
        
        try:
            result = subprocess.run(
                ["aws", "sts", "get-caller-identity", 
                 "--profile", self.profile,
                 "--query", "Account",
                 "--output", "text"],
                capture_output=True,
                text=True,
                check=True
            )
            account_id = result.stdout.strip()
            print(f"✅ AWS Account ID: {account_id}")
            print()
            return account_id
        except subprocess.CalledProcessError:
            print("❌ ERROR: Failed to get AWS account ID")
            print(f"Please check your AWS profile: {self.profile}")
            sys.exit(1)
            
    def publish_layer(self):
        """Publish layer to AWS Lambda."""
        print("Step 7: Publishing layer to AWS Lambda...")
        print("This may take 1-2 minutes for large layers...")
        print()
        
        try:
            timestamp = datetime.now().strftime("%Y-%m-%d %H:%M")
            description = f"Complete dependencies for ARM64 Python 3.11 - Built {timestamp}"
            
            result = subprocess.run(
                ["aws", "lambda", "publish-layer-version",
                 "--layer-name", self.layer_name,
                 "--description", description,
                 "--zip-file", f"fileb://{self.zip_file}",
                 "--compatible-runtimes", "python3.11",
                 "--compatible-architectures", "arm64",
                 "--region", self.region,
                 "--profile", self.profile],
                capture_output=True,
                text=True,
                check=True
            )
            
            # Parse response
            response = json.loads(result.stdout)
            layer_arn = response.get("LayerVersionArn")
            layer_version = response.get("Version")
            
            if not layer_arn:
                print("❌ ERROR: Could not extract Layer ARN from response")
                print()
                print("Response:")
                print(result.stdout)
                sys.exit(1)
                
            print("✅ Layer published successfully!")
            print()
            
            return layer_arn, layer_version
            
        except subprocess.CalledProcessError as e:
            print("❌ ERROR: Failed to publish layer")
            print()
            print("Error details:")
            print(e.stderr)
            print()
            
            if "AccessDenied" in e.stderr:
                print("This appears to be a permissions issue.")
                print("Make sure your AWS profile has lambda:PublishLayerVersion permission")
                
            sys.exit(1)
            
    def print_success(self, layer_arn: str, layer_version: int):
        """Print success message with configuration details."""
        size_mb = self.zip_file.stat().st_size / (1024 * 1024)
        
        print("=" * 42)
        print("SUCCESS!")
        print("=" * 42)
        print()
        print("Layer Details:")
        print(f"  Name:         {self.layer_name}")
        print(f"  Version:      {layer_version}")
        print(f"  Architecture: arm64")
        print(f"  Runtime:      python3.11")
        print(f"  Size:         {size_mb:.2f} MB")
        print(f"  Region:       {self.region}")
        print()
        print("Layer ARN:")
        print(f"  {layer_arn}")
        print()
        print("=" * 42)
        print("CloudFormation Configuration")
        print("=" * 42)
        print()
        print("Add this to your Lambda in Lambda.yaml:")
        print()
        print("OpenSearchReindexLambda:")
        print("  Type: AWS::Lambda::Function")
        print("  Properties:")
        print("    Architectures:")
        print("      - arm64")
        print("    Layers:")
        print(f'      - !Sub "arn:aws:lambda:${{AWS::Region}}:${{AWS::AccountId}}:layer:{self.layer_name}:{layer_version}"')
        print()
        print("Or use the full ARN directly:")
        print("    Layers:")
        print(f"      - {layer_arn}")
        print()
        
    def cleanup_files(self):
        """Clean up temporary files."""
        print("Cleaning up temporary files...")
        if self.python_dir.exists():
            shutil.rmtree(self.python_dir)
        if self.zip_file.exists():
            self.zip_file.unlink()
        print("✅ Cleanup complete")
        print()
        
    def run(self):
        """Execute the complete layer creation workflow."""
        self.print_header()
        self.check_docker()
        self.cleanup()
        self.create_directory()
        self.install_dependencies()
        self.verify_layer()
        self.create_zip()
        self.get_aws_account()
        layer_arn, layer_version = self.publish_layer()
        self.print_success(layer_arn, layer_version)
        self.cleanup_files()
        
        print("=" * 42)
        print("✅ All Done!")
        print("=" * 42)
        print()


def main():
    """Main entry point."""
    parser = argparse.ArgumentParser(
        description="Create and publish AWS Lambda layer with Python dependencies",
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="""
Examples:
  python create_layer.py
  python create_layer.py dependency-layer us-east-1 datahub-rep
  python create_layer.py my-layer us-west-2 production
        """
    )
    
    parser.add_argument(
        "layer_name",
        nargs="?",
        default="dependency-layer",
        help="Name of the Lambda layer (default: dependency-layer)"
    )
    parser.add_argument(
        "region",
        nargs="?",
        default="us-east-1",
        help="AWS region (default: us-east-1)"
    )
    parser.add_argument(
        "profile",
        nargs="?",
        default="datahub-rep",
        help="AWS CLI profile (default: datahub-rep)"
    )
    
    args = parser.parse_args()
    
    creator = LayerCreator(args.layer_name, args.region, args.profile)
    creator.run()


if __name__ == "__main__":
    main()

