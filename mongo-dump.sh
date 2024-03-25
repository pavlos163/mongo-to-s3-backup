#!/bin/bash
# Add UTC date and time details
OBJECT_NAME=mongodump.$(date -u '+%d-%m-%Y_%H:%M:%S').prod.gz

# Dump and stream directly to S3
mongodump --uri="$MONGO_URI" --archive --gzip | \
aws s3 cp - s3://"$BUCKET_NAME"/"$OBJECT_NAME" --endpoint-url "$S3_ENDPOINT"
