-- =====================================================================
-- V2.0.0 : Environment sales database ({{ database_name }})
-- DEV / QA -> TRANSIENT (no fail-safe cost); PROD -> permanent.
-- Driven by the `environment` var in schemachange-config-<env>.yml.
-- =====================================================================

CREATE {% if environment != 'PROD' %}TRANSIENT {% endif %}DATABASE IF NOT EXISTS {{ database_name }}
    COMMENT = 'Apple sales analytics - {{ environment }} environment';
