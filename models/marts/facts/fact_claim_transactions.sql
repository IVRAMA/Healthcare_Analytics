{{ config(materialized='table') }}

select
"ID" as claim_transaction_id
, "CLAIMID"
, "CHARGEID"
, "PATIENTID"
, "TYPE" as claim_type
, "AMOUNT" as claim_amount
, "METHOD" as claim_method
, "FROMDATE"  as claim_fromdate
, "TODATE" as claim_todate
, "PLACEOFSERVICE"
, "PROCEDURECODE"
, "MODIFIER1"
, "MODIFIER2"
, "DIAGNOSISREF1"
, "DIAGNOSISREF2"
, "DIAGNOSISREF3"
, "DIAGNOSISREF4"
, "UNITS"
, "DEPARTMENTID"
, "NOTES"
, "UNITAMOUNT"
, "TRANSFEROUTID"
, "TRANSFERTYPE"
, "PAYMENTS"
, "ADJUSTMENTS"
, "TRANSFERS"
, "OUTSTANDING"
, "APPOINTMENTID"
, "LINENOTE"
, "PATIENTINSURANCEID"
, "FEESCHEDULEID"
, "PROVIDERID"
, "SUPERVISINGPROVIDERID"
from {{ ref('stg_raw_data__claims_transactions') }}
