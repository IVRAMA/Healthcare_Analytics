{{ config(materialized='table') }}

with source as (
    select * from {{ source('raw_data', 'patients') }}
)

select
    {{ auto_cast('patients') }}
from source
