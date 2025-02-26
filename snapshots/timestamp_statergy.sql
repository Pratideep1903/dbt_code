{% snapshot audit_details %}

{{config(
    target_schema = 'snapshot',
    strategy = 'timestamp',
    unique_key = 'emp_id',
    updated_at = 'updated_at'
)}}

select emp_id, emp_name, salary, updated_at from {{source('raw_data','employees')}}

{% endsnapshot %}