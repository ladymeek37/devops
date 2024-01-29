#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    SELECT 'CREATE DATABASE crlw_database' 
    WHERE NOT EXISTS (SELECT FROM pg_database WHERE datname = 'crlw_database')\gexec
EOSQL


psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    SELECT 'CREATE DATABASE mrs_database' 
    WHERE NOT EXISTS (SELECT FROM pg_database WHERE datname = 'mrs_database')\gexec
EOSQL