{{ config(materialized='table') }}

select distinct
    med.code as medication_code,
    med.description,
    med.REASONCODE,
    med.REASONDESCRIPTION
from {{ ref('stg_raw_data__medications') }} as med