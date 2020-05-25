#!/bin/bash
set -e

# Images are built using github actions
image=$(basename $PWD)
tag=${1:-developer}
docker buildx build --platform linux/arm/v7,linux/amd64 --build-arg TAG=${tag} --pull --no-cache -t "oceanebelle/${image}:${tag}" --push .