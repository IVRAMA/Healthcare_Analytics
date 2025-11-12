{{ config(materialized='table') }}

with source as (
    select * from {{ source('raw_data', 'payer_transitions') }}
)

select
    {{ auto_cast('payer_transitions') }}
from source
