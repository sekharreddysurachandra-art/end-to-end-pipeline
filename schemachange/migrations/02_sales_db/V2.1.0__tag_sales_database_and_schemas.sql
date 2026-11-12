-- =====================================================================
-- V2.1.0 : Chargeback & layer tags on {{ database_name }} and its schemas
-- Tags live in GOVERNANCE.TAGS (see V1.1.0).
-- =====================================================================

-- Database: cost center + environment
ALTER DATABASE {{ database_name }} SET TAG
    governance.tags.cost_center = '{{ cost_center }}',
    governance.tags.environment = '{{ environment }}';

-- Schemas: cost center + environment + medallion layer
ALTER SCHEMA {{ database_name }}.bronze SET TAG
    governance.tags.cost_center = '{{ cost_center }}',
    governance.tags.environment = '{{ environment }}',
    governance.tags.data_layer  = 'BRONZE';

ALTER SCHEMA {{ database_name }}.silver SET TAG
    governance.tags.cost_center = '{{ cost_center }}',
    governance.tags.environment = '{{ environment }}',
    governance.tags.data_layer  = 'SILVER';

ALTER SCHEMA {{ database_name }}.gold SET TAG
    governance.tags.cost_center = '{{ cost_center }}',
    governance.tags.environment = '{{ environment }}',
    governance.tags.data_layer  = 'GOLD';

ALTER SCHEMA {{ database_name }}.common SET TAG
    governance.tags.cost_center = '{{ cost_center }}',
    governance.tags.environment = '{{ environment }}',
    governance.tags.data_layer  = 'COMMON';
