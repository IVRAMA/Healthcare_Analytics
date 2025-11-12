{{ config(materialized='table') }}

with source as (
    select * from {{ source('raw_data', 'immunizations') }}
)

select
    {{ auto_cast('immunizations') }}
from source
