select 
src_hz_ca.*,
src_hz_p.*
from {{ ref('src_hz_cust_accounts') }} src_hz_ca
join {{ ref('src_hz_parties') }} src_hz_p
on src_hz_ca.hz_ca_party_id = src_hz_p.hz_p_party_id