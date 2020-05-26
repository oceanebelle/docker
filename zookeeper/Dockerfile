ARG TAG=latest
FROM oceanebelle/openjdk:$TAG

ENV ZOO_HOME=/opt/apache/zookeeper \
    ZOO_ROOT=/opt/apache

ENV ZOO_CONF_DIR=${ZOO_HOME}/conf \
    ZOO_DATA_DIR=${ZOO_HOME}/data \
    ZOO_DATA_LOG_DIR=${ZOO_HOME}/datalog \
    ZOO_LOG_DIR=${ZOO_HOME}/logs \
    ZOO_TICK_TIME=2000 \
    ZOO_INIT_LIMIT=5 \
    ZOO_SYNC_LIMIT=2 \
    ZOO_AUTOPURGE_PURGEINTERVAL=0 \
    ZOO_AUTOPURGE_SNAPRETAINCOUNT=3 \
    ZOO_MAX_CLIENT_CNXNS=60 \
    ZOO_STANDALONE_ENABLED=true \
    ZOO_ADMINSERVER_ENABLED=true \
    ZOO_LOG4J_PROP=INFO,CONSOLE,ROLLINGFILE

# Add a user with an explicit UID/GID and create necessary directories
RUN set -eux; \
    groupadd -r zookeeper --gid=1000; \
    useradd -r -g zookeeper --uid=1000 zookeeper; \
    mkdir -p "${ZOO_ROOT}"; \
    chown zookeeper:zookeeper "${ZOO_ROOT}"

ARG SHORT_DISTRO_NAME=zookeeper-3.6.1
ARG DISTRO_NAME=apache-zookeeper-3.6.1-bin

# Download Apache Zookeeper, untar and clean up
RUN set -eux; \
    ddist() { \
        local f="$1"; shift; \
        local distFile="$1"; shift; \
        local success=; \
        local distUrl=; \
        for distUrl in \
            'https://www.apache.org/dyn/closer.cgi?action=download&filename=' \
            https://www-us.apache.org/dist/ \
            https://www.apache.org/dist/ \
            https://archive.apache.org/dist/ \
        ; do \
            if wget -q -O "$f" "$distUrl$distFile" && [ -s "$f" ]; then \
                success=1; \
                break; \
            fi; \
        done; \
        [ -n "$success" ]; \
    }; \
    ddist "$DISTRO_NAME.tar.gz" "zookeeper/$SHORT_DISTRO_NAME/$DISTRO_NAME.tar.gz"; \
    export GNUPGHOME="$(mktemp -d)"; \
    tar -zxf "$DISTRO_NAME.tar.gz" -C ${ZOO_ROOT} ; \
    mv ${ZOO_ROOT}/${DISTRO_NAME} "${ZOO_HOME}"; \    
    rm -rf "$GNUPGHOME" "$DISTRO_NAME.tar.gz";  \
    chown -R zookeeper:zookeeper "$ZOO_HOME"

RUN mkdir -p "${ZOO_DATA_DIR}" "${ZOO_DATA_LOG_DIR}" "${ZOO_LOG_DIR}"; \
    chown -R zookeeper:zookeeper "${ZOO_HOME}"



EXPOSE \ 
    2181 \
    2888 \
    3888 \
    8080

USER zookeeper
WORKDIR $ZOO_HOME

ENV PATH=$PATH:$ZOO_HOME/bin \
    ZOOCFGDIR=$ZOO_CONF_DIR

VOLUME ["${ZOO_CONF_DIR}", "${ZOO_DATA_DIR}", "${ZOO_DATA_LOG_DIR}", "${ZOO_LOG_DIR}"]    

COPY docker-entrypoint.sh /docker-entrypoint-zookeeper.sh
ENTRYPOINT ["/docker-entrypoint-zookeeper.sh"]
CMD ["zkServer.sh", "start-foreground"]
