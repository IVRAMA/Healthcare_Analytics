{{ config(materialized='table') }}

with source as (
    select * from {{ source('raw_data', 'organizations') }}
)

select
    {{ auto_cast('organizations') }}
from source
