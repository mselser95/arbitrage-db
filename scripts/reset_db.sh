#!/bin/bash

export ADMIN_PASSWORD=${ADMIN_PASSWORD:-admin_password}

echo "Resetting the database..."

# Connect to PostgreSQL as the postgres user and drop the database and users
psql -d postgres -v ON_ERROR_STOP=1 <<-EOSQL
    DROP DATABASE IF EXISTS arbitrages;
EOSQL

echo "Database reset complete!"