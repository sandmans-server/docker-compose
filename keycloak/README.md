# Keycloak Docker Compose Configuration

This directory contains the configuration files for deploying Keycloak using Docker Compose. The setup includes a PostgreSQL database and the Keycloak server.

## Files

- `keycloak.yaml`: The main Docker Compose file for setting up Keycloak and PostgreSQL.
- `deploy-keycloak-certs.sh`: A script for deploying TLS certificates for Keycloak.
  - this should be placed at /etc/letsencrypt/renewal-hooks/post/deploy-keycloak-certs.sh

## Services

### PostgreSQL
- **Image**: `postgres:15`
- **Volumes**: Stores PostgreSQL data in a Docker volume named `keycloak_postgres_data`.
- **Environment Variables**:
  - `POSTGRES_DB`: Name of the database (`keycloak`).
  - `POSTGRES_USER`: Username for the database (`keycloak`).
  - `POSTGRES_PASSWORD`: Password for the database (default: `change_this_securely`).

### Keycloak
- **Image**: `quay.io/keycloak/keycloak:26.2.0`
- **Ports**: Exposes port `18443` for HTTPS.
- **Volumes**: Mounts TLS certificates from `/opt/keycloak-certs/ziangren.com` to `/etc/x509/https`.
- **Environment Variables**:
  - `KC_HOSTNAME`: Hostname for Keycloak (`auth.ziangren.com`).
  - `KC_HOSTNAME_STRICT`: Enables strict hostname checking (`true`).
  - `KC_HOSTNAME_STRICT_HTTPS`: Enforces HTTPS for hostname checking (`true`).
  - `KC_HTTPS_CERTIFICATE_FILE`: Path to the TLS certificate file (`/etc/x509/https/fullchain.pem`).
  - `KC_HTTPS_CERTIFICATE_KEY_FILE`: Path to the TLS certificate key file (`/etc/x509/https/privkey.pem`).
  - `KC_DB`: Database type (`postgres`).
  - `KC_DB_URL`: JDBC URL for the database (`jdbc:postgresql://postgres:5432/keycloak`).
  - `KC_DB_USERNAME`: Database username (`keycloak`).
  - `KC_DB_PASSWORD`: Database password (default: `change_this_securely`).
  - `KC_HEALTH_ENABLED`: Enables health checks (`true`).
  - `KC_METRICS_ENABLED`: Enables metrics (`true`).
  - `KC_BOOTSTRAP_ADMIN_USERNAME`: Bootstrap admin username (default: `admin`).
  - `KC_BOOTSTRAP_ADMIN_PASSWORD`: Bootstrap admin password (default: `admin`).
- **Command**: Starts the Keycloak server.

## Volumes

- `keycloak_postgres_data`: Stores PostgreSQL data persistently.

## Notes

- Ensure to replace default passwords (`change_this_securely` and `admin`) with secure values before deploying.
- The `deploy-keycloak-certs.sh` script can be used to deploy the required TLS certificates for Keycloak.