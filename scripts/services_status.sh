#!/bin/bash
# ============================================
# Script: services_status.sh
# Purpose: Monitor defined system services
# Triggers alert if any service is inactive
# ============================================

# Load list of services to monitor
source ../configs/services.conf

# Load alert function
source ./send_alert.sh

# ----- Loop through services -----
while read -r service; do
    # Check if service is active
    systemctl is-active --quiet "$service"
    
    if [ $? -eq 0 ]; then
        # Service is running
        echo "[$(date '+%Y-%m-%d %H:%M:%S')] [INFO] Service $service is running" >> ../logs/monitoring.log
    else
        # Service is stopped → trigger alert
        echo "[$(date '+%Y-%m-%d %H:%M:%S')] [ALERT] Service $service is stopped" >> ../logs/monitoring.log
        ./send_alert.sh "Service $service is stopped"
    fi
done < ../configs/services.conf
