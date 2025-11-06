-- =====================================
-- COPY DATA FROM STAGES TO RAW TABLES
-- =====================================

COPY INTO healthcare_raw.raw_data.allergies FROM @healthcare_raw.external_stages.stage_allergies ON_ERROR = 'CONTINUE';

COPY INTO healthcare_raw.raw_data.careplans FROM @healthcare_raw.external_stages.stage_careplans ON_ERROR = 'CONTINUE';

COPY INTO healthcare_raw.raw_data.claims FROM @healthcare_raw.external_stages.stage_claims ON_ERROR = 'CONTINUE';

COPY INTO healthcare_raw.raw_data.claims_transactions FROM @healthcare_raw.external_stages.stage_claims_transactions ON_ERROR = 'CONTINUE';

COPY INTO healthcare_raw.raw_data.conditions FROM @healthcare_raw.external_stages.stage_conditions ON_ERROR = 'CONTINUE';

COPY INTO healthcare_raw.raw_data.devices FROM @healthcare_raw.external_stages.stage_devices ON_ERROR = 'CONTINUE';

COPY INTO healthcare_raw.raw_data.encounters FROM @healthcare_raw.external_stages.stage_encounters ON_ERROR = 'CONTINUE';

COPY INTO healthcare_raw.raw_data.imaging_studies FROM @healthcare_raw.external_stages.stage_imaging_studies ON_ERROR = 'CONTINUE';

COPY INTO healthcare_raw.raw_data.immunizations FROM @healthcare_raw.external_stages.stage_immunizations ON_ERROR = 'CONTINUE';

COPY INTO healthcare_raw.raw_data.medications FROM @healthcare_raw.external_stages.stage_medications ON_ERROR = 'CONTINUE';

COPY INTO healthcare_raw.raw_data.observations FROM @healthcare_raw.external_stages.stage_observations ON_ERROR = 'CONTINUE';

COPY INTO healthcare_raw.raw_data.organizations FROM @healthcare_raw.external_stages.stage_organizations ON_ERROR = 'CONTINUE';

COPY INTO healthcare_raw.raw_data.patients FROM @healthcare_raw.external_stages.stage_patients ON_ERROR = 'CONTINUE';

COPY INTO healthcare_raw.raw_data.payer_transitions FROM @healthcare_raw.external_stages.stage_payer_transitions ON_ERROR = 'CONTINUE';

COPY INTO healthcare_raw.raw_data.payers FROM @healthcare_raw.external_stages.stage_payers ON_ERROR = 'CONTINUE';

COPY INTO healthcare_raw.raw_data.procedures FROM @healthcare_raw.external_stages.stage_procedures ON_ERROR = 'CONTINUE';

COPY INTO healthcare_raw.raw_data.providers FROM @healthcare_raw.external_stages.stage_providers ON_ERROR = 'CONTINUE';

COPY INTO healthcare_raw.raw_data.supplies FROM @healthcare_raw.external_stages.stage_supplies ON_ERROR = 'CONTINUE';
