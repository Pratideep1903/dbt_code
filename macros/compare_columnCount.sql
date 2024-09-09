{% macro compare_count(column_a,column_b,column_c) -%}
    select
        '{{column_a}}' as a,
        count(*) as total_records
    from {{column_a}}

    union all

    select
        '{{column_b}}' as b,
        count(*) as total_records
    from {{column_b}}

    union all

      select
        '{{column_c}}' as c,
        count(*) as total_records
    from {{column_c}}

{%- endmacro %}