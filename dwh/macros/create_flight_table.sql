{% macro create_flight_table() %}

    {% if execute %}

        {% do log("[+] starting macro create_flight_table()", info=True) %}

        {% set query %}
            CREATE TABLE IF NOT EXISTS public.flight (
                flightid serial4 PRIMARY KEY,
                airlineid int4 NOT NULL,
                sourceairportid int4 NOT NULL,
                destinationairportid int4 NOT NULL,
                departure timestamp NOT NULL,
                arrival timestamp NOT NULL,
                equipment varchar(255) NULL
            );
        {% endset %}

        {{ run_query(query) }}

        {% do log("[+] created table public.flight", info=True) %}

    {% endif %}
    
{% endmacro %}
