{{ config(materialized='table') }}

with source as (
    select * from {{ source('raw_data', 'imaging_studies') }}
)

select
    {{ auto_cast('imaging_studies') }}
from source
