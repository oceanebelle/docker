FROM ubuntu:18.04

FROM oceanebelle/openjdk

# Set the WILDFLY_VERSION env variable
ENV WILDFLY_VERSION=19.0.0.Final \
    WILDFLY_SHA1=0d47c0e8054353f3e2749c11214eab5bc7d78a14 \
    JBOSS_HOME=/opt/jboss/wildfly \
    JBOSS_ROOT=/opt/jboss \
    PATH=$PATH:/opt/jboss/wildfly/bin \
# Ensure signals are forwarded to the JVM process correctly for graceful shutdown
    LAUNCH_JBOSS_IN_BACKGROUND=true 

# Add user
RUN set -eux; \
    groupadd -r jboss --gid=1000; \
    useradd -r -g jboss --uid=1000 jboss; \
    mkdir -p "${JBOSS_ROOT}" "/scripts"; \
    chown jboss:jboss "$JBOSS_ROOT" "/scripts"; 

# Add the WildFly distribution to /opt, and make wildfly the owner of the extracted tar content
# Make sure the distribution is available from a well-known place
RUN set -eux; \
    cd /opt; \
    curl --silent -O https://download.jboss.org/wildfly/$WILDFLY_VERSION/wildfly-$WILDFLY_VERSION.tar.gz; \
    sha1sum wildfly-$WILDFLY_VERSION.tar.gz | grep $WILDFLY_SHA1; \
    tar xf wildfly-$WILDFLY_VERSION.tar.gz; \
    mv -f /opt/wildfly-$WILDFLY_VERSION $JBOSS_HOME; \
    rm wildfly-$WILDFLY_VERSION.tar.gz; \
    chown -R jboss:jboss ${JBOSS_HOME}; 

# Expose the ports we're interested in
EXPOSE \
  8080 \
  9990

USER jboss

COPY ./scripts /scripts

WORKDIR ${JBOSS_HOME}
VOLUME ["$JBOSS_HOME"]

ENV WILDFLY_USER=admin \
    WILDFLY_PASS=admin
    
RUN /opt/jboss/wildfly/bin/add-user.sh ${WILDFLY_USER} ${WILDFLY_PASS} --silent

# Set the default command to run on boot
# This will boot WildFly in the standalone mode and bind to all interface
CMD ["/opt/jboss/wildfly/bin/standalone.sh", "-b", "0.0.0.0", "-bmanagement", "0.0.0.0"]