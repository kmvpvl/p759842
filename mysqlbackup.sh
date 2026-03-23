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

docker compose exec mysql-db /usr/bin/mysqldump -u root -p"$MYSQL_ROOT_PASSWORD" df | gzip > "./mysqlbckp/df_$DATE.sql.gz"

echo "Backup finished: ./mysqlbckp/df_$DATE.sql.gz"

echo "Starting backup for SHOME..."

docker compose exec mysql-db /usr/bin/mysqldump -u root -p"$MYSQL_ROOT_PASSWORD" shome | gzip > "./mysqlbckp/shome_$DATE.sql.gz"

echo "Backup finished: ./mysqlbckp/shome_$DATE.sql.gz"

# Optional: Keep only last 30 days
find "./mysqlbckp" -type f -name "*.sql.gz" -mtime +30 -delete