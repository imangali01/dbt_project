{{
    config(
        materialized='view',
        schema='dds'
    )
}}

select
    case when airline = '\N' then null else airline end::bpchar(3) as airline,
    case when airlineid = '\N' then null else airlineid end::int4 as airlineid,
    case when sourceairport = '\N' then null else sourceairport end::bpchar(4) as sourceairport,
    case when sourceairportid = '\N' then null else sourceairportid end::int4 as sourceairportid,
    case when destinationairport = '\N' then null else destinationairport end::bpchar(4) as destinationairport,
    case when destinationairportid = '\N' then null else destinationairportid end::int4 as destinationairportid,
    case when codeshare = '\N' then null else codeshare end::bpchar(1) as codeshare,
    stops,
    case when equipment = '\N' then null else equipment end::varchar(255) as equipment
from {{ ref('route') }}
