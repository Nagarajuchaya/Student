{{
    config(
        materialized='table',
        schema='TG_CDH'
    )
}}

with salary as (
    
    select 
    CUSTOMER_ID,
    full_Name,
    AGE,
    AGE||''||100::int as salary,
    CITY,
    current_date as Current_date
from {{ref("Stg_Customer")}})

select * from salary