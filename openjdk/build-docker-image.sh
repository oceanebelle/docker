#!/bin/bash
set -e

docker build --tag=oceanebelle/docker:latest-openjdk - < Dockerfile-ubuntu