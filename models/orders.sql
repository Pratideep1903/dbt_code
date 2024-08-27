{{ config(materialized ='view') }} 

with tbl as(
    select
        id as order_id,
        user_Id,
        orderdate,
        status
)
from {{source('datafeed_shared_schema','orders')}}
select * from tbl