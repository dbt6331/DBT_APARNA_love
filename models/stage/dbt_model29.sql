{{ config(
    materialized='incremental',
    incremental_strategy='merge',
    unique_key='"DATE"'
) }}


    SELECT DATE,
OPEN,
HIGH,
LOW,
CLOSE,
SHARES_TRADED,
"Turnover (₹ Cr)" from 
    HDFC_DB.HDFC_SCH.CHEMCALSAMPLE
    
    {% if is_incremental() %}
        
        WHERE "DATE" > (
            SELECT COALESCE(MAX("DATE"), '1900-01-01') 
            FROM {{ this }}
        )
    {% endif %}

