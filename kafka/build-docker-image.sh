#!/bin/bash
set -e

# Images are built using github actions
image=$(basename $PWD)
docker buildx build --platform linux/arm/v7,linux/amd64 --pull --no-cache -t "oceanebelle/${image}:developer" --push -f Dockerfile.developer .
