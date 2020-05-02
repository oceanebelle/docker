#!/bin/bash
set -e

function dumpDatabase() {

  local dbname=$1
  local dumpdt=`date +%Y%m%d-%H%M%S`


  pg_dump -U $POSTGRES_USER $dbname > /tmp/dumps/${dbname}_${dumpdt}.sql

}

dumpDatabase $1