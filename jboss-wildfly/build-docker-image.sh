#!/bin/bash

set -eo

# preview images built on github workflows

docker build --tag=oceanebelle/jboss-wildfly .