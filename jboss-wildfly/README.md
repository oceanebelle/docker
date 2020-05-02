# Build the my/jboss/wildfly image
$ ./build-docker-image.sh

# Quick debugging wildfly image using docker-compose commands
$ docker-compose stop && docker-compose rm -f && docker-compose up -d && docker-compose exec wildfly bash