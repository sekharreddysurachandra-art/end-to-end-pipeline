-- =====================================================================
-- V1.1.0 : Governance tags (GOVERNANCE.TAGS)
-- ALLOWED_VALUES restricts tag values to the approved list.
-- =====================================================================

-- Chargeback: cost center owning the spend
CREATE TAG IF NOT EXISTS governance.tags.cost_center
    ALLOWED_VALUES 'SALES_ANALYTICS'
    COMMENT = 'Chargeback cost center';

-- Chargeback: deployment environment
CREATE TAG IF NOT EXISTS governance.tags.environment
    ALLOWED_VALUES 'DEV', 'QA', 'PROD'
    COMMENT = 'Deployment environment';

-- Medallion layer of a schema / table
CREATE TAG IF NOT EXISTS governance.tags.data_layer
    ALLOWED_VALUES 'BRONZE', 'SILVER', 'GOLD', 'COMMON'
    COMMENT = 'Medallion data layer';

-- Business domain of a table (applied when tables are created)
CREATE TAG IF NOT EXISTS governance.tags.data_domain
    ALLOWED_VALUES 'SALES', 'CUSTOMER', 'PRODUCT', 'STORE', 'REFERENCE'
    COMMENT = 'Business data domain';

-- Column sensitivity; drives tag-based masking later
CREATE TAG IF NOT EXISTS governance.tags.data_sensitivity
    ALLOWED_VALUES 'PUBLIC', 'INTERNAL', 'CONFIDENTIAL', 'PII'
    COMMENT = 'Data sensitivity classification';
