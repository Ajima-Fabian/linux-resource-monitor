#!/bin/bash
# ============================================
# Script: check_cpu_memory.sh
# Purpose: Monitor CPU and Memory usage
# Triggers alerts if usage exceeds defined thresholds
# ============================================

# Load thresholds from config file
source ../configs/thresholds.conf

# Load alert function
source ./send_alert.sh

# ----- CPU Usage -----
# Get CPU idle percentage from 'top', subtract from 100 to get usage
CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8}' | awk -F. '{print $1}')

# ----- Memory Usage -----
# Get used memory percentage
MEMORY_USAGE=$(free | grep Mem | awk '{print $3/$2 * 100}' | awk -F. '{print $1}')

# ----- Logging -----
# Append CPU and Memory info to centralized log file
echo "[$(date '+%Y-%m-%d %H:%M:%S')] [INFO] CPU Usage: $CPU_USAGE%, Memory Usage: $MEMORY_USAGE%" >> ../logs/monitoring.log

# ----- Alerts -----
# Compare CPU usage with threshold
if [ "$CPU_USAGE" -gt "$CPU_THRESHOLD" ]; then
    ./send_alert.sh "CPU usage above threshold ($CPU_THRESHOLD%)"
fi

# Compare Memory usage with threshold
if [ "$MEMORY_USAGE" -gt "$MEMORY_THRESHOLD" ]; then
    ./send_alert.sh "Memory usage above threshold ($MEMORY_THRESHOLD%)"
fi
