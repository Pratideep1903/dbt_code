{{ config(materialized = 'table')}}

with
emp_data as(
    select
    id,
    name,
    salary,
    tax_amount,
    ({{calculation('salary','tax_amount')}}) as total_amt
    from {{source('datafeed_shared_schema','emp')}}
)
select * from emp_data



