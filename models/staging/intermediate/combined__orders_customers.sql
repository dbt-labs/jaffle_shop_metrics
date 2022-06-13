with orders as (

    select * from {{ ref('orders') }}

)
,
customers as (

    select * from {{ ref('customers') }}

)
,
final as (

    select 
        *
    from orders 
    left join customers using (customer_id)

)

select * from final