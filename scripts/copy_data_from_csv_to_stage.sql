-- This needs to be done in command prompt

PUT file://C:/dbt_projects/healthcare_db/csvs/allergies.csv  @healthcare_raw.external_stages.stage_allergies AUTO_COMPRESS=TRUE;
PUT file://C:/dbt_projects/healthcare_db/csvs/careplans.csv  @healthcare_raw.external_stages.stage_careplans AUTO_COMPRESS=TRUE;
PUT file://C:/dbt_projects/healthcare_db/csvs/claims.csv  @healthcare_raw.external_stages.stage_claims AUTO_COMPRESS=TRUE;
PUT file://C:/dbt_projects/healthcare_db/csvs/claims_transactions.csv  @healthcare_raw.external_stages.stage_claims_transactions AUTO_COMPRESS=TRUE;
PUT file://C:/dbt_projects/healthcare_db/csvs/conditions.csv  @healthcare_raw.external_stages.stage_conditions AUTO_COMPRESS=TRUE;
PUT file://C:/dbt_projects/healthcare_db/csvs/devices.csv  @healthcare_raw.external_stages.stage_devices AUTO_COMPRESS=TRUE;
PUT file://C:/dbt_projects/healthcare_db/csvs/encounters.csv  @healthcare_raw.external_stages.stage_encounters AUTO_COMPRESS=TRUE;
PUT file://C:/dbt_projects/healthcare_db/csvs/imaging_studies.csv  @healthcare_raw.external_stages.stage_imaging_studies AUTO_COMPRESS=TRUE;
PUT file://C:/dbt_projects/healthcare_db/csvs/immunizations.csv  @healthcare_raw.external_stages.stage_immunizations AUTO_COMPRESS=TRUE;
PUT file://C:/dbt_projects/healthcare_db/csvs/medications.csv  @healthcare_raw.external_stages.stage_medications AUTO_COMPRESS=TRUE;
PUT file://C:/dbt_projects/healthcare_db/csvs/observations.csv  @healthcare_raw.external_stages.stage_observations AUTO_COMPRESS=TRUE;
PUT file://C:/dbt_projects/healthcare_db/csvs/organizations.csv  @healthcare_raw.external_stages.stage_organizations AUTO_COMPRESS=TRUE;
PUT file://C:/dbt_projects/healthcare_db/csvs/patients.csv  @healthcare_raw.external_stages.stage_patients AUTO_COMPRESS=TRUE;
PUT file://C:/dbt_projects/healthcare_db/csvs/payer_transitions.csv  @healthcare_raw.external_stages.stage_payer_transitions AUTO_COMPRESS=TRUE;
PUT file://C:/dbt_projects/healthcare_db/csvs/payers.csv  @healthcare_raw.external_stages.stage_payers AUTO_COMPRESS=TRUE;
PUT file://C:/dbt_projects/healthcare_db/csvs/procedures.csv  @healthcare_raw.external_stages.stage_procedures AUTO_COMPRESS=TRUE;
PUT file://C:/dbt_projects/healthcare_db/csvs/providers.csv  @healthcare_raw.external_stages.stage_providers AUTO_COMPRESS=TRUE;
PUT file://C:/dbt_projects/healthcare_db/csvs/supplies.csv  @healthcare_raw.external_stages.stage_supplies AUTO_COMPRESS=TRUE;
