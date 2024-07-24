{% macro run_on_start_commands() %}

    {% if execute %}

        {% do log("[=] starting macro run_on_start_commands()", info=True) %}

        {{ create_flight_table() }}
        {{ create_data_generation_function() }}
        {{ call_data_generation_function(100) }}

        {% do log("[=] compleated macro run_on_start_commands()", info=True) %}

    {% endif %}

{% endmacro %}
