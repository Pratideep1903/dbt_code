{{ config(materialized ='table') }} 

with customers as(
    select
        id as customer_id,
        first_name,
        last_name
    from {{ref("customers")}}),

orders as(
    select
        id as order_id,
        user_id,
        order_date,
        status
    from {{ref("orders")}}),

customer_order as(
    select
        user_Id,
        min(order_date) as first_order_date,
        max(order_date) as recent_order_date,
        count(order_id) as orderIdcount
    from orders
),

final as(
    select
        customers.customer_id,
        customer_order.first_order_date,
        orders.first_name
        coalesce(customer_order.orderIdcount,0) as number_of_orders
    from customers
    left join customer_order using (customer_id)
)
select * from final