{{ config(materialized='table') }}

with source as (
    select * from {{ source('raw_data', 'careplans') }}
)

select
    {{ auto_cast('careplans') }}
from source
