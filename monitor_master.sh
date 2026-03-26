#!/bin/bash
# ============================================
# Script: monitor_master.sh
# Location: Root directory of monitoring-system
# Purpose: Master controller for the Linux Monitoring & Alerting System
# Executes all modular scripts, handles logging, optional parallel execution
# ============================================

# -------------------------------
# CONFIGURATION
# -------------------------------

# Enable parallel execution of scripts? (true/false)
PARALLEL=true

# Log file for master execution timestamps
MASTER_LOG="./logs/monitoring.log"

# -------------------------------
# START MONITORING RUN
# -------------------------------

echo "===== Monitoring Run Started: $(date '+%Y-%m-%d %H:%M:%S') ====="
echo "===== Monitoring Run Started: $(date '+%Y-%m-%d %H:%M:%S') =====" >> "$MASTER_LOG"

# -------------------------------
# EXECUTE MODULAR SCRIPTS
# -------------------------------

if [ "$PARALLEL" = true ]; then
    # Run scripts in parallel to save time
    ./scripts/check_cpu_memory.sh &
    ./scripts/disk_status.sh &
    ./scripts/services_status.sh &
    
    # Wait for all background jobs to finish
    wait
else
    # Run scripts sequentially
    ./scripts/check_cpu_memory.sh
    ./scripts/disk_status.sh
    ./scripts/services_status.sh
fi

# -------------------------------
# END MONITORING RUN
# -------------------------------

echo "===== Monitoring Run Completed: $(date '+%Y-%m-%d %H:%M:%S') ====="
echo "===== Monitoring Run Completed: $(date '+%Y-%m-%d %H:%M:%S') =====" >> "$MASTER_LOG"

# -------------------------------
# OPTIONAL: ERROR HANDLING
# -------------------------------
# You can uncomment the following section to detect if a script fails
# Example for CPU/Memory check:
# if ! ./scripts/check_cpu_memory.sh; then
#     echo "[$(date)] [ERROR] CPU/Memory check script failed!" >> "$MASTER_LOG"
# fi

# ============================================
# END OF MASTER SCRIPT
# ============================================
