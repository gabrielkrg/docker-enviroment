#!/bin/bash
set -e

# Fix permissions for /var/www directory
# This ensures files created in the container have correct ownership
if [ -d "/var/www" ]; then
    # Only fix ownership if running as root (during container startup)
    if [ "$(id -u)" = "0" ]; then
        chown -R www-data:www-data /var/www 2>/dev/null || true
        # Set directory permissions
        find /var/www -type d -exec chmod 755 {} \; 2>/dev/null || true
        # Set file permissions
        find /var/www -type f -exec chmod 644 {} \; 2>/dev/null || true
    fi
fi

# Execute the original command
exec "$@"
