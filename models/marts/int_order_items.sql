select 
    line_items.order_key,
    line_items.part_key,
    line_items.line_number,
    line_items.extended_price,
    line_items.discount,
    orderss.orderkey,
    orderss.customer_key,
    orderss.order_date,
    {{discounted_amount('line_items.extended_price', 'line_items.discount')}} as item_discount
from 
    {{ref('stg_tpch_orders')}} as orderss 
join 
    {{ref('stg_tpch_line_item')}} as line_items
        on orderss.orderkey = line_items.order_key
order by 
    orderss.order_date