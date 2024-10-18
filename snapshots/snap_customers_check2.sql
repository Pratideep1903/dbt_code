{% snapshot snap_customers_check2 %}

{{
    config(
        strategy = 'check',
        unique_key = 'id',
        check_cols=['USER_ID'],
        invalidate_hard_delete = True
    )
}}

select * from {{source('datafeed_shared_schema','orders')}}

{% endsnapshot %}