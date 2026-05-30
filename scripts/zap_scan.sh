#!/bin/bash
# ZAP Automated Scan Script
APIKEY="YOUR_API_KEY_HERE"
ZAP_HOST="http://localhost:8090"
TARGET_URL="http://YOUR_TARGET_IP:8080/WebGoat"

# Start Spider Scan
SPIDER_SCAN_ID=$(curl -s "$ZAP_HOST/JSON/spider/action/scan/?apikey=$APIKEY&url=$TARGET_URL&recurse=true" | jq -r '.scan')

# Wait for Spider completion
while true; do
    STATUS=$(curl -s "$ZAP_HOST/JSON/spider/view/status/?apikey=$APIKEY&scanId=$SPIDER_SCAN_ID" | jq -r '.status')
    if [ "$STATUS" -eq "100" ]; then break; fi
    sleep 5
done

# Start Active Scan
ASCAN_ID=$(curl -s "$ZAP_HOST/JSON/ascan/action/scan/?apikey=$APIKEY&url=$TARGET_URL&recurse=true" | jq -r '.scan')

# Wait for Active Scan completion
while true; do
    STATUS=$(curl -s "$ZAP_HOST/JSON/ascan/view/status/?apikey=$APIKEY&scanId=$ASCAN_ID" | jq -r '.status')
    if [ "$STATUS" -eq "100" ]; then break; fi
    sleep 5
done

echo "ZAP scans finished at $(date)"
