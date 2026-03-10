# ☁️ AWS Resource Tracker: Automation with Bash & Cron

🚀 DevOps Project | AWS CLI Automation | Shell Scripting | Cron Jobs

---

# 📌 Project Overview

This project is a **DevOps automation script** built using **Bash, AWS CLI, and Linux Cron**.

The script automatically scans AWS resources and writes the information into a log file.

This helps monitor cloud infrastructure and avoid problems like:

• unused resources  
• security risks  
• unnecessary cloud costs  

I built this project to understand how DevOps engineers **automate cloud monitoring tasks**.

---

# 🧠 The Problem This Solves

In real cloud environments, many resources are created such as:

- EC2 instances
- S3 buckets
- Lambda functions
- IAM users

Over time these resources can be forgotten.

This situation is called **Cloud Sprawl**.

Cloud sprawl can cause:

- unnecessary billing
- unused infrastructure
- security vulnerabilities

This script acts like a **digital watchdog** that regularly checks AWS resources and records them.

---

# ⚙️ Technologies Used

- Linux (Ubuntu)
- Bash Shell Scripting
- AWS CLI
- jq (JSON processor)
- Cron Jobs
- Git & GitHub

---

# 📂 Project Structure


AWS-Resource-Tracker-Automation
│
├── aws_resource_tracker.sh
├── README.md
├── Screenshots
│ ├── aws_report_output.png
│ └── cron_automation_setup.jpeg


---

# 🚀 Step-by-Step Setup Guide

This guide explains how to run this project from scratch.

---

# Step 1️⃣ Clone the Repository

Download the project to your system.


git clone https://github.com/Akash-bhaumik/AWS-Resource-Tracker-Automation.git


Move into the project folder.


cd AWS-Resource-Tracker-Automation


Now your system has the project files.

---

# Step 2️⃣ Install Required Dependencies

Update system packages.


sudo apt update && sudo apt upgrade -y


Install AWS CLI and jq.


sudo apt install awscli jq -y


Check installations.


aws --version
jq --version


### Why these tools are needed

**AWS CLI**

Allows your system to communicate with AWS services directly from the terminal.

**jq**

AWS CLI returns data in **JSON format**.  
`jq` extracts useful information from that JSON.

Example:


jq -r '.Reservations[].Instances[].InstanceId'


This extracts **only EC2 instance IDs** from large JSON responses.

---

# Step 3️⃣ Configure AWS CLI

Connect your system with your AWS account.

Run:


aws configure


Enter the following details:


AWS Access Key ID
AWS Secret Access Key
Default region name: us-east-1
Default output format: json


Now your system can access AWS resources.

---

# Step 4️⃣ Give Execution Permission

Linux does not allow scripts to run without permission.

So we make the script executable.


chmod +x aws_resource_tracker.sh


---

# Step 5️⃣ Run the Script Manually

Run the script to test it.


./aws_resource_tracker.sh


View the log file.


cat resourceTracker.txt


The script will display:

- EC2 instance IDs
- S3 buckets
- Lambda functions
- IAM users

---

# 📸 Script Output Example

Below is an example of the script successfully retrieving AWS resources.

![AWS Script Output](https://github.com/Akash-bhaumik/AWS-Resource-Tracker-Automation/blob/main/Screenshots/aws_report_output.png)

This confirms that the script is communicating with AWS and retrieving data.

---

# ⏰ Step 6️⃣ Automate Using Cron

Instead of running the script manually every time, we automate it.

Open the cron scheduler.


crontab -e


Add this line.


0 * * * * /bin/bash /home/ubuntu/AWS-Resource-Tracker-Automation/aws_resource_tracker.sh


### Cron Schedule Meaning


0 * * * *


means:

Run the script **every hour automatically**.

---

# 📸 Cron Automation Setup

Below is the cron automation configuration used in this project.

![Cron Automation Setup](https://github.com/Akash-bhaumik/AWS-Resource-Tracker-Automation/blob/main/Screenshots/cron_automation_setup.jpeg)

This ensures the script runs automatically without manual intervention.

---

# 📊 Viewing Logs

To check script logs:


cat resourceTracker.txt


To monitor logs live:


tail -f resourceTracker.txt


---

# 🔐 Security Best Practices

Never upload these files to GitHub:

- AWS Secret Keys
- `.aws/credentials`
- `.pem` SSH keys

Always keep credentials private.

---

# 🎯 What This Project Demonstrates

This project demonstrates real DevOps skills:

- AWS CLI automation
- Shell scripting
- Linux cron scheduling
- Cloud infrastructure monitoring

These are core concepts used by **DevOps and Cloud Engineers**.

---

# 👨‍💻 Author

Akash Bhaumik  
B.Tech CSE
University of Engineering & Management, Kolkata

---

# ⭐ Future Improvements

Possible improvements:

- Send alerts when new resources appear
- Store logs in Amazon S3
- Integrate with AWS CloudWatch
- Build a monitoring dashboard

---

⭐ If you found this project useful, feel free to star the repository.

