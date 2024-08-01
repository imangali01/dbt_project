{% macro call_data_generation_function() %}

    {% if execute %}

        {% set num_samples = 100 %}

        {% do log("[+] starting macro call_data_generation_function(" ~ num_samples | string ~ ")", info=True) %}

        -- checking source table for exists 
        {% set query %}
            SELECT count(*)
            FROM information_schema.tables 
            WHERE table_schema = 'public' 
              AND table_name   = 'flight';
        {% endset %}

        {% set results = run_query(query) %}

        {% if results[0][0] == 0 %}
            {% do log("[-] no model dds.stg_route", info=True) %}
        {% else %}
            -- calling generation function
            {% set results = run_query('SELECT count(*) FROM public.flight') %}

            {% if results[0][0] == 0 %}
                {% set query = "SELECT generate_sample_flights(" ~ num_samples | string ~ ");" %}
                {% print(query) %}
                {{ run_query(query) }}
                {% do log("[+] call function generate_sample_flights", info=True) %}
            {% else %}
                {% do log("[+] data already exists in flights table", info=True) %}
            {% endif %}
        {% endif %}
    
    {% endif %}

{% endmacro %}
