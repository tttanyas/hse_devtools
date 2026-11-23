#!/bin/bash

set -e

mkdir -p payment-service/{backup,config,data,logs,reports}

cd payment-service

cat > config/payment.conf <<'EOF'
SERVICE_NAME=payment-service
SERVICE_VERSION=1.0
CURRENCY=EUR
PAYMENT_PROVIDER=TEST
MAX_PAYMENT=5000
LOG_LEVEL=INFO
EOF

cat > data/transactions.txt <<'EOF'
10001;SUCCESS;120.50;EUR
10002;SUCCESS;59.90;EUR
10003;FAILED;899.00;EUR
10004;PENDING;250.00;EUR
10005;SUCCESS;15.99;EUR
10006;FAILED;1200.00;EUR
10007;SUCCESS;340.00;EUR
10008;SUCCESS;78.50;EUR
10009;PENDING;640.00;EUR
10010;FAILED;75.00;EUR
10011;SUCCESS;199.99;EUR
10012;SUCCESS;25.00;EUR
10013;FAILED;2500.00;EUR
10014;PENDING;99.90;EUR
10015;SUCCESS;450.00;EUR
10016;FAILED;150.00;EUR
10017;SUCCESS;70.00;EUR
10018;SUCCESS;310.50;EUR
10019;PENDING;1250.00;EUR
10020;SUCCESS;29.99;EUR
EOF

cat > logs/payment.log <<'EOF'
10:00:01 INFO Payment service started
10:01:12 INFO Transaction 10001 processed
10:02:31 INFO Transaction 10002 processed
10:03:17 ERROR Transaction 10003 declined
10:04:42 WARNING Transaction 10004 pending
10:05:14 INFO Transaction 10005 processed
10:06:11 ERROR Transaction 10006 declined
10:07:24 INFO Transaction 10007 processed
10:08:33 WARNING Payment provider response time high
10:09:02 ERROR Transaction 10010 declined
10:10:17 INFO Payment provider available
10:11:44 ERROR Transaction 10013 declined
10:12:03 WARNING Transaction 10014 pending
10:13:29 ERROR Transaction 10016 declined
10:14:55 INFO Payment service healthy
EOF

cp config/payment.conf backup/payment.conf.bak


