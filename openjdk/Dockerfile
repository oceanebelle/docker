ARG TAG=latest
ARG UBUNTU_VERSION=18.04
ARG JDK_VERSION=openjdk11
ARG JDK_TAG=jdk-11.0.7_10-slim
FROM ubuntu:${UBUNTU_VERSION} as osbuild
FROM adoptopenjdk/$JDK_VERSION:$JDK_TAG AS jdkbuild

ARG TAG
ARG JDK_VERSION
ARG JDK_TAG
ARG UBUNTU_VERSION


ENV APP_HOME=/opt/app \
    APP_LOG=/opt/app/log \
    APP_LIB=/opt/app/lib \
    PATH=$PATH:/opt/app

# Install required packges
RUN set -eux; \
    apt-get update; \
    DEBIAN_FRONTEND=noninteractive \
    apt-get install -y --no-install-recommends \
        ca-certificates \
        curl \
        dirmngr \
        gosu \
        gnupg \
        netcat \
        net-tools \
        wget; \
    rm -rf /var/lib/apt/lists/*; \
# Verify that gosu binary works
    gosu nobody true

# Setup app locations and permissions
RUN set eux; \
    mkdir -p "${APP_HOME}" "${APP_LOG}" "${APP_LIB}"; \
    chmod -R 777 ${APP_HOME} ${APP_LOG} ${APP_LIB}

RUN echo "Building image for $TAG using adoptopenjdk/$JDK_VERSION:$JDK_TAG on ubuntu/$UBUNTU_VERSION" > $APP_LOG/build-jdk.out    

COPY ./docker-entrypoint.sh /docker-entrypoint-javaapp.sh

# Default command when run
CMD ["/docker-entrypoint-javaapp.sh", "PRINT_VERSION"]