{{ config(materialized='table') }}

with source as (
    select * from {{ source('raw_data', 'allergies') }}
)

select
    {{ auto_cast('allergies') }}
from source
