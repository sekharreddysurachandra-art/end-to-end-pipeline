# Summary 01 – Governance and Sales Database Setup

## Goal
Build an Apple sales analytics platform in Snowflake using a medallion architecture
(bronze / silver / gold) across dev, qa and prod. All DDL is captured as
schemachange migrations and promoted dev -> qa -> prod through GitHub PRs.

## Architecture rules
- `GOVERNANCE` database holds tags and policies.
- `SALES_DEV`, `SALES_QA` and `SALES_PROD`, each with schemas `BRONZE`, `SILVER`, `GOLD` and `COMMON`.
- Dev and QA objects are transient; prod objects are permanent.
- File formats, sequences, UDFs and stored procedures go in `COMMON`.
- Every object gets a comment and uses `CREATE ... IF NOT EXISTS`.
- Data-storing objects (tables, stages) get a chargeback tag.

## Created in Snowflake (role SYSADMIN)
- `GOVERNANCE` (permanent), with schemas `TAGS` and `POLICIES`.
- `SALES_DEV` (transient), with schemas `BRONZE`, `SILVER`, `GOLD` and `COMMON`.

### Tags in `GOVERNANCE.TAGS`
| Tag | Allowed values |
| --- | --- |
| ENVIRONMENT | DEV, QA, PROD |
| COST_CENTER | SALES_ANALYTICS |
| DATA_LAYER | BRONZE, SILVER, GOLD, COMMON |
| DATA_DOMAIN | SALES, CUSTOMER, PRODUCT, STORE, REFERENCE |
| DATA_SENSITIVITY | PUBLIC, INTERNAL, CONFIDENTIAL, PII |

### Tag attachments
- COST_CENTER=SALES_ANALYTICS and ENVIRONMENT=DEV on `SALES_DEV` and all 4 schemas.
- DATA_LAYER on each schema.
- DATA_DOMAIN and DATA_SENSITIVITY are reserved for tables and columns.

## schemachange layout
```
schemachange/
├── config/schemachange-config-{dev,qa,prod}.yml
└── migrations/
    ├── 01_governance/
    │   ├── V1.0.0__create_governance_database.sql
    │   ├── V1.0.1__create_governance_schemas.sql
    │   └── V1.1.0__create_governance_tags.sql
    └── 02_sales_db/
        ├── V2.0.0__create_sales_database.sql
        ├── V2.0.1__create_sales_schemas.sql
        └── V2.1.0__tag_sales_database_and_schemas.sql
```
- Jinja variables: `{{ database_name }}`, `{{ environment }}`, `{{ cost_center }}`.
- Change history per environment: `GOVERNANCE.SCHEMACHANGE.CHANGE_HISTORY_<ENV>`.
- Numbering continues per layer: `03_common` = V3.x, `04_bronze` = V4.x, and so on.
- Deploy:
  ```
  schemachange deploy --config-folder schemachange/config --config-file-name schemachange-config-<env>.yml
  ```

## Source data
- Stage `@ANALYSIS_DB.PUBLIC.SALES_STG` holds 269 CSVs with no header row.
- Sources: geography (region, country, currency, tax), product (category, family,
  model, SKU, country availability), store master, customer master (2019–2025 by
  country), sales header and sales item (by year).

## Next steps
1. `COMMON`: CSV file format (no header) and sequences as V3.x migrations.
2. `BRONZE`: stage decision, `INFER_SCHEMA`, tables with metadata columns, `COPY INTO`.
3. `SILVER`, then `GOLD`: facts, dimensions, aggregate fact and semantic view.
4. Masking policies in `GOVERNANCE.POLICIES` after data profiling.
5. Open decisions: drop `PUBLIC` schemas, `__initial_load` CSV history, `.gitignore` coverage.
