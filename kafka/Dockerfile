ARG TAG=latest
FROM oceanebelle/openjdk:$TAG

ENV KAFKA_USER kafka
ENV KAFKA_VERSION 2.5.0
ENV KAFKA_SCALA 2.12
ENV KAFKA_HOME /opt/apache/kafka
ENV KAFKA_ROOT /opt/apache

# add user and group for artemis
RUN set -eux; \ 
    groupadd -r kafka --gid=1000; \
    useradd -r -g kafka --uid=1000 kafka; \
    mkdir -p "$KAFKA_ROOT";  \
    chown -R kafka:kafka "${KAFKA_ROOT}"

# Download kafka
RUN set -eux; \
    curl -s -S  https://apache.mirrors.nublue.co.uk/kafka/${KAFKA_VERSION}/kafka_${KAFKA_SCALA}-${KAFKA_VERSION}.tgz | tar -xz -C ${KAFKA_ROOT}; \
    mv ${KAFKA_ROOT}/kafka_${KAFKA_SCALA}-${KAFKA_VERSION} ${KAFKA_HOME}; \
    chown -R kafka:kafka "${KAFKA_HOME}"

ENV PATH=$PATH:${KAFKA_HOME}/bin

USER kafka

RUN \
  mkdir -p ${KAFKA_HOME}/scripts; \
  chown -R kafka:kafka ${KAFKA_HOME}/scripts

COPY /scripts ${KAFKA_HOME}/scripts


EXPOSE \
  9092

WORKDIR ${KAFKA_HOME}
VOLUME ["${KAFKA_HOME}/scripts"]

CMD ["kafka-server-start.sh", "config/server.properties"]