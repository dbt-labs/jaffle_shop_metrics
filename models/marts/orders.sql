{{
    config(
        materialized = 'view',
        tags=['retail']
    )
}}
with
    orders as (select * from {{ ref("order_payments_ods") }}),
    customers as (select * from {{ ref("customer_orders_ods") }}),
    final as (select * from orders left join customers using (customer_id))

select *
from final
