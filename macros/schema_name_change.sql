{% macro  change_schema_name(model_name, new_schema_name) %}
{% set target_relation = ref(model_name) %}
{% set sql %}
alter table {{target_relation}} set schema {{new_schema_name}}
{% endset %}
{{ run_query(sql) }}
{%endmacro%}


