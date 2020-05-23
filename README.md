# docker

Sandbox for various dockerized containers used in day to day development.

- openjdk

![Docker Build](https://img.shields.io/docker/cloud/automated/oceanebelle/openjdk)
![Docker Build](https://img.shields.io/docker/cloud/build/oceanebelle/openjdk)
![Docker Pulls](https://img.shields.io/docker/pulls/oceanebelle/openjdk)

- postgresql

![Docker Build](https://img.shields.io/docker/cloud/automated/oceanebelle/postgresql)
![Docker Build](https://img.shields.io/docker/cloud/build/oceanebelle/postgresql)
![Docker Pulls](https://img.shields.io/docker/pulls/oceanebelle/postgresql)

- jboss-wildfly

![Docker Build](https://img.shields.io/docker/cloud/automated/oceanebelle/jboss-wildfly)
![Docker Build](https://img.shields.io/docker/cloud/build/oceanebelle/jboss-wildfly)
![Docker Pulls](https://img.shields.io/docker/pulls/oceanebelle/jboss-wildfly)

- activemq-artemis

![Docker Build](https://img.shields.io/docker/cloud/automated/oceanebelle/activemq-artemis)
![Docker Build](https://img.shields.io/docker/cloud/build/oceanebelle/activemq-artemis)
![Docker Pulls](https://img.shields.io/docker/pulls/oceanebelle/activemq-artemis)


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

