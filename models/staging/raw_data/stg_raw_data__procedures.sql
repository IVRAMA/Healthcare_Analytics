{{ config(materialized='table') }}

with source as (
    select * from {{ source('raw_data', 'procedures') }}
)

select
    {{ auto_cast('procedures') }}
from source
