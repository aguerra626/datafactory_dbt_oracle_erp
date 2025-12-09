select *
from {{ source('bae', 'bae_context303_serial_numbers') }}