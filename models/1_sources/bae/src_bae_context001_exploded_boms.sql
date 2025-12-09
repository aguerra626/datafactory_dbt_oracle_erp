select *
from {{ source('bae', 'bae_context001_exploded_boms') }}