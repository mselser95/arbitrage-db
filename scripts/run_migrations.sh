#!/bin/bash

echo "Running migrations..."

# Apply any new DDL files
for file in ddl/*.sql; do
    psql -v ON_ERROR_STOP=1 -d arbitrages -f $file
done

echo "Migrations complete!"
