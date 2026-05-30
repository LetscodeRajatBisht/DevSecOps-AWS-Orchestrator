#!/bin/bash
# OpenSCAP Automation Script
DATE=$(date +%F)
TARGET_IP="YOUR_TARGET_IP"
USER="ubuntu"
SSH_KEY="~/.ssh/Lab.pem"
PROFILE="xccdf_org.ssgproject.content_profile_cis_level1_server"
CONTENT="ssg-ubuntu2204-ds.xml"
REMOTE_PATH="/tmp"

# Copy content to target
scp -i $SSH_KEY ~/content/build/$CONTENT $USER@$TARGET_IP:$REMOTE_PATH/

# Run remote scan
ssh -i $SSH_KEY $USER@$TARGET_IP "sudo oscap xccdf eval --profile $PROFILE --results /tmp/result-$DATE.xml --report /tmp/webgoat-$DATE.html $REMOTE_PATH/$CONTENT"

# Copy report back
mkdir -p ~/reports
scp -i $SSH_KEY $USER@$TARGET_IP:/tmp/webgoat-$DATE.html ~/reports/

echo "✅ Scan complete. Report saved to: ~/reports/webgoat-$DATE.html"
