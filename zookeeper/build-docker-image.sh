#!/bin/bash
set -e

# build latest locally
# docker build -t oceanebelle/zookeeper .

# builds multiple architectures for the developer tag and upload to dockerhub
image=$(basename $PWD)
docker buildx build --platform linux/arm/v7,linux/amd64 --pull --no-cache -t "oceanebelle/${image}:developer" --push -f Dockerfile.developer .
