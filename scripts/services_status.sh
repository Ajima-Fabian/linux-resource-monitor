#!/bin/bash

LOG_FILE="../logs/monitoring.log"
SERVICE_FILE="../configs/services.conf"

log() {
    echo -e "[$(date +'%F %T')] $1" | tee -a $LOG_FILE
}

# Loop through each service in the config
while read -r SERVICE; do
    if systemctl is-active --quiet $SERVICE; then
        log "[INFO] Service $SERVICE is running"
    else
        log "[ALERT] Service $SERVICE is stopped"
        bash send_alert.sh "Service alert" "$SERVICE is not running!"
    fi
done < $SERVICE_FILE
