{{ config(materialized='table') }}

select
    "START" as condition_start
    , "STOP" as condition_stop
    , "PATIENT" as patient_id
    , ENCOUNTER as encounter_id
    , CODE as condition_code
    , "DESCRIPTION" as condition_Description
from {{ ref('stg_raw_data__conditions') }} as cond
