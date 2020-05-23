# PostgresSQL

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


# Running via docker run
Build an image from the Dockerfile and assign it a name.
```
$ docker build -t md_postgresql .
```

Run the PostgreSQL server container (in the foreground):
```
$ docker run --rm -P --name pg_test md_postgresql
```

Other way
```
docker run --name some-postgres -p 5432:5432 -e POSTGRES_PASSWORD=postgres -d postgres
```

# When connected to the postgres container ie bash, run the following
```
psql --username "$POSTGRES_USER" --dbname "$POSTGRES_DB"
> \?
> \c [dbname]
> \q
```

# using exec to execute scripts

> Running init on postgres service
```
$ docker-compose exec postgres bash /scripts/initdb.sh <dbname> <password>
```
> Running backup on postgres service
```
$  docker-compose exec postgres bash /scripts/backup.sh <dbname>
```
> Running restore on postgres service
```
$  docker-compose exec postgres bash /scripts/restore.sh <dbname> <dbname>_<yyyymmdd-hhmmss>.sql
```
