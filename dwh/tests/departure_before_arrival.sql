with invalid_flights as (
    select
        flightid,
        departure,
        arrival
    from {{ ref('fact_flight') }}
    where departure >= arrival
)

select *
from invalid_flights