
# docker

![Build and Push latest images](https://github.com/oceanebelle/docker/workflows/Build%20and%20Push%20latest%20images/badge.svg)

## Diagram

![diagram](./diagram.drawio.svg)

## Using via docker-compose 

```Shell
# to start in the background
docker-compose up -d

# to stop
docker-compose stop

# remove the container
docker-compose rm -f

# follow logs
docker-compose logs -f

# Quick stop, rm, start and then connect via exec bash
docker-compose stop && docker-compose rm -f &&  docker-compose up -d && docker-compose exec postgres bash

# Use exec command to execute scripts against the postgres service
docker-compose exec postgres bash /scripts/initdb.sh
```

## Using docker cli 

> manage docker artifacts

```Shell
# list all running docker containers
docker ps -a

# clean up all unused containers and images
docker container prune -f
docker image prune -a -f

# clean up dangling volumes not used by containers

 docker volume rm $(docker volume ls -q)

# build an image in a directory with ``Dockerfile``
docker build --tag=oceanebelle/image .

# inspecting a built container, by running interactive bash and docker run
# interactive bash
docker run -it --rm -P --name test_image --entrypoint bash oceanebelle/openjdk

# inspecting a built container, with mounts
docker run -it --rm -P --name test_image -v log:/opt/app/log oceanebelle/openjdk

# inspecting expose the image to host networking
docker run -it --rm -P --name test_image --network host oceanebelle/jboss-wildfly

# expose port to host
docker run -it --rm -P --name test_image -p 8080:8080 oceanebelle/jboss-wildfly
```

## Using docker multi architecture buildx

> Enable experimental option to use buildx

```Shell
# In ~/.docker/config.json
{
        "experimental": "enabled",
        "currentContext": "remote"
}
```

> Setup docker builder and buildx

```Shell
# list all context
docker context ls
# list all the context available
docker context inspect default

# create a docker contexts for all docker daemons
docker context create  node-armv7 --description "raspberry pi model 4" --docker host=tcp://pinya:2375
docker context create  node-amd64 --description "ubuntu wsl" --docker host=tcp://localhost:2375
docker context create  node-armv6 --description "raspberry pi zero" --docker host=tcp://enviro:2375

# create a new builder for buildx and add all the docker daemons created previously
# create and use the builder
docker buildx create --use    --name multibuilder node-amd64 --platform linux/amd64
docker buildx create --append --name multibuilder node-armv7 --platform linux/arm/v7
docker buildx create --append --name multibuilder node-armv6 --platform linux/arm/v6

# inspect the newly created builder and bootstrap it
docker buildx use multibuilder
docker buildx inspect multibuilder --bootstrap

# build accordingly, this build produces multiple target architecture
docker buildx build --platform linux/amd64,linux/arm/v7 .

# to remove the builder
docker buildx rm multibuilder

```

## Gotchas when working with docker

Use ``.dockerignore`` to ignore any directory or file that is not part of a build. These could be directories you use for mapping with internal image folders for logs, etc.

## Useful linux commands

```Shell

# test if a port is open 2375 on localhost
nc -v -w5 -z localhost 2375

```

## Raspberry pi troubleshooting

Check that rapsberry pi has enough power, otherwise random session disconnects while doing intensive work such as when buildx is running on raspberry pi.

## Git command helpers

```Shell
git checkout mybranch && git pull

# If returns the my branch, then my branch is up to date
git branch --contains $(git rev-parse origin/master) | grep $(git rev-parse --abbrev-ref HEAD)

# updating my branch with master
git merge origin/master --no-ff
```
