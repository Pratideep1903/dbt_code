select
    order_id,
    sum(amount) as total_amount
from {{ ref('payments_model' )}}
group by 1
having total_amount < 45000