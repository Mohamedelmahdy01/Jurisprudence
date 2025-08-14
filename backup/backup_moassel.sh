#!/bin/bash
# Project directory
PROJECT_DIR="/var/www/Moassel"
# Backup directory
BACKUP_DIR="/root/backups/moassel"
# Backup file name
BACKUP_NAME="moassel_$(date +%Y-%m-%d).tar.gz"
# R2 bucket name
R2_BUCKET="your-r2-bucket-name"

mkdir -p "$BACKUP_DIR"

# Compress the project directory
tar -czf "$BACKUP_DIR/$BACKUP_NAME" "$PROJECT_DIR"

# Upload to Cloudflare R2
aws s3 cp "$BACKUP_DIR/$BACKUP_NAME" "s3://$R2_BUCKET/moassel/" --endpoint-url https://[your_account_id].r2.cloudflarestorage.com

# Remove local backup
rm "$BACKUP_DIR/$BACKUP_NAME"

echo "Moassel project backup uploaded successfully to R2."