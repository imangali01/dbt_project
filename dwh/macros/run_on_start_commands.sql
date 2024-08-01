{% macro run_on_start_commands() %}

    {% if execute %}

        {% do log("[=] starting macro run_on_start_commands()", info=True) %}

        {% do log("[-] do something...", info=True) %}

        {% do log("[=] compleated macro run_on_start_commands()", info=True) %}

    {% endif %}

{% endmacro %}
