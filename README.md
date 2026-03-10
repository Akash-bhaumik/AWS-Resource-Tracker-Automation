# ☁️ AWS Resource Tracker Automation

## 📖 Project Overview

This project is a simple **DevOps automation script** that monitors AWS resources and logs them automatically.

The script checks important AWS services and records their details in a log file. It helps understand how to automate **cloud resource auditing** using **Shell Scripting, AWS CLI, and Cron jobs**.

This project demonstrates practical DevOps skills like:

- AWS CLI usage
- Shell scripting automation
- Linux cron scheduling
- Cloud resource monitoring

---

# 🧠 Why This Project?

When working in cloud environments, many resources can be created over time such as:

- EC2 instances
- S3 buckets
- Lambda functions
- IAM users

If these resources are not monitored regularly, it can lead to:

- unnecessary cloud costs
- unused resources
- security risks

This script automatically checks and logs AWS resources so that you always know **what is running in your AWS account**.

---

# ⚙️ Technologies Used

- Linux (Ubuntu)
- Bash Shell Scripting
- AWS CLI
- Cron Scheduler
- jq (JSON processor)

---

# 📂 Project Structure


AWS-Resource-Tracker-Automation
│
├── aws_resource_tracker.sh
├── resourceTracker.txt
├── screenshots
│ ├── cron_automation_setup.jpeg
│ └── aws_report_output.png
└── README.md


---

# 🚀 Step-by-Step Setup Guide

Follow these steps to run this project on your own system.

---

# Step 1️⃣ Clone the Repository

Download the project to your local machine.


git clone https://github.com/Akash-bhaumik/AWS-Resource-Tracker-Automation.git


Move into the project directory:


cd AWS-Resource-Tracker-Automation


---

# Step 2️⃣ Install Required Tools

Update system packages:


sudo apt update && sudo apt upgrade -y


Install AWS CLI and jq:


sudo apt install awscli jq -y


Verify installations:


aws --version
jq --version


---

# Step 3️⃣ Configure AWS CLI

Now connect your system with your AWS account.

Run:


aws configure


You will be asked to enter:


AWS Access Key ID
AWS Secret Access Key
Default Region (example: us-east-1)
Default Output Format: json


After configuration your system will be able to communicate with AWS services.

---

# Step 4️⃣ Make Script Executable

Before running the script you must give execute permission.


chmod +x aws_resource_tracker.sh


---

# Step 5️⃣ Run the Script Manually

Run the script to test the setup.


./aws_resource_tracker.sh


Check the generated log file:


cat resourceTracker.txt


The script will list resources such as:

- EC2 Instance IDs
- S3 Buckets
- Lambda Functions
- IAM Users

---

# ⏰ Step 6️⃣ Automate the Script Using Cron

To run the script automatically we use **Cron Jobs**.

Open the cron scheduler:


crontab -e


Add this line at the bottom:


0 * * * * /bin/bash /home/ubuntu/AWS-Resource-Tracker-Automation/aws_resource_tracker.sh


Meaning:


0 * * * * → run the script every hour


Now the script will run automatically every hour.

---

# 📊 Viewing the Logs

To check the logs:


cat resourceTracker.txt


To monitor logs live:


tail -f resourceTracker.txt


---

# 🔍 Understanding Important Commands

### jq

AWS CLI returns data in JSON format.  
`jq` is used to extract useful information from that JSON response.

Example:


jq -r '.Reservations[].Instances[].InstanceId'


This extracts **EC2 instance IDs** from the JSON output.

---

### Log Redirection

In the script you may see:


resourceTracker.txt 2>&1


Meaning:

- `>>` → append output to the log file
- `2>&1` → send error messages to the same log file

This ensures all script output and errors are recorded.

---

# 📸 Project Output

The output includes:

- EC2 Instance IDs
- List of S3 Buckets
- Lambda Functions
- IAM Users

Screenshots are available in the **screenshots folder**.

---

# 🔐 Security Note

Never upload the following to GitHub:

- AWS Secret Keys
- `.aws/credentials`
- `.pem` SSH keys

Always keep credentials private.

---

# 🎯 What This Project Demonstrates

This project shows practical understanding of:

- AWS CLI automation
- Shell scripting
- Linux cron scheduling
- Cloud resource monitoring

These are fundamental skills used in **DevOps and Cloud Engineering**.

---

# 👨‍💻 Author

Akash Bhaumik  
B.Tech CSE  
University of Engineering and Management, Kolkata

---

# ⭐ Future Improvements

Possible improvements:

- Email alerts when new resources are detected
- Store logs in Amazon S3
- Integrate with AWS CloudWatch
- Build a monitoring dashboard

---

⭐ If you found this project useful, feel free to star the repository.
