use warehouse transforming; 

create or replace database HEALTHCARE_RAW; 
grant all on database  healthcare_raw to role transform;


CREATE OR REPLACE DATABASE HEALTHCARE_ANALYTICS;
GRANT ALL ON DATABASE HEALTHCARE_ANALYTICS TO ROLE TRANSFORM;


use role transform;
USE DATABASE HEALTHCARE_RAW;
CREATE OR REPLACE SCHEMA RAW_DATA;
CREATE OR REPLACE SCHEMA UTIL;
