{{ config(materialized ='view') }} 

with tbl as(
    select
        ID as order_id,
        USER_ID,
        ORDER_DATE,
        STATUS
    from {{source('datafeed_shared_schema','orders')}})
    select * from tbl