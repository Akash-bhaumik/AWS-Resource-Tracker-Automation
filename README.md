# AWS Resource Tracker: Automation with Bash & Cron

## 🚀 Project Overview
This project is a DevOps utility designed to automate the tracking of cloud resources within an **Amazon Web Services (AWS)** environment. As a Cyber Security student at IEM Kolkata, I developed this script to solve the problem of "Cloud Sprawl"—where forgotten resources lead to security vulnerabilities and unnecessary costs.

The script acts as an automated "Digital Watchman," auditing the following services:
* **Amazon S3**: Lists all storage buckets.
* **Amazon EC2**: Extracts and lists all active Instance IDs.
* **AWS Lambda**: Lists all serverless functions.
* **AWS IAM**: Audits all users within the account to ensure visibility.

---

## 🛠️ Technical Stack
* **Cloud Provider**: AWS (EC2, S3, Lambda, IAM)
* **Operating System**: Ubuntu
* **Scripting Language**: Bash Shell Scripting
* **JSON Processing**: `jq`
* **Automation**: Cron (Linux Task Scheduler)

---

## 📋 Features
- **Automated Auditing**: Runs on a schedule without manual intervention.
- **Clean Data Extraction**: Uses `jq` to filter messy JSON output into readable IDs.
- **Error Logging**: Captures both standard output and errors into a central log file (`2>&1`).
- **Historical Tracking**: Appends data to a report file to keep a history of resource changes.

---

## ⚙️ Setup and Installation

### 1. Prerequisites
Ensure your environment has the AWS CLI and `jq` installed:
```bash
sudo apt update && sudo apt install awscli jq -y
