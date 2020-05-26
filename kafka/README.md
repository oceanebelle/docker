# Kafka

![build kafka image](https://github.com/oceanebelle/docker/workflows/build%20kafka%20image/badge.svg)

## Docker Hub

![Docker Build](https://img.shields.io/docker/cloud/automated/oceanebelle/kafka)
![Docker Build](https://img.shields.io/docker/cloud/build/oceanebelle/kafka)
![Docker Pulls](https://img.shields.io/docker/pulls/oceanebelle/kafka)

## Details

Building a custom image for kafka

## Running kafka using docker

```bash
docker run -it --rm --network host oceanebelle/kafka
```

## Kafka management

Manage kafka topics by hopping into kafka service

```bash
docker-compose exec kafka bash
# Using kafka server
kafka-topics.sh --create --topic my-topic2 --partitions 1 --replication-factor 1 --bootstrap-server kafka:9092

# Using using zookeeper server
kafka-topics.sh --create --topic my-topic2 --partitions 1 --replication-factor 1 --zookeeper zookeeper:2181

# list all topics
kafka-topics.sh --list --zookeeper zookeeper:2181
```

