#!/bin/bash
set -e

function dumpDatabase() {

  local dbname=$1
  local dumpdt=`date +%Y%m%d`


  local backup_file=/dumps/${dbname}_${dumpdt}.sql
  pg_dump -U $POSTGRES_USER $dbname > $backup_file

  echo "Created backup in $backup_file"

}

dumpDatabase $1