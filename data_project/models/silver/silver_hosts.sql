{{ config(
    materialized = 'incremental',
    unique_key = 'HOST_ID'
) }}

select 
    HOST_ID,
    REPLACE(HOST_NAME,' ','_') as HOST_NAME,
    HOST_SINCE,
    IS_SUPERHOST,
    RESPONSE_RATE,
    CASE 
    WHEN RESPONSE_RATE > 90 THEN 'HIGH'
    WHEN RESPONSE_RATE > 70 THEN 'MEDIUM'
    ELSE 'LOW'
    END AS RESPONSE_RATE_TAG,
    CREATED_AT
from {{ref('bronze_hosts')}}