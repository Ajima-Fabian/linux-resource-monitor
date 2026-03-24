#!/bin/bash

source ../configs/thresholds.conf
LOG_FILE="../logs/monitoring.log"

log() {
    echo -e "[$(date +'%F %T')] $1" | tee -a $LOG_FILE
}

# Check disk usage for root partition
DISK_USAGE=$(df / | tail -1 | awk '{print int($5)}')

log "[INFO] Disk Usage: $DISK_USAGE%"

if [ "$DISK_USAGE" -gt "$DISK_THRESHOLD" ]; then
    log "[ALERT] Disk usage above threshold ($DISK_THRESHOLD%)"
    bash send_alert.sh "Disk usage alert" "Disk usage is at $DISK_USAGE%"
fi
