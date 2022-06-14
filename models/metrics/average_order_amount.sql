 -- depends_on: {{ ref('combined__orders_customers') }}

select * 
from {{ metrics.metric(
    metric_name='average_order_amount',
    grain='week',
    dimensions=[],
) }}
