# Start from a base image with MongoDB tools pre-installed
FROM mongo:latest

# Install AWS CLI
RUN apt-get update && \
    apt-get install -y python3-pip groff-base && \
    pip3 install awscli && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Copy your script into the container
COPY mongo-dump.sh /mongo-dump.sh

# Make your script executable
RUN chmod +x /mongo-dump.sh

# Set the entry point to your script
ENTRYPOINT ["/mongo-dump.sh"]
