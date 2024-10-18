{% snapshot snap_customers_check %}

{{
    config(
        strategy = 'check',
        unique_key = 'id',
        check_cols=['STATUS']
    )
}}

select * from {{source('datafeed_shared_schema','orders')}}

{% endsnapshot %}