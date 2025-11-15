{{ config(materialized='table') }}

select
    id as organization_id,
    name as organization_name,
    address,
    city,
    state,
    zip
from {{ ref('stg_raw_data__organizations') }}
