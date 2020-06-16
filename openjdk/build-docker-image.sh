#!/bin/bash
set -e

# build latest locally
# docker build -t oceanebelle/zookeeper .

# builds multiple architectures for the developer tag and upload to dockerhub
image=$(basename $PWD)
tag=${1:-latest}
docker buildx build --platform linux/amd64 --build-arg TAG=${tag} --pull --no-cache -t "oceanebelle/${image}:${tag}" .