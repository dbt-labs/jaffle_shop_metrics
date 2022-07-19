select * 
from {{ metrics.calculate(
    metric('expenses'),
    grain='week',
    dimensions=[],
) }}
