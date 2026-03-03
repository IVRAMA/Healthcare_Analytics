{{ config(materialized='table') }}

select
     e.ENCOUNTER_ID,
    e.PATIENT_ID,
    e.PROVIDER_ID,
    e."START"::date as encounter_start,
    e."STOP"::date as encounter_stop,
    dt.month_name,
    dt.week_of_year,
    dt.quarter, 
    observation_value,
    medication_code,
    medication_description,
    immunization_code,
    procedure_code
from {{ ref('fact_encounters') }} e
left join {{ ref('dim_dates') }} dt
    on e."START"::date = dt.date_day
left join {{ ref('fact_observations') }} o
    on e.encounter_id = o.ENCOUTER_ID
left join {{ ref('fact_medications') }} m
    on e.encounter_id = m.ENCOUNTER_ID
left join {{ ref('fact_immunizations') }} i
    on e.encounter_id = i.ENCOUNTER_ID
left join {{ ref('fact_procedures') }} pr
     on e.encounter_id = pr.ENCOUNTER_ID
