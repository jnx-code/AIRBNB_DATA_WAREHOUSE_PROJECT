{{config(materialized='table')}}

select 
    -- Keys
    BOOKING_ID,
    LISTING_ID,
    HOST_ID,

    -- Numerical Measures
    TOTAL_AMOUNT,
    SERVICE_FEE,
    CLEANING_FEE,
    ACCOMMODATES as LISTING_ACCOMMODATES,
    BEDROOMS as LISTING_BEDROOMS,
    BATHROOMS as LISTING_BATHROOMS,
    PRICE_PER_NIGHT as LISTING_PRICE_PER_NIGHT,
    RESPONSE_RATE
from {{ ref('obt') }}