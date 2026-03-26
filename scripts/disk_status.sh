#!/bin/bash
# ============================================
# Script: disk_status.sh
# Purpose: Monitor disk usage of root partition
# Triggers alert if usage exceeds threshold
# ============================================

# Load threshold configuration
source ../configs/thresholds.conf

# Load alert function
source ./send_alert.sh

# ----- Disk Usage -----
# 'df /' shows disk usage of root partition
# tail -1 ignores header, awk prints 5th column (usage%)
# sed removes '%' for numeric comparison
DISK_USAGE=$(df / | tail -1 | awk '{print $5}' | sed 's/%//')

# ----- Logging -----
echo "[$(date '+%Y-%m-%d %H:%M:%S')] [INFO] Disk Usage: $DISK_USAGE%" >> ../logs/monitoring.log

# ----- Alerts -----
if [ "$DISK_USAGE" -gt "$DISK_THRESHOLD" ]; then
    ./send_alert.sh "Disk usage above threshold ($DISK_THRESHOLD%)"
fi
