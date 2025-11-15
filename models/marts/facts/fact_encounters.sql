{{ config(materialized='table') }}

select
"ID" AS encounter_id
, "START"
, "STOP"
, "PATIENT" as patient_id
, "ORGANIZATION" 
, "PROVIDER" as PROVIDER_id
, "PAYER" as PAYER_ID
, "ENCOUNTERCLASS"
, "CODE"
, "DESCRIPTION"
, "BASE_ENCOUNTER_COST"
, "TOTAL_CLAIM_COST"
, "PAYER_COVERAGE"
, "REASONCODE"
, "REASONDESCRIPTION"
from {{ ref('stg_raw_data__encounters') }}
