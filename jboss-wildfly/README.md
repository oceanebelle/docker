![build jboss-wildfly image](https://github.com/oceanebelle/docker/workflows/build%20jboss-wildfly%20image/badge.svg)

![Docker Build](https://img.shields.io/docker/cloud/automated/oceanebelle/jboss-wildfly)
![Docker Build](https://img.shields.io/docker/cloud/build/oceanebelle/jboss-wildfly)
![Docker Pulls](https://img.shields.io/docker/pulls/oceanebelle/jboss-wildfly)

# Build the my/jboss/wildfly image
$ ./build-docker-image.sh

# Quick debugging wildfly image using docker-compose commands
$ docker-compose stop && docker-compose rm -f && docker-compose up -d && docker-compose exec wildfly bash

# Wildfly for microservices: 
see https://thorntail.io/ (previosuly known as wildfly swarm)
Can run as its own jar for execution  for microprofile
or packaged as a war to run on wildfly or other jee containerss