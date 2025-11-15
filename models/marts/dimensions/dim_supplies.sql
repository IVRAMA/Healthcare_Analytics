{{ config(materialized='table') }}

select distinct
    sup.code as supply_code,
    sup.description
from {{ ref('stg_raw_data__supplies') }} as sup
