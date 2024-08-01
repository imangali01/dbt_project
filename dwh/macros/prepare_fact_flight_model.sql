{% macro prepare_fact_flight_model() %}

    {% if execute %}

        {% do log("[+] starting macro prepare_fact_flight_model()", info=True) %}

        {{ call_data_generation_function() }}

        {% set query %}
            SELECT count(*)
            FROM information_schema.tables 
            WHERE table_schema = 'dds' 
              AND table_name   = 'fact_flight';
        {% endset %}

        {% set results = run_query(query) %}

            {% if results[0][0] == 0 %}
                {% do log("[+] table dds.fact_flight does not exist, skipping truncate", info=True) %}
            {% else %}
                {{ run_query('TRUNCATE TABLE dds.fact_flight') }}
                {% do log("[+] table dds.fact_flight exists, TRUNCATED!", info=True) %}
            {% endif %}

        {% do log("[+] compleated macro prepare_fact_flight_model()", info=True) %}

    {% endif %}

{% endmacro %}
