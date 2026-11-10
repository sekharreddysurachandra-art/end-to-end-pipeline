# End-to-End Data Pipeline

An end-to-end data pipeline that ingests raw data from source systems, transforms and validates it, and loads it into Snowflake for analytics and reporting.

## Overview

1. **Ingest** – Extract raw data from source systems (files, APIs, databases) into a staging area.
2. **Transform** – Clean, standardize, and model the data into analytics-ready tables.
3. **Validate** – Run data quality checks (nulls, duplicates, freshness, row counts).
4. **Load / Serve** – Publish curated tables in Snowflake for dashboards and downstream consumers.

## Setup

### Prerequisites

- Python 3.9+
- Git
- A Snowflake account with a role that can create databases, schemas, and tables

### Installation

```bash
git clone <repo-url> end-to-end-pipeline
cd end-to-end-pipeline
python -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt
```

### Configuration

Set your Snowflake connection details as environment variables (do not commit credentials):

```bash
export SNOWFLAKE_ACCOUNT=<account_identifier>
export SNOWFLAKE_USER=<user>
export SNOWFLAKE_PASSWORD=<password>
export SNOWFLAKE_ROLE=<role>
export SNOWFLAKE_WAREHOUSE=<warehouse>
export SNOWFLAKE_DATABASE=<database>
export SNOWFLAKE_SCHEMA=<schema>
```

## Usage

Run the full pipeline:

```bash
python -m pipeline run
```

Run individual stages:

```bash
python -m pipeline ingest
python -m pipeline transform
python -m pipeline validate
```

Check the target tables in Snowflake once the run completes.

## Test

This line was added by Cortex on the dev branch.
