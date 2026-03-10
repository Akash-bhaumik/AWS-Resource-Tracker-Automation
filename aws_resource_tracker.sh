#!/bin/bash

#########################################################
# Author: Akash Bhaumik
# Project: AWS Resource Tracker Pro
# Purpose: Professional Cloud Governance Audit
#########################################################

# 1. Setup the "Notebook" (Log File)
LOG_FILE="/home/ubuntu/resourceTracker.txt"

# 2. Start the Report with a nice header
{
  echo "=========================================="
  echo "🚀 AWS AUDIT REPORT: $(date)"
  echo "=========================================="

  # 3. Check for S3 (Storage)
  echo "[+] Listing S3 Buckets:"
  aws s3 ls || echo "No S3 Buckets found or Access Denied."

  # 4. Check for EC2 (Compute Instances)
  echo -e "\n[+] Listing EC2 Instance IDs:"
  aws ec2 describe-instances | jq -r '.Reservations[].Instances[].InstanceId'

  # 5. Check for Lambda (Serverless Functions)
  echo -e "\n[+] Listing Lambda Functions:"
  aws lambda list-functions | jq -r '.Functions[].FunctionName'

  # 6. Check for IAM (Users)
  echo -e "\n[+] Listing IAM Users:"
  aws iam list-users | jq -r '.Users[].UserName'

  echo -e "\n--- End of Report ---\n"

} >> "$LOG_FILE" 2>&1
