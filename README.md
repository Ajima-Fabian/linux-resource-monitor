# 🖥️  Monitoring & Alerting System

## 📌 Overview

This project is a Bash-based monitoring and alerting system designed to track system health and notify when critical thresholds are exceeded.

It monitors:

- CPU usage
- Memory usage
- Disk usage
- System services

When any metric exceeds defined thresholds, an alert is triggered automatically.

---

## 🚀 Features

### 🔍 System Monitoring

- Real-time CPU and memory tracking
- Disk usage monitoring (root partition)
- Service status monitoring using "systemctl"

### ⚠️ Alert System

- Threshold-based alert triggering
- Automatic alert execution via "send_alert.sh"
- Logs alerts and system activity

### 🧾 Logging

- Timestamped logs
- Centralized log file ("monitoring.log")
- Tracks both normal activity and alerts

### ⚙️ Configurable System

- Threshold values stored in config files
- Services to monitor defined in a config file
- Easy to customize without modifying scripts

---

## 📂 Project Structure

```bash
monitoring-system/
│
├── scripts/
│   ├── check_cpu_memory.sh
│   ├── disk_status.sh
│   ├── services_status.sh
│   └── send_alert.sh
│
├── configs/
│   ├── thresholds.conf
│   └── services.conf
│
├── logs/
│  └── monitoring.log
├── monitor_master.sh
│
└── README.md
```
---

## ⚙️ Configuration

### 🔧 Thresholds
```bash
Edit "configs/thresholds.conf":

CPU_THRESHOLD=80
MEMORY_THRESHOLD=75
DISK_THRESHOLD=85

---

### 🔧 Services

Edit "configs/services.conf" to list the services you want to monitor 

nginx
docker
ssh

---

## ▶️ Usage

### 1. Clone Repository

git clone https://github.com/Ajima-Fabian/linux-resource-monitor.git

### 2. Make Script Executable

cd linux-resource-monitor
chmod +x scripts/*
chmod +x monitor_master.sh

### 3. Run Script

./monitor_master.sh

---

## 📊 Example Output

[2026-03-24 10:00:00] [INFO] CPU Usage: 45%, Memory Usage: 60%

[2026-03-24 10:00:01] [ALERT] CPU usage above threshold (80%)

[2026-03-24 10:00:02] [INFO] Service nginx is running

[2026-03-24 10:00:03] [ALERT] Service docker is stopped
```
---

## 🛠️ Technologies Used

- Bash scripting
- Linux system utilities ("top", "free", "df", "systemctl")
- Process and service monitoring

---

## 🎯 Purpose

This project demonstrates:

- Automation of system monitoring tasks
- Real-time alerting based on thresholds
- Log management and system visibility
- Practical DevOps scripting skills

---

## 🔮 Future Improvements

- Email/Slack alert integration
- Cron job automation
- Docker container monitoring
- Web dashboard for visualization

---

## 📌 Author

Ajima Fabian
DevOps & Linux Enthusiast focused on automation and system reliability

- GitHub: https://github.com/Ajima-Fabian/Ajima-Fabian
- Email: ajimafabian18@gmail.com
