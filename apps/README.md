# Homelab Apps

This folder contains Docker Compose applications for the homelab project.

## Requirements

- Docker
- Docker Compose

Install Docker:

- Linux: https://docs.docker.com/engine/install/
- Docker Compose: https://docs.docker.com/compose/install/

---

## Environment Variables

Create a `.env` file inside the `apps` folder.

Example:

```env
DB_HOST=db
DB_NAME=postgres
DB_USER=dbuser
DB_PASS=dbpass
```

Example structure:

```text
homelab/
└── apps/
    ├── docker-compose.yml
    └── .env
```

---

## Run Containers

Start containers in background:

```bash
docker compose up -d
```

Rebuild containers after changes:

```bash
docker compose up -d --build
```

Stop containers:

```bash
docker compose down
```

View logs:

```bash
docker compose logs
```

View logs for single container:

```bash
docker compose logs web
```

---

## Access Services

Replace `VM-IP` with your Ubuntu Server IP address.

Example:

```bash
ip a
```

### Flask App

```text
http://VM-IP:5000
```

### cAdvisor Monitoring

```text
http://VM-IP:8080
```

---

## Useful Commands

Show running containers:

```bash
docker ps
```

Check container resource usage:

```bash
docker stats
```

