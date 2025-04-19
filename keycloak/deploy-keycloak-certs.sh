#!/bin/bash
set -e

LIVE_DIR="/etc/letsencrypt/live/ziangren.com"
TARGET_DIR="/opt/keycloak-certs/ziangren.com"

echo "Updating Keycloak certs..."

cp "$LIVE_DIR/fullchain.pem" "$TARGET_DIR/fullchain.pem"
cp "$LIVE_DIR/privkey.pem" "$TARGET_DIR/privkey.pem"

chmod 644 "$TARGET_DIR/"*.pem

# Optional: restart Keycloak container
docker compose -f /home/sandman/workspace/github/sandmans-server/docker-compose restart keycloak

echo "Keycloak certs updated and container restarted."