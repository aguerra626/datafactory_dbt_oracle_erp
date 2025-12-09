with base as(
    select * from {{ ref('src_fnd_user') }}
)
select
fu_user_id,
fu_user_name "Username",
fu_description "Name",
fu_email_address,
fu_creation_date,
fu_start_date,
fu_end_date
from base
where fu_end_date is null