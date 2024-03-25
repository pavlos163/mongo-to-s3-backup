#!/bin/bash
if [[ -z "${OBJECT_NAME}" ]]; then
    # Add UTC date and time details
    echo "OBJECT_NAME is empty. Setting it to current UTC date and time."
    OBJECT_NAME=mongodump.$(date -u '+%d-%m-%Y_%H:%M:%S').prod.gz
else
    echo "Using exported OBJECT_NAME: $OBJECT_NAME"
fi

# Dump and stream directly to S3
mongodump --uri="$MONGO_URI" --archive --gzip | \
aws s3 cp - s3://"$BUCKET_NAME"/"$OBJECT_NAME" --endpoint-url "$S3_ENDPOINT" || {
   echo "Error occurred during mongodump or S3 upload"
   exit 1
}
mongodump --uri="$MONGO_URI" --archive --gzip | \
aws s3 cp - s3://"$BUCKET_NAME"/"$OBJECT_NAME" --endpoint-url "$S3_ENDPOINT"
