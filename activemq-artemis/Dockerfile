ARG TAG=latest
FROM oceanebelle/openjdk:$TAG

ENV \
  ARTEMIS_USER=artemis \
  ARTEMIS_PASS=artemis \
  ANONYMOUS_LOGIN=False \
  ARTEMIS_VERSION="2.12.0" 
ENV \
  ARTEMIS="apache-artemis-$ARTEMIS_VERSION" \
  ARTEMIS_HOME="/opt/activemq-artemis" \
  ARTEMIS_INSTANCE_DIR="/var/lib/artemis-instance" \
  CREATE_ARGUMENTS="--user ${ARTEMIS_USER} --password ${ARTEMIS_PASS} --allow-anonymous ${ANONYMOUS_LOGIN} --silent --http-host 0.0.0.0 --relax-jolokia"

# add user and group for artemis
RUN set -eux; \ 
    groupadd -r artemis --gid=1000; \
    useradd -r -g artemis --uid=1000 artemis; \
    mkdir -p "$ARTEMIS_INSTANCE_DIR" "$ARTEMIS_INSTANCE_DIR/etc" "$ARTEMIS_INSTANCE_DIR/log";  \
    chown artemis:artemis "$ARTEMIS_INSTANCE_DIR" "$ARTEMIS_INSTANCE_DIR/etc" "$ARTEMIS_INSTANCE_DIR/log"

# Download Artemis
RUN set -eux; \
    mkdir -p /opt ; \
    curl -s -S  http://apache.mirror.anlx.net/activemq/activemq-artemis/${ARTEMIS_VERSION}/apache-artemis-${ARTEMIS_VERSION}-bin.tar.gz | tar -xz -C /opt ; \
    ln -fs /opt/${ARTEMIS} ${ARTEMIS_HOME}; \
    chown artemis:artemis "/opt/$ARTEMIS"; \ 
    chown artemis:artemis "$ARTEMIS_HOME"

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