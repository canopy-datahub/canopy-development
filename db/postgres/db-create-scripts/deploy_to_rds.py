#!/usr/bin/env python3

"""
Cross-platform RDS schema deployment script.
Replicates deploy_to_rds.sh without relying on jq/nc; works on macOS, Linux, and Windows.
Requires: AWS CLI, psql, Python 3.7+.

Usage:
    python deploy_to_rds.py --project-name datahub --env dev --region us-east-1 --profile datahub-rep
"""

import argparse
import json
import os
import shutil
import subprocess
import sys
from getpass import getpass
from pathlib import Path
from typing import Dict, List


def require_tool(name: str) -> None:
    if shutil.which(name):
        return
    print(f"Error: required tool '{name}' not found on PATH", file=sys.stderr)
    sys.exit(1)


def run_aws(args: List[str], env: Dict[str, str]) -> dict:
    cmd = ["aws", *args, "--output", "json"]
    try:
        completed = subprocess.run(
            cmd, env=env, capture_output=True, text=True, check=True
        )
    except FileNotFoundError:
        print("Error: AWS CLI not found on PATH", file=sys.stderr)
        sys.exit(1)
    except subprocess.CalledProcessError as exc:
        print("Error: AWS CLI command failed:", file=sys.stderr)
        print(exc.stderr.strip() or exc.stdout.strip(), file=sys.stderr)
        sys.exit(1)
    try:
        return json.loads(completed.stdout)
    except json.JSONDecodeError:
        print("Error: Failed to parse AWS CLI output", file=sys.stderr)
        sys.exit(1)


def test_psql_connection(
    endpoint: str, user: str, db_name: str, password: str
) -> bool:
    env = os.environ.copy()
    env["PGPASSWORD"] = password
    cmd = [
        "psql",
        "-h",
        endpoint,
        "-U",
        user,
        "-d",
        db_name,
        "-c",
        "SELECT version();",
    ]
    try:
        subprocess.run(cmd, env=env, check=True, stdout=subprocess.DEVNULL)
        return True
    except FileNotFoundError:
        print("Error: psql not found on PATH", file=sys.stderr)
        sys.exit(1)
    except subprocess.CalledProcessError:
        return False


def run_psql_file(
    endpoint: str,
    user: str,
    db_name: str,
    password: str,
    sql_file: Path,
    psql_vars: Dict[str, str] | None = None,
) -> bool:
    env = os.environ.copy()
    env["PGPASSWORD"] = password
    cmd = ["psql", "-h", endpoint, "-U", user, "-d", db_name]
    for key, value in (psql_vars or {}).items():
        cmd.extend(["-v", f"{key}={value}"])
    cmd.extend(["-f", str(sql_file)])
    try:
        subprocess.run(cmd, env=env, check=True)
        return True
    except subprocess.CalledProcessError:
        return False


def load_keycloak_db_params() -> Dict[str, str]:
    """Read KeycloakDbName/Username/Password from CANOPY_AWS_PARAMETER_FILE.
    Falls back to interactive prompts if the file is missing or a key is absent.
    """
    required = ("KeycloakDbName", "KeycloakDbUsername", "KeycloakDbPassword")
    values: Dict[str, str] = {}
    param_path = os.environ.get("CANOPY_AWS_PARAMETER_FILE", "")
    if param_path and Path(param_path).is_file():
        try:
            with open(param_path, "r") as f:
                params = json.load(f).get("Parameters", {})
            for key in required:
                if params.get(key):
                    values[key] = params[key]
        except (json.JSONDecodeError, OSError) as exc:
            print(f"Warning: could not read {param_path}: {exc}", file=sys.stderr)

    for key in required:
        if not values.get(key):
            if key == "KeycloakDbPassword":
                values[key] = getpass(f"Enter {key}: ")
            else:
                values[key] = input(f"Enter {key}: ").strip()

    if any(v in ("", "REPLACEME", "REPLACEME_kc_db_password") for v in values.values()):
        print(
            "Error: one or more Keycloak DB parameters are placeholders — "
            "edit CANOPY_AWS_PARAMETER_FILE and retry.",
            file=sys.stderr,
        )
        sys.exit(1)

    return values


