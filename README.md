
# CompCache
# ComCache

ComCache is a lightweight Redis-based caching container designed for high-performance applications.
It provides a ready-to-deploy caching service with built-in rate limiting support and automated Docker builds.

---

# Features

✔ Redis-based high-performance caching
✔ Docker ready for easy container deployment
✔ Built-in rate limiting support using Redis counters
✔ Customizable Redis configuration (`redis.conf`)
✔ Automated image build using GitHub CI/CD workflows

---

# Architecture

ComCache runs as a containerized Redis service that can be deployed in cloud environments, Kubernetes clusters, or local Docker setups.

Example architecture:

Application → API Gateway → ComCache (Redis) → Database

ComCache stores frequently accessed data and rate-limiting counters to reduce load on backend services.

---

# Quick Start

## Pull Docker Image

```bash
docker pull rakibkidwai09/comcache:latest
```

## Run Container

```bash
docker run -d \
-p 6379:6379 \
--name comcache \
rakibkidwai09/comcache:latest
```

## Connect using Redis CLI

```bash
redis-cli -h localhost -p 6379
```

---

# Rate Limiting Example

ComCache can be used to limit API requests.

Example Redis key:

```
ratelimit:login:192.168.1.10
```

Limit login attempts to **10 requests per minute**.

---

# Configuration

You can customize Redis behavior using `redis.conf`.

Example configuration:

```
maxmemory 512mb
maxmemory-policy allkeys-lru
appendonly yes
```

This allows control over memory usage, persistence, and eviction policies.

---

# Kubernetes / OpenShift Deployment

Example deployment:

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: comcache
spec:
  replicas: 1
  selector:
    matchLabels:
      app: comcache
  template:
    metadata:
      labels:
        app: comcache
    spec:
      containers:
      - name: comcache
        image: rakibkidwai09/comcache:latest
        ports:
        - containerPort: 6379
```

---

# Benchmark

You can test performance using Redis benchmark:

```bash
redis-benchmark -h localhost -p 6379 -n 100000 -c 50
```

---

# Security

Recommended production settings:

* Enable Redis password authentication
* Disable dangerous commands like `FLUSHALL`
* Restrict network access using firewall rules

---

# CI/CD

The project uses GitHub Actions to automatically:

* Build Docker images
* Tag versions
* Push images to Docker Hub

---

# Contributing

Pull requests are welcome.
For major changes, please open an issue first to discuss your proposed changes.

---

# License

MIT License

CompCache is a simple dockerized caching service built on Redis.

## Run

docker compose up --build

## Test

docker exec -it compcache redis-cli

SET test "hello"
GET test