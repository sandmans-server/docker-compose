# Docker Compose Configuration for Sandman's Server

Welcome to the Sandman's Server repository! This guide will help you understand and use the Docker Compose configuration files provided in this repository.

---

## 📦 Requirements

- Docker installed on your system
- Docker Compose installed
- Internet access (to pull images)

---

## 🚀 Step-by-Step Setup

### 1. Clone the Repository

```bash
git clone https://github.com/sandmans-server/docker-compose.git
cd docker-compose
```

---

### 2. Start the Services

Use the following command to start all services defined in the `docker-compose.yml` file:

```bash
docker-compose up -d
```

This will start all the services in detached mode.

---

### 3. Keycloak Service

The `keycloak.yaml` file contains the configuration for the Keycloak service. Ensure you have the necessary environment variables set up before starting the service.

To start only the Keycloak service:

```bash
docker-compose -f keycloak.yaml up -d
```

---

## 🔧 Features Enabled

- Centralized authentication with Keycloak
- Easy service orchestration with Docker Compose

---

## 🧪 Verify Setup

Run the following command to check the status of the services:

```bash
docker-compose ps
```

You should see a list of running services.

---

## 🛠 Customization

Feel free to modify the `keycloak.yaml` file or add new services to the `docker-compose.yml` file as needed.

---

## 🤝 Questions?

Open an issue or ask in the internal chat. Welcome aboard!