def main() -> None:
    parser = argparse.ArgumentParser(
        description="Deploy database schema to RDS (cross-platform)"
    )
    parser.add_argument(
        "--project-name",
        required=True,
        help="Project name (e.g., datahub, myproject) - REQUIRED",
    )
    parser.add_argument(
        "--env",
        default="dev",
        choices=["dev", "test", "prod"],
        help="Environment to deploy (default: dev)",
    )
    parser.add_argument(
        "--region",
        default=os.environ.get("AWS_DEFAULT_REGION", "us-east-1"),
        help="AWS region (default: env AWS_DEFAULT_REGION or us-east-1)",
    )
    parser.add_argument(
        "--profile",
        default=os.environ.get("AWS_PROFILE", "datahub-rep"),
        help="AWS profile (default: env AWS_PROFILE or datahub-rep)",
    )
    args = parser.parse_args()

    env_vars = os.environ.copy()
    for key in ("AWS_ACCESS_KEY_ID", "AWS_SECRET_ACCESS_KEY", "AWS_SESSION_TOKEN"):
        env_vars.pop(key, None)
    env_vars["AWS_DEFAULT_REGION"] = args.region
    env_vars["AWS_PROFILE"] = args.profile

    script_dir = Path(__file__).resolve().parent

    require_tool("aws")
    require_tool("psql")

    print("=========================================")
    print("RDS Database Schema Deployment")
    print(f"Project Name: {args.project_name}")
    print(f"Environment: {args.env}")
    print(f"AWS Region: {args.region}")
    print(f"AWS Profile: {args.profile}")
    print("=========================================")
    print("\nVerifying AWS credentials...")

    identity = run_aws(["sts", "get-caller-identity"], env=env_vars)
    print(f"✓ AWS Account: {identity.get('Account', 'unknown')}")
    print(f"✓ AWS User: {identity.get('Arn', 'unknown')}\n")

    print("Getting RDS endpoint...")
    db_identifier = f"{args.project_name}-postgresql-{args.env}"
    rds_info = run_aws(
        [
            "rds",
            "describe-db-instances",
            "--db-instance-identifier",
            db_identifier,
            "--region",
            args.region,
        ],
        env=env_vars,
    )
    try:
        endpoint = (
            rds_info["DBInstances"][0]["Endpoint"]["Address"]
        )
    except (KeyError, IndexError):
        print(f"Error: Could not get RDS endpoint for {db_identifier}", file=sys.stderr)
        sys.exit(1)

    print(f"RDS Endpoint: {endpoint}")

    db_name = f"{args.project_name}_{args.env}"
    db_user = f"datahub_postgres_{args.env}"

    print("")
    db_password = getpass("Enter database master password: ")
    print("\nTesting connection...")
    if not test_psql_connection(endpoint, db_user, db_name, db_password):
        print("Error: Could not connect to database\n", file=sys.stderr)
        print("Common issues:", file=sys.stderr)
        print("  1. Password is incorrect (default in RDS.yaml is 'REPLACEME')", file=sys.stderr)
        print("  2. Security group doesn't allow your IP", file=sys.stderr)
        print(f"     - Run: ./add_ip_to_sg.sh {args.env} {args.region} {args.profile}", file=sys.stderr)
        print(f"  3. RDS instance status: aws rds describe-db-instances --db-instance-identifier {db_identifier} --region {args.region} --query 'DBInstances[0].DBInstanceStatus'", file=sys.stderr)
        print("  4. Network connectivity issues", file=sys.stderr)
        sys.exit(1)

    print("✓ Connection successful\n")
    print("About to deploy database schema to:")
    print(f"  Environment: {args.env}")
    print(f"  Endpoint: {endpoint}")
    print(f"  Database: {db_name}\n")

    confirm = input("Continue? (yes/no): ").strip().lower()
    if confirm not in {"y", "yes"}:
        print("Deployment cancelled")
        sys.exit(0)

    print("\n=========================================")
    print("Running SQL Scripts")
    print("=========================================")

    scripts = [
        "01_create_user_roles.sql",
        "02_create_base_db.sql",
        "03_populate_base_tables.sql",
        "04_populate_variable_tables.sql",
        "05_populate_test_data.sql",
        "06_create_keycloak_db.sql",
    ]

    kc_params = load_keycloak_db_params()
    psql_vars_for: Dict[str, Dict[str, str]] = {
        "06_create_keycloak_db.sql": {
            "kc_db": kc_params["KeycloakDbName"],
            "kc_user": kc_params["KeycloakDbUsername"],
            "kc_password": kc_params["KeycloakDbPassword"],
        },
    }

    for script_name in scripts:
        sql_path = script_dir / script_name
        if not sql_path.exists():
            print(f"⚠ Warning: {script_name} not found, skipping")
            continue
        print(f"\nRunning {script_name}...")
        vars_for_file = psql_vars_for.get(script_name)
        if run_psql_file(endpoint, db_user, db_name, db_password, sql_path, vars_for_file):
            print(f"✓ {script_name} completed successfully")
        else:
            print(f"✗ Error running {script_name}", file=sys.stderr)
            sys.exit(1)

    print("\n=========================================")
    print("Database deployment completed!")
    print("=========================================\n")


if __name__ == "__main__":
    try:
        main()
    except KeyboardInterrupt:
        print("\nCancelled by user")
        sys.exit(1)
