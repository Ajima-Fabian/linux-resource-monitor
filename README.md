# Linux System Monitoring Automation

<!-- Portfolio-ready README for automated Linux monitoring -->

## Overview

This project is a **modular, automated monitoring system** for Linux servers.  
It monitors CPU, memory, disk usage, and critical services, logs all events, and can optionally be extended to send alerts.  

The project demonstrates **Linux system administration skills, process and resource monitoring, and automation**.


---

## Features

- Monitor CPU and memory usage with configurable thresholds
- Monitor disk space for root partition
- Monitor critical services and log their status
- Modular design: easy to add more checks
- Logging of all events with timestamps
- Fully automated and ready for cron scheduling

---

## Project Structure

```text
linux-monitoring/
│
├─ scripts/
│  ├─ check_cpu_memory.sh        # Monitors CPU and RAM usage
│  ├─ check_disk.sh              # Monitors disk space
│  ├─ check_services.sh          # Monitors critical services
│  └─ monitor_master.sh          # Runs all monitoring scripts in sequence
│
├─ configs/
│  ├─ services.conf              # List of critical services to monitor
│  ├─ thresholds.conf            # CPU, RAM, Disk usage thresholds
│
├─ logs/
│  └─ monitoring.log             # Stores log of all events
└─ README.md


---


## Project documentation

