{{ config(materialized='table') }}

with source as (
    select * from {{ source('raw_data', 'devices') }}
)

select
    {{ auto_cast('devices') }}
from source
