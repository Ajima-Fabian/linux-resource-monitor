#!/bin/bash
# ============================================
# Script: send_alert.sh
# Purpose: Centralized alert mechanism
# Logs alert messages; can later integrate email/Slack
# ============================================

# Alert message passed as argument
ALERT_MESSAGE="$1"

# Append alert to log file with timestamp
echo "[$(date '+%Y-%m-%d %H:%M:%S')] [ALERT] $ALERT_MESSAGE" >> ../logs/monitoring.log

# FUTURE: Email/Slack notifications can be added here
# Example: echo "$ALERT_MESSAGE" | mail -s "System Alert" admin@example.com
