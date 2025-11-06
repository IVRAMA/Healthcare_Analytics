create or replace schema EXTERNAL_STAGES;

CREATE OR REPLACE stage healthcare_raw.external_stages.stage_allergies  FILE_FORMAT = (TYPE = 'CSV' FIELD_OPTIONALLY_ENCLOSED_BY = '"' SKIP_HEADER = 1);
CREATE OR REPLACE stage healthcare_raw.external_stages.stage_careplans  FILE_FORMAT = (TYPE = 'CSV' FIELD_OPTIONALLY_ENCLOSED_BY = '"' SKIP_HEADER = 1);
CREATE OR REPLACE stage healthcare_raw.external_stages.stage_claims  FILE_FORMAT = (TYPE = 'CSV' FIELD_OPTIONALLY_ENCLOSED_BY = '"' SKIP_HEADER = 1);
CREATE OR REPLACE stage healthcare_raw.external_stages.stage_claims_transactions  FILE_FORMAT = (TYPE = 'CSV' FIELD_OPTIONALLY_ENCLOSED_BY = '"' SKIP_HEADER = 1);
CREATE OR REPLACE stage healthcare_raw.external_stages.stage_conditions  FILE_FORMAT = (TYPE = 'CSV' FIELD_OPTIONALLY_ENCLOSED_BY = '"' SKIP_HEADER = 1);
CREATE OR REPLACE stage healthcare_raw.external_stages.stage_devices  FILE_FORMAT = (TYPE = 'CSV' FIELD_OPTIONALLY_ENCLOSED_BY = '"' SKIP_HEADER = 1);
CREATE OR REPLACE stage healthcare_raw.external_stages.stage_encounters  FILE_FORMAT = (TYPE = 'CSV' FIELD_OPTIONALLY_ENCLOSED_BY = '"' SKIP_HEADER = 1);
CREATE OR REPLACE stage healthcare_raw.external_stages.stage_imaging_studies  FILE_FORMAT = (TYPE = 'CSV' FIELD_OPTIONALLY_ENCLOSED_BY = '"' SKIP_HEADER = 1);
CREATE OR REPLACE stage healthcare_raw.external_stages.stage_immunizations  FILE_FORMAT = (TYPE = 'CSV' FIELD_OPTIONALLY_ENCLOSED_BY = '"' SKIP_HEADER = 1);
CREATE OR REPLACE stage healthcare_raw.external_stages.stage_medications  FILE_FORMAT = (TYPE = 'CSV' FIELD_OPTIONALLY_ENCLOSED_BY = '"' SKIP_HEADER = 1);
CREATE OR REPLACE stage healthcare_raw.external_stages.stage_observations  FILE_FORMAT = (TYPE = 'CSV' FIELD_OPTIONALLY_ENCLOSED_BY = '"' SKIP_HEADER = 1);
CREATE OR REPLACE stage healthcare_raw.external_stages.stage_organizations  FILE_FORMAT = (TYPE = 'CSV' FIELD_OPTIONALLY_ENCLOSED_BY = '"' SKIP_HEADER = 1);
CREATE OR REPLACE stage healthcare_raw.external_stages.stage_patients  FILE_FORMAT = (TYPE = 'CSV' FIELD_OPTIONALLY_ENCLOSED_BY = '"' SKIP_HEADER = 1);
CREATE OR REPLACE stage healthcare_raw.external_stages.stage_payer_transitions  FILE_FORMAT = (TYPE = 'CSV' FIELD_OPTIONALLY_ENCLOSED_BY = '"' SKIP_HEADER = 1);
CREATE OR REPLACE stage healthcare_raw.external_stages.stage_payers  FILE_FORMAT = (TYPE = 'CSV' FIELD_OPTIONALLY_ENCLOSED_BY = '"' SKIP_HEADER = 1);
CREATE OR REPLACE stage healthcare_raw.external_stages.stage_procedures  FILE_FORMAT = (TYPE = 'CSV' FIELD_OPTIONALLY_ENCLOSED_BY = '"' SKIP_HEADER = 1);
CREATE OR REPLACE stage healthcare_raw.external_stages.stage_providers  FILE_FORMAT = (TYPE = 'CSV' FIELD_OPTIONALLY_ENCLOSED_BY = '"' SKIP_HEADER = 1);
CREATE OR REPLACE stage healthcare_raw.external_stages.stage_supplies  FILE_FORMAT = (TYPE = 'CSV' FIELD_OPTIONALLY_ENCLOSED_BY = '"' SKIP_HEADER = 1);


