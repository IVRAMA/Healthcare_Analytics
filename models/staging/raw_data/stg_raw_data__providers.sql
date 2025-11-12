{{ config(materialized='table') }}

with source as (
    select * from {{ source('raw_data', 'providers') }}
)

select
    {{ auto_cast('providers') }}
from source
