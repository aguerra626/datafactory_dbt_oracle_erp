-- dimension grain: one row per wip entity id per organization id
-- column ordering: From High Cardinality to Lower Cardinality
-- 1 Surrogate Keys
-- 2 Business/ Natural Keys
-- 3 Major Descriptive Attribute (highest cardinality)
-- 4 Date Attributes (when)
-- 5 Minor Descriptive Attributes (lowest cardinality)
-- supporting lookup attributes
select
-- surrogate key
standard_hash(base.we_wip_entity_id || base.we_organization_id, 'MD5') wip_job_sk,
-- business/natural keys
base.we_wip_entity_id, 
base.we_organization_id,
base.wdj_primary_item_id,
-- main dimensional attributes
base.we_wip_entity_name AS "Job Number",
-- when attributes (dates)
base.wdj_date_released AS "Job Released Date",
base.wdj_scheduled_start_date AS "Job Scheduled Start Date",
base.wdj_scheduled_completion_date AS "Job Scheduled Completion Date",
-- minor descriptive attributes
base.wdj_class_code AS "Job Class Code",
base.meaning_we_entity_type,
base.meaning_wdj_job_type AS "Job Type",
base.meaning_wdj_status_type AS "WIP Status",
base.meaning_wdj_wip_supply_type
from {{ ref('stg_we_wdj') }} base