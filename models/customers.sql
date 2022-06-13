with customers as (

    select * from {{ ref('stg_customers') }}

),

orders as (

    select * from {{ ref('stg_orders') }}

),

payments as (

    select * from {{ ref('stg_payments') }}

),

customer_orders as (

        select
        customer_id,

        min(order_date) as first_order,
        max(order_date) as most_recent_order,
        count(order_id) as number_of_orders
    from orders

    group by customer_id

),


final as (

    select
        customers.customer_id,
        customers.first_name,
        customers.last_name,
        customer_orders.first_order,
        customer_orders.most_recent_order,
        case 
            when most_recent_order <= '2018-01-15' then 'Churned'
            when most_recent_order <= '2018-03-01' then 'Churn Risk'
            else 'Healthy'
        end as customer_status,
        customer_orders.number_of_orders
    from customers

    left join customer_orders
        on customers.customer_id = customer_orders.customer_id


)

select * from final
