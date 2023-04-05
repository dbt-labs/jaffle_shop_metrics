{{
    config(
        materialized = 'view',
        tags=['revenue']
    )
}}
select *
from {{ 
    metrics.calculate(
        metric('revenue'),
        grain='day',
        dimensions=['customer_status']
    )
}}