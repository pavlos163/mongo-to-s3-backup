#!/bin/bash
OBJECT_NAME=$(date '+%Y-%m-%d')

# Dump and stream directly to S3
mongodump --uri="$MONGO_URI" --archive --gzip | \
aws s3 cp - s3://"$BUCKET_NAME"/"$OBJECT_NAME" --endpoint-url "$CLOUDFLARE_ENDPOINT"
