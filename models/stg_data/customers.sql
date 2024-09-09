{{ config(materialized ='table') }} 

with tbl1 as(
    select
        id,
        first_name,
        last_name
    from {{source('datafeed_shared_schema','customer_data')}})
    select * from tbl1

