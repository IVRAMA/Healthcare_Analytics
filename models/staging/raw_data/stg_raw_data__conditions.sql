{{ config(materialized='table') }}

with source as (
    select * from {{ source('raw_data', 'conditions') }}
)

select
    {{ auto_cast('conditions') }}
from source
