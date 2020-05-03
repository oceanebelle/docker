FROM my/openjdk

SHELL ["/bin/bash", "-o", "pipefail", "-c"]
WORKDIR /opt

ENV ARTEMIS_USER artemis
ENV ARTEMIS_PASS artemis
ENV ANONYMOUS_LOGIN False
ENV ARTEMIS_VERSION 2.12.0
ENV ARTEMIS apache-artemis-$ARTEMIS_VERSION
ENV ARTEMIS_HOME /opt/activemq-artemis
ENV CREATE_ARGUMENTS --user ${ARTEMIS_USER} --password ${ARTEMIS_PASSWORD} --allow-anonymous ${ANONYMOUS_LOGIN} --silent --http-host 0.0.0.0 --relax-jolokia

# add user and group for artemis
RUN groupadd -g 1000 -r artemis && \
    useradd -r -u 1000 -g artemis artemis
# && apt-get -qq -o=Dpkg::Use-Pty=0 update && \
#    apt-get -qq -o=Dpkg::Use-Pty=0 install -y --no-install-recommends \
#    libaio1=0.3.110-3 && \
#    rm -rf /var/lib/apt/lists/*

RUN apt-get -y update && \ 
    apt-get -y install curl && \
    rm -rf /var/lib/apt/lists/* && \
    mkdir -p /opt && \
    curl -s -S  http://apache.mirror.anlx.net/activemq/activemq-artemis/${ARTEMIS_VERSION}/apache-artemis-${ARTEMIS_VERSION}-bin.tar.gz | tar -xvz -C /opt && \
    ln -s /opt/${ARTEMIS} ${ARTEMIS_HOME} && \
    usermod artemis -d ${ARTEMIS_HOME} && \
    chown -R ${ARTEMIS_USER}:${ARTEMIS_USER} /opt/$ARTEMIS && \
    chown -h ${ARTEMIS_USER}:${ARTEMIS_USER} $ARTEMIS_HOME 

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

RUN mkdir /var/lib/artemis-instance && chown -R artemis.artemis /var/lib/artemis-instance
  
USER ${ARTEMIS_USER}

VOLUME ["/var/lib/artemis-instance"]
WORKDIR /var/lib/artemis-instance

ENTRYPOINT ["/start-artemis.sh"]
CMD ["run"]