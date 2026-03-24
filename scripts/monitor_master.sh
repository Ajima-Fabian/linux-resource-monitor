#!/bin/bash

# Run all monitoring scripts
bash check_cpu_memory.sh
bash disk_status.sh
bash services_status.sh

echo "Monitoring complete."
