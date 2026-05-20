# GitHub Actions CI/CD

This section contains documentation for CI/CD setup used in the homelab project.

The actual workflow files are executed by GitHub Actions using a self-hosted runner running on the Ubuntu VM.

---

## Workflow File Location

GitHub Actions only detects workflow files placed in:

```text
.github/workflows/
```

Correct structure:

```text
homelab/
├── .github/
│   └── workflows/
│       └── deploy.yml
├── apps/
├── scripts/
└── virtualbox/
```

---

## Overview

CI/CD pipeline is used to:
- pull latest code
- build Docker images
- deploy containers using Docker Compose
- run everything on a self-hosted runner inside the VM

---

## GitHub Runner Setup

The runner must be created manually in GitHub:

1. Open repository in GitHub
2. Go to:
   ```text
   Settings → Actions → Runners → New self-hosted runner
   ```
3. Select:
   - Linux
   - x64 (or your architecture)

4. Follow GitHub instructions:
   - download runner
   - extract it
   - configure it with provided token

Example:

```bash
./config.sh --url https://github.com/<user>/<repo> --token <TOKEN>
```

---

## Start GitHub Runner

The runner must be running for CI/CD to work.

Start it manually:

```bash
~/actions-runner/run.sh
```

Important notes:
- if runner is not running, jobs will stay queued or fail
- runner must stay active during deployments
- stop runner = no CI/CD execution

---

## Deploy Workflow

The deployment workflow is defined in:

```text
.github/workflows/deploy.yml
```

This file:
- triggers on push to main branch
- runs on self-hosted runner
- deploys Docker containers via Docker Compose

---

## Example deploy.yml

```yaml
name: Deploy Homelab

on:
  push:
    branches:
      - main

jobs:
  deploy:
    runs-on: self-hosted

    steps:
      - name: Checkout repository
        uses: actions/checkout@v4

      - name: Stop containers
        run: docker compose down || true

      - name: Build and start containers
        run: docker compose up -d --build
```

---

## Requirements

- Docker installed on VM
- Docker Compose installed
- Self-hosted runner configured and running
- VM reachable via IP address

---

## Access After Deployment

Replace `VM-IP` with your VM address:

```text
http://VM-IP:5000   → Flask app
http://VM-IP:8080   → cAdvisor
```

---

## Important Notes

- Never commit secrets or `.env` files to GitHub
- Self-hosted runner should not be exposed publicly
- Prefer running runner as a background service later (systemd recommended)
- Always test `docker compose up` manually before relying on CI/CD

---

## Purpose

This CI/CD setup is used for learning:
- GitHub Actions
- self-hosted runners
- Docker-based deployment
- basic DevOps automation workflow
