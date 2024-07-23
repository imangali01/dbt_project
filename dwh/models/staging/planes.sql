{{
    config(
        materialized='view',
        schema='dds'
    )
}}

select
    *
from {{ ref('seed_plane') }}
where "Name" like '{{ var('plane_name') }}%'
