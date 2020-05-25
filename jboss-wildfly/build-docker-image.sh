#!/bin/bash

set -eo

# preview images built on github workflows
image=$(basename $PWD)
tag=${1:-developer}
docker buildx build --platform linux/arm/v7,linux/amd64 --build-arg TAG=${tag} --pull --no-cache -t "oceanebelle/${image}:${tag}" --push .
