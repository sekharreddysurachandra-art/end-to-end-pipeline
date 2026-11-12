-- =====================================================================
-- V1.0.1 : Governance schemas
--   TAGS     -> chargeback / classification tags
--   POLICIES -> masking & row access policies (added after profiling)
-- =====================================================================

CREATE SCHEMA IF NOT EXISTS governance.tags
    COMMENT = 'Tags for chargeback, environment, layer, domain and sensitivity';

CREATE SCHEMA IF NOT EXISTS governance.policies
    COMMENT = 'Masking and row access policies (created after profiling)';
