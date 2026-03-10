#!/bin/bash
# Author: Akash Bhaumik
# Purpose: AWS Resource Tracking

LOG_FILE="resourceTracker.txt"

{
  echo "AWS Resource Report: $(date)"
  aws s3 ls
  aws ec2 describe-instances | jq '.Reservations[].Instances[].InstanceId'
  aws lambda list-functions
  aws iam list-users
} >> "$LOG_FILE" 2>&1
