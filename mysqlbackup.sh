#!/bin/bash

# 1. Load variables from .env file
if [ -f .env ]; then
    export $(grep -v '^#' .env | xargs)
else
    echo ".env file not found!"
    exit 1
fi

# 2. Use the variables (no changes needed to the command)
DATE=$(date +"%Y-%m-%d_%H-%M-%S")
#mkdir -p "$BACKUP_DIR"

echo "Starting backup for DF..."

docker compose exec mysql-db /usr/bin/mysqldump -u root -p"$MYSQL_ROOT_PASSWORD" DF | gzip > "./mysqlbckp/DF_$DATE.sql.gz"

echo "Backup finished: ./mysqlbckp/DF_$DATE.sql.gz"

echo "Starting backup for SHOME..."

docker compose exec mysql-db /usr/bin/mysqldump -u root -p"$MYSQL_ROOT_PASSWORD" SHOME | gzip > "./mysqlbckp/SHOME_$DATE.sql.gz"

echo "Backup finished: ./mysqlbckp/SHOME_$DATE.sql.gz"
