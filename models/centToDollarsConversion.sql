{{ config(materialized = 'table')}}

with
emp_data_updated as(
    select
    tax_amount,
    ({{cents_to_dollars('salary')}}) as salary_converted
    from {{source('datafeed_shared_schema','emp')}}
)
select * from emp_data_updated




