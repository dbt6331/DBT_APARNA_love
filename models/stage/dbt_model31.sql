select *, to_char(NEW_DATE,'YYYY-MM') as month_year 
FROM {{ source('stage', 'NEW_CHEMICAL') }}