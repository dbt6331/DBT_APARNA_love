SELECT MONTH_YEAR,count(*) as count_row 
FROM {{ ref('dbt_model31') }}
group by MONTH_YEAR
