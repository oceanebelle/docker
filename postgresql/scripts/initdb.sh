#!/bin/bash
set -e

function createDatabase() {

  local dbname=$1
  local dbpass=$2

# mind the heredoc, no space on the ending tag
psql --username ${POSTGRES_USER} --dbname ${POSTGRES_DB} << CREATE_DB_EOF
  CREATE USER ${dbname} WITH PASSWORD '${dbpass}';
  CREATE DATABASE ${dbname};
  GRANT ALL PRIVILEGES ON DATABASE ${dbname} to ${dbname};
CREATE_DB_EOF

}

createDatabase $1 $2