FROM jboss/wildfly:19.0.0.Final

ENV WILDFLY_USER admin
ENV WILDFLY_PASS admin

RUN /opt/jboss/wildfly/bin/add-user.sh ${WILDFLY_USER} ${WILDFLY_PASS} --silent
CMD ["/opt/jboss/wildfly/bin/standalone.sh", "-b", "0.0.0.0", "-bmanagement", "0.0.0.0"]