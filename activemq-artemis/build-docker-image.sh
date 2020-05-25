#!/bin/bash
set -e

# Images are built using github actions
image=$(basename $PWD)
docker buildx build --platform linux/arm/v7,linux/amd64 --build-arg BUILD_TAG=developer --pull --no-cache -t "oceanebelle/${image}:developer" --push .
