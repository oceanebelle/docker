#!/bin/bash
set -e


#docker buildx ls
#docker buildx create --use --name localbuilder node-amd64
#docker buildx create --append --name localbuilder node-arm64

docker buildx build --platform linux/amd64,linux/arm/v7 --no-cache -t oceanebelle/openjdk:test --push .
