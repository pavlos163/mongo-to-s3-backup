#!/bin/bash
if [[ -z "${OBJECT_NAME}" ]]; then
    OBJECT_NAME=mongodump.$(date -u '+%d-%m-%Y_%H:%M:%S').prod.gz
else
    echo "Using exported OBJECT_NAME: $OBJECT_NAME"
fi

# Dump and stream directly to S3
mongodump --uri="$MONGO_URI" --archive --gzip | \
aws s3 cp - s3://"$BUCKET_NAME"/"$OBJECT_NAME" --endpoint-url "$S3_ENDPOINT"
