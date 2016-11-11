#!/bin/sh

BUCKET=migrantnews-app-db-dev-dumps
HOST=$1
AWS_KEY=$2
AWS_SECRET=$3

echo "MONGO_HOST=${HOST}" > /scripts/env
echo "AWS_ACCESS_KEY_ID=${AWS_KEY}" >> /scripts/env
echo "AWS_SECRET_ACCESS_KEY=${AWS_SECRET}" >> /scripts/env

cron -f && tail -f /var/log/cron.log
