#!/bin/bash

set -e

mkdir -p monitoring-service/{alerts,archive,config,logs,scripts}

cd monitoring-service

cat > alerts/alerts.log <<'EOF'
EOF

cat > config/monitoring.conf <<'EOF'
SERVICE_NAME=monitoring
CHECK_INTERVAL=30
CPU_THRESHOLD=80
MEMORY_THRESHOLD=85
DISK_THRESHOLD=90
LOG_LEVEL=INFO
EOF

cat > logs/system.log <<'EOF'
10:00:00 INFO CPU usage=35%
10:00:30 INFO MEMORY usage=61%
10:01:00 INFO DISK usage=45%
10:01:30 WARNING CPU usage=82%
10:02:00 INFO CPU usage=65%
10:02:30 WARNING MEMORY usage=88%
10:03:00 ERROR DATABASE unavailable
10:03:30 INFO DATABASE available
10:04:00 INFO CPU usage=44%
10:04:30 WARNING DISK usage=92%
10:05:00 ERROR API unavailable
10:05:30 ERROR DATABASE connection timeout
10:06:00 INFO API available
10:06:30 INFO MEMORY usage=63%
10:07:00 WARNING CPU usage=89%
10:07:30 ERROR DATABASE connection refused
10:08:00 INFO DATABASE available
10:08:30 WARNING MEMORY usage=91%
10:09:00 ERROR API connection timeout
10:09:30 INFO SYSTEM healthy
EOF

cat > scripts/check.sh <<'EOF'
#!/bin/bash

echo "Monitoring check started"
echo "Checking CPU..."
echo "Checking memory..."
echo "Checking disk..."
echo "Monitoring check completed"
EOF

chmod +x scripts/check.sh
