#!/bin/bash
set -e


# build multi arch developer tag
docker buildx build --platform linux/arm/v7,linux/amd64 --no-cache -t oceanebelle/openjdk:developer --push -f Dockerfile.developer .
