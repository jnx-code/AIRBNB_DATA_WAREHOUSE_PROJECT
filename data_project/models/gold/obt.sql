{%
    set configs = [
        {
            "table": ref('silver_bookings'),
            "columns": "silver_bookings.BOOKING_ID, silver_bookings.LISTING_ID, silver_bookings.BOOKING_DATE, silver_bookings.TOTAL_AMOUNT, silver_bookings.SERVICE_FEE, silver_bookings.CLEANING_FEE, silver_bookings.BOOKING_STATUS, silver_bookings.CREATED_AT",
            "alias": "silver_bookings"
        },
        {
            "table": ref('silver_listings'),
            "columns": "silver_listings.HOST_ID, silver_listings.PROPERTY_TYPE, silver_listings.ROOM_TYPE, silver_listings.CITY, silver_listings.COUNTRY, silver_listings.ACCOMMODATES, silver_listings.BEDROOMS, silver_listings.BATHROOMS, silver_listings.PRICE_PER_NIGHT,silver_listings.PRICE_PER_NIGHT_TAG, silver_listings.CREATED_AT as LISTING_CREATED_AT",
            "alias": "silver_listings",
            "join_condition": "silver_bookings.LISTING_ID = silver_listings.LISTING_ID"
        },
        {
            "table": ref('silver_hosts'),
            "columns": "silver_hosts.HOST_NAME, silver_hosts.HOST_SINCE, silver_hosts.IS_SUPERHOST, silver_hosts.RESPONSE_RATE,silver_hosts.RESPONSE_RATE_TAG,silver_hosts.CREATED_AT as HOST_CREATED_AT",
            "alias": "silver_hosts",
            "join_condition": "silver_listings.HOST_ID = silver_hosts.HOST_ID"
        }
    ]
%}
select 
    {% for config in configs %}
    {{config['columns']}}{% if not loop.last %},{% endif %}
    {% endfor %}
    
    from 
    {% for config in configs %}
    {% if loop.first%}
     {{config['table']}} as {{config['alias']}}
    {% else %}
     left join {{config['table']}} as {{config['alias']}} on {{config['join_condition']}}
    {% endif %}
    {% endfor %}