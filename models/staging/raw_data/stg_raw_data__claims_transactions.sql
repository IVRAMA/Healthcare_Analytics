{{ config(materialized='table') }}

with source as (
    select * from {{ source('raw_data', 'claims_transactions') }}
)

select
    {{ auto_cast('claims_transactions') }}
from source
