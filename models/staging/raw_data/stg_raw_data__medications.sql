{{ config(materialized='table') }}

with source as (
    select * from {{ source('raw_data', 'medications') }}
)

select
    {{ auto_cast('medications') }}
from source
