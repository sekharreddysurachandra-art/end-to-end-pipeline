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

## Creating and Building the Pipeline Using the Snowflake Cortex AI Assistant (Prompts, Not Typing)

This pipeline was created and built with **Snowflake Cortex Code (CoCo)**, Snowflake's AI coding assistant. Instead of hand-typing SQL, Python, and Git commands, each step was done by giving the assistant a natural-language prompt. The assistant then generated the code, ran the commands, and pushed the changes.

### How it works

1. Open Cortex Code in the project directory: `cortex`
2. Describe what you want in plain English.
3. Review what the assistant proposes and approve it. The assistant writes the files, runs SQL against Snowflake, and runs the Git commands.

### Example prompts

| Step | Prompt |
| --- | --- |
| Project setup | "Create a README describing the end-to-end pipeline, setup, and usage" |
| Ingest | "Create a stage and load the raw CSV files into a staging table in Snowflake" |
| Transform | "Build cleaned, analytics-ready tables from the staging data" |
| Validate | "Add data quality checks for nulls, duplicates, and freshness" |
| Schedule | "Schedule the pipeline to run daily with a Snowflake task" |
| Version control | "Commit the changes and push to the GitHub dev branch" |

### Benefits

- **No manual typing of code**: SQL, Python, and Git commands are generated from prompts.
- **Faster development**: you go from an idea to a working pipeline in minutes.
- **Consistent and reviewable**: every change goes through Git branches (`dev` → `qa` → `prod`).
- **Built-in Snowflake knowledge**: the assistant follows Snowflake best practices.

## Status

**Task completed**: The pipeline README was created and updated with the Snowflake Cortex AI assistant using prompts, and pushed to the GitHub `dev` branch.
