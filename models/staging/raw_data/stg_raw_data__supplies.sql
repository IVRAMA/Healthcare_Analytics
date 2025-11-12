{{ config(materialized='table') }}

with source as (
    select * from {{ source('raw_data', 'supplies') }}
)

select
    {{ auto_cast('supplies') }}
from source
