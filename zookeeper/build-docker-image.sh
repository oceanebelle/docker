#!/bin/bash
set -e

# build latest locally
# docker build -t oceanebelle/zookeeper .

# builds multiple architectures for the developer tag and upload to dockerhub
docker buildx build --platform linux/amd64,linux/arm/v7 --no-cache -t oceanebelle/zookeeper:developer --push -f Dockerfile.developer .
