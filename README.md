# docker

Git Hub Action : ![Build and Push latest images](https://github.com/oceanebelle/docker/workflows/Build%20and%20Push%20latest%20images/badge.svg)

# Diagram

![diagram](./diagram.drawio.svg)

# Running via docker-compose and the docker-compose.yml

> to start in the background
```
$ docker-compose up -d
```

> to stop 
```
$ docker-compose stop
```

> remove the container
```
$ docker-compose rm -f
```
> follow logs
```
$ docker-compose logs -f
```

> enter container
```
$ docker-compose exec <service> bash
$ docker-compose exec postgres bash
```

> Quick stop, rm, start and then connect via exec bash
```
$  docker-compose stop && docker-compose rm -f &&  docker-compose up -d && docker-compose exec postgres bash
```

> Use exec command on the service to execute scripts against the database
```
$ docker-compose exec postgres bash /scripts/initdb.sh
```

# Docker command for building and troubleshooting images

> build an image in a directory with ``Dockerfile``

```
docker build --tag=oceanebelle/image .
```

> inspecting a built container, by running interactive bash

```
docker run -it --rm -P --name test_image oceanebelle/image bash
```

