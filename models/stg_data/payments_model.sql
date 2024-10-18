{{config(materialized = 'table')}}

with tbl as(
    select
        id,
        order_id,
        payment_method,
        amount
    from {{source('datafeed_shared_schema','payments')}})
    select * from tbl

