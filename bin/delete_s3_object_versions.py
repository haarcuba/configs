#!/usr/bin/env python
import json
import subprocess
import sys
import argparse

def list_object_versions(bucket_name):
    command = ["aws", "s3api", "list-object-versions", "--bucket", bucket_name, "--output", "json"]
    result = subprocess.run(command, capture_output=True, text=True)
    if result.returncode != 0:
        print(f"Error listing object versions: {result.stderr}")
        sys.exit(1)
    return json.loads(result.stdout)

def delete_object_version(bucket_name, key, version_id):
    command = [
        "aws", "s3api", "delete-object",
        "--bucket", bucket_name,
        "--key", key,
        "--version-id", version_id,
        "--output", "json"
    ]
    result = subprocess.run(command, capture_output=True, text=True)
    if result.returncode != 0:
        print(f"Error deleting object {key} (version {version_id}): {result.stderr}")
    else:
        print(f"Deleted {key} (version {version_id})")

def delete_all_versions(bucket_name, dry_run=False):
    versions = list_object_versions(bucket_name)
    
    # Delete object versions
    for version in versions.get("Versions", []):
        if dry_run:
            print(f"Would delete {version['Key']} (version {version['VersionId']})")
        else:
            delete_object_version(bucket_name, version["Key"], version["VersionId"])
    
    # Delete delete markers
    for marker in versions.get("DeleteMarkers", []):
        if dry_run:
            print(f"Would delete delete marker for {marker['Key']} (version {marker['VersionId']})")
        else:
            delete_object_version(bucket_name, marker["Key"], marker["VersionId"])

def main():
    parser = argparse.ArgumentParser(description="Delete all object versions in an S3 bucket")
    parser.add_argument("bucket_name", help="Name of the S3 bucket")
    parser.add_argument("--dry-run", action="store_true", help="Perform a dry run without actually deleting objects")
    args = parser.parse_args()

    if args.dry_run:
        print("Performing dry run. No objects will be deleted.")
    
    delete_all_versions(args.bucket_name, args.dry_run)

if __name__ == "__main__":
    main()
