#!/bin/bash

# Load thresholds
source ../configs/thresholds.conf

# Log file
LOG_FILE="../logs/monitoring.log"

# Function to log messages
log() {
    echo -e "[$(date +'%F %T')] $1" | tee -a $LOG_FILE
}

# Get CPU usage percentage
CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print int($2 + $4)}')

# Get Memory usage percentage
MEM_USAGE=$(free | awk '/Mem/ {print int($3/$2 * 100)}')

log "[INFO] CPU Usage: $CPU_USAGE%, Memory Usage: $MEM_USAGE%"

# Check CPU
if [ "$CPU_USAGE" -gt "$CPU_THRESHOLD" ]; then
    log "[ALERT] CPU usage above threshold ($CPU_THRESHOLD%)"
    bash send_alert.sh "CPU usage alert" "CPU usage is at $CPU_USAGE%"
fi

# Check Memory
if [ "$MEM_USAGE" -gt "$MEMORY_THRESHOLD" ]; then
    log "[ALERT] Memory usage above threshold ($MEMORY_THRESHOLD%)"
    bash send_alert.sh "Memory usage alert" "Memory usage is at $MEM_USAGE%"
fi
