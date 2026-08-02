select *,
CASE WHEN count_row > 10 THEN 'Large' ELSE 'Small' END AS size_flag
from {{ ref('dbt_model32') }}