FROM rclone/rclone:latest

# Install AWS CLI for S3 operations and bash
RUN apk add --no-cache \
    bash \
    aws-cli \
    tzdata

# Set working directory
WORKDIR /app

# Copy scripts
COPY backup.sh /app/backup.sh
COPY entrypoint.sh /app/entrypoint.sh
RUN chmod +x /app/backup.sh /app/entrypoint.sh

# rclone config is dynamically generated from environment variables
# For local development, you can create rclone.conf manually (git-ignored)

# Set entrypoint
ENTRYPOINT ["/app/entrypoint.sh"]
