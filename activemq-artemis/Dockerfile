ARG TAG=latest
FROM oceanebelle/openjdk:$TAG

ENV \
  ARTEMIS_USER=artemis \
  ARTEMIS_PASS=artemis \
  ANONYMOUS_LOGIN=False \
  ARTEMIS_VERSION="2.13.0" \
  ARTEMIS_ROOT="/opt/activemq" \
  ARTEMIS_SHORT_DISTRO="activemq-artemis" 
ENV \
  ARTEMIS_DISTRO="apache-artemis-$ARTEMIS_VERSION" \
  ARTEMIS_HOME="${ARTEMIS_ROOT}/activemq-artemis" \
  ARTEMIS_INSTANCE_DIR="/var/lib/artemis-instance" \
  CREATE_ARGUMENTS="--user ${ARTEMIS_USER} --password ${ARTEMIS_PASS} --allow-anonymous ${ANONYMOUS_LOGIN} --silent --http-host 0.0.0.0 --relax-jolokia"

# add user and group for artemis
RUN set -eux; \ 
    groupadd -r artemis --gid=1000; \
    useradd -r -g artemis --uid=1000 artemis; \
    mkdir -p "${ARTEMIS_ROOT}" "$ARTEMIS_INSTANCE_DIR" "$ARTEMIS_INSTANCE_DIR/etc" "$ARTEMIS_INSTANCE_DIR/log";  \
    chown artemis:artemis "$ARTEMIS_ROOT" "$ARTEMIS_INSTANCE_DIR" "$ARTEMIS_INSTANCE_DIR/etc" "$ARTEMIS_INSTANCE_DIR/log"

# Download Artemis from main download page or from archive mirrors of apache
RUN set -eux; \
    ddist() { \
        local f="$1"; shift; \
        local distFile="$1"; shift; \
        local success=; \
        local distUrl=; \
        for distUrl in \
            'https://www.apache.org/dyn/closer.cgi?action=download&filename=' \
            https://www-us.apache.org/dist/ \
            https://archive.apache.org/dist/ \
            https://www.apache.org/dist/ \
        ; do \
            if wget -q -O "$f" "$distUrl$distFile" && [ -s "$f" ]; then \
                success=1; \
                break; \
            fi; \
        done; \
        [ -n "$success" ]; \
    }; \
    ddist "$ARTEMIS_DISTRO.tar.gz" "activemq/$ARTEMIS_SHORT_DISTRO/${ARTEMIS_VERSION}/$ARTEMIS_DISTRO-bin.tar.gz"; \
    tar -zxf "$ARTEMIS_DISTRO.tar.gz" -C ${ARTEMIS_ROOT} ; \
    mv ${ARTEMIS_ROOT}/${ARTEMIS_DISTRO} ${ARTEMIS_HOME}; \    
    chown -R artemis:artemis "$ARTEMIS_HOME"

EXPOSE \
# Web server
  8161 \    
# JMX Exporter
  9404 \
# CORE,MQTT,AMQP,HORNETQ,STOMP,OPENWIRE
  61616 \
# HORNETQ,STOMP
  5445 \
# AMQP
  5672 \
# MQTT
  1883 \
# STOMP
  61613

COPY ./scripts /  

USER ${ARTEMIS_USER}

VOLUME ["$ARTEMIS_INSTANCE_DIR", "$ARTEMIS_INSTANCE_DIR/etc", "$ARTEMIS_INSTANCE_DIR/log"]
WORKDIR $ARTEMIS_INSTANCE_DIR

ENTRYPOINT ["/start-artemis.sh"]
CMD ["run"]