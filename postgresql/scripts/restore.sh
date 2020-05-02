#!/bin/bash
set -e

function restoreDatabase() {

  local dbname=$1
  local filename=$2

psql --username ${POSTGRES_USER} --dbname ${dbname} < $filename

}

# the sql dumps are found in this location within the container.
restoreDatabase $1 /tmp/dumps/$2