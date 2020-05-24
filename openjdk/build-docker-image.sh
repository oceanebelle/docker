#!/bin/bash
set -e


# build multi arch developer tag
image=$(basename $PWD)
docker buildx build --platform linux/arm/v7,linux/amd64 --pull --no-cache -t "oceanebelle/${image}:developer" --push -f Dockerfile.developer .
