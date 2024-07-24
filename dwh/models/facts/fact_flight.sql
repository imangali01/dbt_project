{{ 
    config(
        sort='flightid',
        materialized='incremental',
        pre_hook=prepare_fact_flight_model(),
        incremental_strategy='append',
        schema='dds'
    )
}}

select
    f.flightid,
    f.airlineid,
    a.name as airline_name,
    f.sourceairportid,
    sa.name as source_airport_name,
    f.destinationairportid,
    da.name as destination_airport_name,
    f.departure,
    f.arrival,
    f.equipment
from public.flight f
join {{ ref('dim_airline') }} a on f.airlineid = a.airlineid
join {{ ref('dim_airport') }} sa on f.sourceairportid = sa.airportid
join {{ ref('dim_airport') }} da on f.destinationairportid = da.airportid
