FROM adoptopenjdk/openjdk11:jdk-11.0.7_10-slim AS build

RUN mkdir /log
VOLUME /log

# Location for application files
RUN mkdir /app
VOLUME /app

COPY ./docker-entrypoint.sh /docker-entrypoint-javaapp.sh

# Default runner
ENTRYPOINT ["/bin/sh", "/docker-entrypoint-javaapp.sh"]

# Default parameter sent to entrypoint
CMD ["PRINT_VERSION"]