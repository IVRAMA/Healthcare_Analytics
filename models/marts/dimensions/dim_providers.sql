{{ config(materialized='table') }}

select
    provider.id as provider_id,
    provider.name as provider_name,
    provider.organization as organization_id
from {{ ref('stg_raw_data__providers') }} as provider
