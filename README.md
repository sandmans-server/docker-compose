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

### 4. Portainer Service

The `portainer.yaml` file contains the configuration for the Portainer service. Portainer provides a simple and user-friendly interface for managing Docker environments.

To start only the Portainer service:

```bash
docker-compose -f portainer.yaml up -d
```

---

### 5. Imgproxy Service

The `imgproxy.yaml` file contains the configuration for the Imgproxy service. Imgproxy is an image processing tool that can be run as a service.

To start the Imgproxy service:

```bash
docker-compose -f imgproxy.yaml up -d
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

---

## 📑 Appendix

### Ports Used

| Host Port | Service Name | Service Container Port | Description                     |
|-----------|--------------|------------------------|---------------------------------|
| 18000     | Portainer    | 8000                   | Edge agent communication       |
| 19443     | Portainer    | 9443                   | Secure web UI (HTTPS)          |
| 19000     | Portainer    | 9000                   | Legacy HTTP UI (optional)      |
| 18080     | Keycloak     | 8080                   | Keycloak authentication server |
| 20001     | Imgproxy     | 8080                   | Image processing service       |
