select * 
from {{ metrics.calculate(
    metric('revenue'),
    grain='week',
    dimensions=['customer_status']
) }}
