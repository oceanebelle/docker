
# Zookeeper

![build zookeeper image](https://github.com/oceanebelle/docker/workflows/build%20zookeeper%20image/badge.svg)

## Docker Hub

![Docker Build](https://img.shields.io/docker/cloud/automated/oceanebelle/zookeeper)
![Docker Build](https://img.shields.io/docker/cloud/build/oceanebelle/zookeeper)
![Docker Pulls](https://img.shields.io/docker/pulls/oceanebelle/zookeeper)

## Details

Building a custom image for zookeeper


## Zookeeper recipes

1. Name Server
2. Configuration
3. Group Membership (via Sequence|Ephemeral flags)

Other recipes: https://zookeeper.apache.org/doc/r3.4.3/recipes.html

## docker-compose commands

```bash
# Quick stop, rm, start and then connect via exec bash
docker-compose stop && docker-compose rm -f &&  docker-compose up -d && docker-compose exec zookeeper bash

# Use exec command to execute scripts against the postgres service
docker-compose exec zookeeper bash
```

## zookeeper location

Endpoint for admin service of zookeeper

    http://localhost:8080/commands

