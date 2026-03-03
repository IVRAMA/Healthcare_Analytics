{{ config(materialized='table') }}

select distinct
    "START" as  device_Start
    , "STOP"  as  device_stop
    , "PATIENT" as  patient_id
    , "ENCOUNTER" as encounter_id
    , "CODE" as  device_code
    , "DESCRIPTION" as  device_description
    , "UDI" as  device_udi
from {{ ref('stg_raw_data__devices') }} as dev
