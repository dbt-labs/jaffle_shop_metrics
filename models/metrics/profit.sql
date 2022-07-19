select * 
from {{ metrics.calculate(
    metric('profit'),
    grain='week',
    dimensions=['customer_status']
) }}
