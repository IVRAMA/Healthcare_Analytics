{{ config(materialized='table') }}

with source as (
    select * from {{ source('raw_data', 'observations') }}
)

select
    {{ auto_cast('observations') }}
from source
