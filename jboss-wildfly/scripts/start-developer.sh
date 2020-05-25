#!/bin/bash
set eux;

echo "Adding user $WILDFLY_USER to admin"
${JBOSS_HOME}/bin/add-user.sh $WILDFLY_USER $WILDFLY_PASS --silent

echo "Starting wildfly standalone mode"
${JBOSS_HOME}/bin/standalone.sh -b 0.0.0.0 -bmanagement 0.0.0.0

