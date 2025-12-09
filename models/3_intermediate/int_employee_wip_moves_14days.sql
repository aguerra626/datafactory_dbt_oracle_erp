select
int_base.*,
FROM_TZ(CAST(int_base.wmt_transaction_date AS TIMESTAMP),'America/New_York') 
        AT TIME ZONE 'America/Chicago' 
            AS transacted_at_cst,
src_fu.*
from {{ ref('stg_we_wdj_wmt14days_fm_to_wop_fm_to_bd_msib_mp') }} int_base
join {{ source('applsys', 'fnd_user') }} src_fu
on int_base.wmt_created_by = src_fu.user_id