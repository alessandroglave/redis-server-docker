# redis-server-docker

## Setup

- clone this repository

- install docker & docker compose

```
chmod +x docker.sh
./docker.sh
```

# Run image
```
docker-compose up -d
```

# CLI

```
# get container name (es. redis_redis_1)
docker-compose ps
docker exec -it redis_redis_1 /bin/sh
redis-cli
AUTH ${PWD}
keys *    # number of keys
FLUSHALL # delete all db
```
