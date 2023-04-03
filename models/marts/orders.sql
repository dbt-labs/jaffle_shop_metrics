{{
    config(
        materialized = 'view',
        tags=['retail']
    )
}}
with
    orders as (select * from {{ ref("order_payments_fact") }}),
    customers as (select * from {{ ref("customer_orders_fact") }}),
    final as (select * from orders left join customers using (customer_id))

select *
from final
