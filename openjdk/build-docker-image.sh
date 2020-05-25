#!/bin/bash
set -e


# build multi arch developer tag
image=$(basename $PWD)
tag=${1:-developer}
docker buildx build --platform linux/arm/v7,linux/amd64 --build-arg TAG=${tag} --pull --no-cache -t "oceanebelle/${image}:${tag}" --push .
