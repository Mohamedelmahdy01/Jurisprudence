#!/bin/bash
# Snapshot name
SNAPSHOT_NAME="snapshot_$(date +%Y-%m-%d)"
# R2 bucket name
R2_BUCKET="your-r2-bucket-name"

# Create snapshot repository (run once)
curl -XPUT "http://localhost:9200/_snapshot/moassel_backup" -H 'Content-Type: application/json' -d'
{
  "type": "s3",
  "settings": {
    "bucket": "'"$R2_BUCKET"'",
    "region": "auto",
    "endpoint": "https://[your_account_id].r2.cloudflarestorage.com"
  }
}'

# Create snapshot
curl -XPUT "http://localhost:9200/_snapshot/moassel_backup/$SNAPSHOT_NAME"

echo "OpenSearch backup snapshot created and uploaded to R2."