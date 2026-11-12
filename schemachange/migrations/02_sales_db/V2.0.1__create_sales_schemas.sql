-- =====================================================================
-- V2.0.1 : Medallion schemas in {{ database_name }}
-- Schemas inherit TRANSIENT from the database in DEV / QA.
-- =====================================================================

-- Bronze: raw CSV data landed via COPY INTO
CREATE SCHEMA IF NOT EXISTS {{ database_name }}.bronze
    COMMENT = 'Raw CSV data landing zone';

-- Silver: cleaned and curated data (dynamic tables)
CREATE SCHEMA IF NOT EXISTS {{ database_name }}.silver
    COMMENT = 'Cleaned and curated data';

-- Gold: facts, dimensions, aggregates and semantic view
CREATE SCHEMA IF NOT EXISTS {{ database_name }}.gold
    COMMENT = 'Facts, dimensions, aggregates and semantic view';

-- Common: shared file formats, sequences, UDFs, procedures
CREATE SCHEMA IF NOT EXISTS {{ database_name }}.common
    COMMENT = 'Shared file formats, sequences, UDFs and procedures';
