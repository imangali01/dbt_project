with invalid_flightids as (
    select
        f.flightid
    from {{ ref('fact_flight') }} f
    left join public.flight pf on f.flightid = pf.flightid
    where pf.flightid is null
)

select *
from invalid_flightids