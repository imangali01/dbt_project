{{
    config(
        materialized='table',
        schema='dds'
    )
}}

select
    airportid,
    name,
    city,
    country,
    iata,
    icao,
    latitude,
    longitude,
    altitude,
    timezone,
    dst,
    tzdatabasetimezone,
    type,
    source
from public.airport
