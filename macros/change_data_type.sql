{% macro change_column_type(column_name, data_type) %}

cast({{column_name}} as {{data_type}})

{% endmacro %}