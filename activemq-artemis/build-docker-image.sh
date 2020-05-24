#!/bin/bash
set -e

# Images are built using github actions

docker build --tag=oceanebelle/activemq-artemis .