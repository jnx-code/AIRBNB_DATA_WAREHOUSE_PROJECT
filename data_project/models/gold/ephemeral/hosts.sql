{{config(materialized='ephemeral')}}

with hosts as 
(
    select 
        HOST_ID,
        HOST_NAME,
        HOST_SINCE,
        IS_SUPERHOST, 
        RESPONSE_RATE_TAG,
        CREATED_AT as HOST_CREATED_AT   
    from {{ ref('obt') }}
)

select * from hosts