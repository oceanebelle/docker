#!/bin/bash
set -e

# preview image built on github action workflows

docker build --no-cache  --tag=oceanebelle/postgresql .
