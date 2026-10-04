#!/bin/bash

set -e

mkdir -p web-app/{app,backup,config,logs,scripts}

cd web-app

cat > web-app/README.md <<'EOF'
APP_NAME=web-app
APP_VERSION=1.0
HOST=0.0.0.0
PORT=8080
LOG_LEVEL=INFO
DEBUG=false
DATABASE_HOST=localhost
DATABASE_PORT=5432
EOF

cat > web-app/app/main.py <<'EOF'
print("Web Application")
print("Version: 1.0")
print("Application started")
EOF

cat > web-app/config/app.conf <<'EOF'
APP_NAME=web-app
APP_VERSION1.0
HOST0.0.0.0
PORT8080
LOG_LEVELINFO
DEBUG=false
DATABASE_HOST=localhost
DATABASE_PORT5432
EOF

cat > web-app/logs/application.log <<'EOF'
'2026-09-22 10:00:01 INFO APPLICATION Application started' 
'2026-09-22 10:00:02 INFO DATABASE Connection established' 
'2026-09-22 10:01:15 INFO API GET /users 200' 
'2026-09-22 10:02:21 INFO AUTH User admin authenticated' 
'2026-09-22 10:03:11 WARNING API Response time 1800ms' 
'2026-09-22 10:04:05 INFO API GET /products 200' 
'2026-09-22 10:05:14 ERROR DATABASE Connection timeout' 
'2026-09-22 10:05:15 WARNING DATABASE Reconnecting' 
'2026-09-22 10:05:18 INFO DATABASE Connection established' 
'2026-09-22 10:06:44 ERROR AUTH Invalid token' 
'2026-09-22 10:07:11 INFO API POST /orders 201' 
'2026-09-22 10:08:17 WARNING API Response time 2200ms' 
'2026-09-22 10:09:31 ERROR DATABASE Query timeout' 
'2026-09-22 10:10:04 INFO AUTH User operator authenticated' 
'2026-09-22 10:11:42 ERROR API Internal server error'
EOF

cat > web-app/scripts/start.sh <<'EOF'
#!/bin/bash

echo "Starting Web Application..."
python3 app/main.py
echo "Web Application stopped"
EOF
chmod +x web-app/scripts/start.sh

./scripts/check.sh