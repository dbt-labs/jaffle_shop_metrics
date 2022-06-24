 -- depends_on: {{ ref('orders') }}

select * 
from {{ metrics.metric(
    metric_name='revenue',
    grain='week',
    dimensions=['customer_status']
) }}
