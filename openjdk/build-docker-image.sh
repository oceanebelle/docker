#!/bin/bash
set -e

# preview images are built on pull request submission

docker build --tag=oceanebelle/openjdk .