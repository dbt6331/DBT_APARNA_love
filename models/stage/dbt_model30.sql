{{ config(
    materialized='incremental',
    incremental_strategy='merge',
    unique_key='NEW_DATE'
) }}

SELECT
    NEW_DATE,
    OPEN,
    HIGH,
    LOW,
    CLOSE,
    SHARE_TRADED,
    TOTAL
FROM {{ source('stage', 'NEW_CHEMICAL') }}

{% if is_incremental() %}
WHERE NEW_DATE > (
    SELECT COALESCE(MAX(NEW_DATE), '1900-01-01')
    FROM {{ this }}
)
{% endif %}
