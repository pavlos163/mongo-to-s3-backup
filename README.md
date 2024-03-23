# Mongo -> S3 Backup

This is a very simple script to take a MongoDB database dump into S3 (or any other S3-based storage such as Cloudflare).

## Building the Docker image
```
docker build -t your_image_name .
```
Replace `your_image_name` with a name for your Docker image.

## Running the Docker container

To run your script inside a Docker container, use the following command:

```
docker run --rm -e AWS_ACCESS_KEY_ID=your_access_key -e AWS_SECRET_ACCESS_KEY=your_secret_key -e MONGO_URI=your_mongo_uri your_image_name -e CLOUDFLARE_ENDPOINT=your_cloudflare_endpoint -e BUCKET_NAME=your_bucket_name
```

Make sure to replace the above parameters with their actual values.
