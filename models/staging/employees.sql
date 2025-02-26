{{ config(materialized="incremental", unique_id="emp_id") }}

with
    emp as (
        select
            emp_id,
            emp_name,
            salary,
            hire_date,
            department_id,
            manager_id,
            updated_at,
            max(updated_at) as max_updated_at
        from {{ source("raw_data", "employees") }}
    )
select e.emp_id, max(e.updated_at) as latest_update
from emp e
group by e.emp_id,
having latest_update > (select max(updated_at) from {{ this }})
