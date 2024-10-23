{{
    config(
        materialized='table',
        schema='TG_CDH'
    )
}}

with Nagaraju as (
    
    select 
    CUSTOMER_ID,
    FIRST_NAME,
    LAST_NAME,
    FIRST_NAME||' '||LAST_NAME as full_Name,
    current_timestamp as current_date,
    substring (CITY,1,5) as CITY,
    AGE
from {{source("sample_SF",'CUSTOMERS')}}
where AGE >= 35)

select * from Nagaraju