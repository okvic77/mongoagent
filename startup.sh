#!/bin/bash
set -e

sed -i "s/^mmsApiKey=.*$/mmsApiKey=${MMS_API_KEY}/" /etc/mongodb-mms/backup-agent.config
sed -i "s/^mmsApiKey=.*$/mmsApiKey=${MMS_API_KEY}/" /etc/mongodb-mms/monitoring-agent.config

exec "$@"