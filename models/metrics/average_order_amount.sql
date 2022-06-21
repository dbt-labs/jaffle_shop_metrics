 -- depends_on: {{ ref('orders') }}

select * 
from {{ metrics.metric(
    metric_name='average_order_amount',
    grain='week',
    dimensions=[],
) }}
