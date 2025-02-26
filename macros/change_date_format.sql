{% macro change_date_format(date_column, date_format)%}

to_char({{date_column}}, '{{date_format}}')

{% endmacro %}