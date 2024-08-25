#!/bin/bash

export ADMIN_PASSWORD=${ADMIN_PASSWORD:-admin_password}
export PGUSER=${PGUSER:-postgres}
export PGPASSWORD=${PGPASSWORD:-password}

echo "Setting up the database..."

psql -d postgres -v ON_ERROR_STOP=1 <<-EOSQL
    CREATE DATABASE arbitrages;
EOSQL

# Check if the arbitrages database exists, and create it if it doesn't
psql -d arbitrages -tc "SELECT 1 FROM pg_database WHERE datname = 'arbitrages'" | grep -q 1 || \
psql -d arbitrages  -c "CREATE DATABASE arbitrages;"

# Create the arbitrage_admin user and grant privileges if necessary
psql -d arbitrages -v ON_ERROR_STOP=1 <<-EOSQL
    DO \$\$
    BEGIN
        IF NOT EXISTS (
            SELECT FROM pg_catalog.pg_roles
            WHERE rolname = 'arbitrage_admin') THEN
            CREATE USER arbitrage_admin WITH PASSWORD '$ADMIN_PASSWORD';
        END IF;
        ALTER USER arbitrage_admin with superuser;
        ALTER DATABASE arbitrages OWNER TO arbitrage_admin;
    END
    \$\$;
EOSQL

# Execute all other DDL scripts in order, connecting as the postgres user
for file in ddl/*.sql; do
    if [[ $file != *"00_create_admin.sql"* ]]; then
        PGPASSWORD=${ADMIN_PASSWORD} psql -U arbitrage_admin -d arbitrages -v ON_ERROR_STOP=1 -f $file
    fi
done

echo "Database setup complete!"