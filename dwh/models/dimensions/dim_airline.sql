{{
    config(
        materialized='view',
        schema='dds'
    )
}}

{% set columns = [
    'airlineid',
    'name',
    'alias',
    'iata',
    'icao',
    'callsign',
    'country',
    'active'
] %}

select
    {% for column in columns %}
        {{ column }}{% if not loop.last %},{% endif %}
    {% endfor %}
from public.airline