#!/bin/bash
set -e

# If building on an arm7 arch like raspberry
# docker build --tag=oceanebelle/postgresql:12-arm32v7 .

# If building using experimental buildx
docker buildx build --platform linux/arm/v7 --no-cache --tag=oceanebelle/postgresql:12-arm32v7 -f Dockerfile-arm32v7 .