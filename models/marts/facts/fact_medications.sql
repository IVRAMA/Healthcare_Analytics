{{ config(materialized='table') }}

select
    "START" as medication_start_dt
    , "STOP" as medication_stop_dt
    , "PATIENT" as patient_id
    , "PAYER" as payer_id
    , "ENCOUNTER" as encounter_id
    , "BASE_COST" as medication_base_cost
    , "PAYER_COVERAGE" as payer_coverage
    , "DISPENSES" as DISPENSES
    , "TOTALCOST" as TOTALCOST
from {{ ref('stg_raw_data__medications') }}


