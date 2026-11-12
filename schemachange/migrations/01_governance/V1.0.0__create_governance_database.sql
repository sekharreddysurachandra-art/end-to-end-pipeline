-- =====================================================================
-- V1.0.0 : Global governance database
-- Shared by DEV / QA / PROD (not environment specific, always permanent).
-- Holds all tags and policies. Idempotent: safe to run per environment.
-- Prerequisite: run once manually before the first schemachange deploy,
-- because the change-history table also lives in GOVERNANCE.
-- =====================================================================

CREATE DATABASE IF NOT EXISTS governance
    COMMENT = 'Global governance objects (tags, policies) for sales analytics';
