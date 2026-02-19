{% snapshot dim_hosts %}

{{
    config(
      target_schema='gold',
      unique_key='HOST_ID',
      strategy='timestamp',
      updated_at='HOST_CREATED_AT',
      dbt_valid_to="to_date('9999-12-31')"
    )
}}

select * from {{ ref('hosts') }}

{% endsnapshot %}
