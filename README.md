---

## 🛠️ Technical Deep Dive: From Scratch

### 1. The Core Engine (`aws_resource_tracker.sh`)
The script functions as a "Digital Sentry" that queries the AWS API for the following:
* **Amazon S3**: Scans for all storage buckets to ensure data perimeter awareness.
* **Amazon EC2**: Extracts live Instance IDs of virtual machines.
* **AWS Lambda**: Lists serverless functions to prevent "Serverless Sprawl".
* **AWS IAM**: Audits all users to monitor for unauthorized account creation.

### 2. Complex Syntax Explained

#### 🔎 What is `jq`?
`jq` is a command-line JSON processor. 
* **The Problem**: AWS sends back huge, messy files called JSON.
* **The Solution**: `jq` filters the mess. It's like a **magnifying glass** that pulls out only the useful parts (like IDs).
* **The Logic**: `jq -r '.Reservations[].Instances[].InstanceId'`.
* **The Result**: Instead of a 100-line file, you get a clean list of IDs like `i-0df8ec88759d0c085`.



#### 📁 Redirection: `} >> "$LOG_FILE" 2>&1`
This ensures the robot writes everything down correctly:
* **`>>` (Append)**: Adds new info to the end of the diary without erasing old logs.
* **`2>&1` (Error Catching)**: In Linux, `1` is success and `2` is error. This tells the system: "Send all errors to the same file as the success messages". 

---

## 📸 Proof of Work & Automation

### 🟢 Automated Scheduling (Cron)
I utilized the **Linux Cron** engine to schedule the audit. By setting the schedule to `* * * * *`, the system executes the script autonomously every 60 seconds.
![Cron Automation Setup](./screenshots/cron_automation_setup.jpeg)

### 🟢 Live Audit Output
This screenshot confirms the script is successfully pulling the unique **EC2 Instance ID** from the live AWS environment.
![AWS Report Output](./screenshots/aws_report_output.png)

---

## 🏗️ Step-by-Step Project Setup & Deployment

Follow these 5 steps to establish your own CloudWatchman environment from scratch.

### Step 1: System Requirements & Dependencies
Before executing scripts, ensure your host machine (Ubuntu) is equipped with the necessary binaries.
```bash
# Update system packages
sudo apt update && sudo apt upgrade -y

# Install AWS CLI and jq (JSON Processor)
sudo apt install awscli jq -y
Step 2: AWS Authentication (AWS CLI Setup)
Sync your Ubuntu instance with your AWS account to give the script permission to scan resources.

Bash
aws configure
You will be prompted to enter:

Access Key ID: Your unique public identifier.

Secret Access Key: Your private security key.

Default Region: us-east-1 (or your preferred region).

Output Format: json (Crucial for jq processing).

Step 3: Repository Deployment (Cloning)
Bring the code from GitHub to your local machine.

Bash
# Clone the repository
git clone [https://github.com/Akash-bhaumik/AWS-Resource-Tracker-Automation.git](https://github.com/Akash-bhaumik/AWS-Resource-Tracker-Automation.git)

# Enter the project directory
cd AWS-Resource-Tracker-Automation
Step 4: Permissions & Manual Execution
Grant "Execute" rights to the script and run a manual test audit to verify connectivity.

Bash
# Make the script executable
chmod +x aws_resource_tracker.sh

# Run the manual audit test
./aws_resource_tracker.sh

# View the results immediately
cat /home/ubuntu/resourceTracker.txt
Step 5: Full Automation Setup (24/7 Monitoring)
To ensure the audit runs autonomously without human intervention:

Open the task scheduler: crontab -e.

Select an editor (like nano) and paste the following line at the very bottom:

Code snippet
0 * * * * /bin/bash /home/ubuntu/AWS-Resource-Tracker-Automation/aws_resource_tracker.sh
(This triggers the audit every hour at minute 0).
