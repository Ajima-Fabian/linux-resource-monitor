#!/bin/bash
# ============================================
# Script: monitor_all.sh
# Purpose: Aggregator script to run all monitoring scripts sequentially
# ============================================

# Run CPU and Memory check
./check_cpu_memory.sh

# Run Disk usage check
./disk_status.sh

# Run Service status check
./services_status.sh
