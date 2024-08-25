# Arbitrage Database

This repository manages the PostgreSQL database schema for the arbitrage project.

## Setup

### Environment Variables

- `ADMIN_PASSWORD`: Password for the `arbitrage_admin` user (default: `admin_password`).
- `BOT_PASSWORD`: Password for the `bot` user (default: `bot_password`).

You can set these environment variables in your shell or in a `.env` file.

### Makefile Commands

This repository includes a `Makefile` for easy database management. The following commands are available:

- **Nuke the database**:

  This command will drop the existing database and users.

    ```bash
    make nuke
    ```

- **Pave the database**:

  This command will set up the database by creating the necessary users, schemas, and tables.

    ```bash
    make pave
    ```

- **Nuke and Pave the database**:

  This command will drop everything and then set it up again from scratch.

    ```bash
    make nuke_and_pave
    ```

### Directory Structure

The repository is structured as follows:

```plaintext
arbitrage-database/
├── scripts/
│   ├── setup_db.sh
│   ├── reset_db.sh
│   ├── run_migrations.sh
├── ddl/
│   ├── 00_create_admin.sql
│   ├── 01_create_schema.sql
│   ├── 02_create_bot_user.sql
│   ├── 03_grant_permissions.sql
│   ├── 04_create_tables.sql
│   ├── 05_create_indexes.sql
│   ├── 06_create_partitions.sql
└── Makefile
└── README.md
