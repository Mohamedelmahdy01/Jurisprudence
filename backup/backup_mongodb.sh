#!/bin/bash
# Database information
DB_USER="moassel_user"
DB_PASS="your_password"
DB_NAME="moassel_db"

# Backup directory
BACKUP_DIR="/root/backups/mongodb"
# Backup file name
BACKUP_NAME="mongodb_$(date +%Y-%m-%d).tar.gz"
# R2 bucket name
R2_BUCKET="your-r2-bucket-name"

mkdir -p "$BACKUP_DIR"

# Export MongoDB database
mongodump --db "$DB_NAME" --username "$DB_USER" --password "$DB_PASS" --out "$BACKUP_DIR/mongodump"
tar -czf "$BACKUP_DIR/$BACKUP_NAME" -C "$BACKUP_DIR" mongodump
rm -rf "$BACKUP_DIR/mongodump"

# Upload to Cloudflare R2
aws s3 cp "$BACKUP_DIR/$BACKUP_NAME" "s3://$R2_BUCKET/mongodb/" --endpoint-url https://[your_account_id].r2.cloudflarestorage.com

# Remove local backup
rm "$BACKUP_DIR/$BACKUP_NAME"

echo "MongoDB backup uploaded successfully to R2."