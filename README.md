# ☁️ AWS CloudWatchman: Automated Resource Auditor 

## 🌟 Project Overview (The "Why")
As a Cyber Security student at **IEM Kolkata**, I developed this project to tackle the challenge of **Cloud Sprawl**. In a professional AWS environment, forgotten resources like old EC2 instances or unencrypted S3 buckets create massive security vulnerabilities and unexpected costs.

This tool is a **Bash-based Automation Engine** that provides 100% visibility into your cloud infrastructure by auditing four core AWS services every hour without human intervention.

---

## 🛠️ Technical Deep Dive: From Scratch

### 1. The Core Engine (`aws_resource_tracker.sh`)
The script functions as a "Digital Sentry" that queries the AWS API for the following:
* **Amazon S3**: Scans for all storage buckets to ensure data perimeter awareness.
* **Amazon EC2**: Extracts live Instance IDs of virtual machines.
* **AWS Lambda**: Lists serverless functions to prevent "Serverless Sprawl".
* **AWS IAM**: Audits all users to monitor for unauthorized account creation.

### 2. The Power of `jq` (JSON Processing)
AWS CLI commands return data in **JSON** (JavaScript Object Notation) format, which is often hundreds of lines of messy text.
* **What is `jq`?**: It is a lightweight command-line JSON processor.
* **The Filter**: We use `.Reservations[].Instances[].InstanceId` to "drill down" into the data.
* **Raw Output (`-r`)**: We use the `-r` flag to remove quotation marks, giving us clean, plain text IDs like `i-0df8ec88759d0c085`.



### 3. Understanding `} >> "$LOG_FILE" 2>&1`
This is a critical Linux concept used in the script to ensure 100% logging accuracy:
* **`>>` (Append Redirection)**: Unlike `>`, which overwrites a file, `>>` adds the new audit report to the bottom of the existing diary.
* **`2>&1` (Error Consolidation)**: In Linux, `1` is the Standard Output (Success) and `2` is the Standard Error (Failures). This command tells the system: "Send all errors to the same file as the success messages". 
* **Why it matters**: If the script fails due to "Access Denied," you will see that error inside your `resourceTracker.txt` instead of a blank page.

---

## 📸 Proof of Work & Automation

### 🟢 Automated Scheduling (The Heart of DevOps)
I utilized the **Linux Cron** engine to schedule the audit. By setting the schedule to `* * * * *`, the system executes the script autonomously every 60 seconds.
![Cron Automation Setup](https://github.com/Akash-bhaumik/AWS-Resource-Tracker-Automation/blob/main/Screenshots/aws_report_output.png)

### 🟢 Live Audit Output
This screenshot confirms the script is successfully communicating with the AWS API and retrieving the unique **EC2 Instance ID**.
![AWS Report Output](./screenshots/aws_report_output.png)
