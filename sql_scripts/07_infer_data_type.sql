-- 07_infer_data_type.sql
USE ROLE TRANSFORM;
USE WAREHOUSE TRANSFORMING;
USE DATABASE HEALTHCARE_RAW;

SELECT
    table_name,
    column_name,
    CASE
        WHEN REGEXP_LIKE(data1, '^-?[0-9]+$')
         AND REGEXP_LIKE(data2, '^-?[0-9]+$')
         AND REGEXP_LIKE(data3, '^-?[0-9]+$')
        THEN 'NUMBER'

        WHEN REGEXP_LIKE(data1, '^-?[0-9]+\\.[0-9]+([eE]-?[0-9]+)?$')
         OR  REGEXP_LIKE(data2, '^-?[0-9]+\\.[0-9]+([eE]-?[0-9]+)?$')
         OR  REGEXP_LIKE(data3, '^-?[0-9]+\\.[0-9]+([eE]-?[0-9]+)?$')
        THEN 'FLOAT'

        WHEN REGEXP_LIKE(data1, '^[0-9]{4}-[0-9]{2}-[0-9]{2}$')
         OR  REGEXP_LIKE(data2, '^[0-9]{4}-[0-9]{2}-[0-9]{2}$')
         OR  REGEXP_LIKE(data3, '^[0-9]{4}-[0-9]{2}-[0-9]{2}$')
        THEN 'DATE'

        /* ---- Timestamp with optional Z or fractional seconds ---- */
        WHEN REGEXP_LIKE(data1, '^[0-9]{4}-[0-9]{2}-[0-9]{2}[ T][0-9]{2}:[0-9]{2}:[0-9]{2}(\\.[0-9]+)?Z?$')
         OR  REGEXP_LIKE(data2, '^[0-9]{4}-[0-9]{2}-[0-9]{2}[ T][0-9]{2}:[0-9]{2}:[0-9]{2}(\\.[0-9]+)?Z?$')
         OR  REGEXP_LIKE(data3, '^[0-9]{4}-[0-9]{2}-[0-9]{2}[ T][0-9]{2}:[0-9]{2}:[0-9]{2}(\\.[0-9]+)?Z?$')
        THEN 'TIMESTAMP_NTZ'

        WHEN REGEXP_LIKE(data1, '^(true|false|yes|no|0|1)$', 'i')
         OR  REGEXP_LIKE(data2, '^(true|false|yes|no|0|1)$', 'i')
         OR  REGEXP_LIKE(data3, '^(true|false|yes|no|0|1)$', 'i')
        THEN 'BOOLEAN'

        ELSE 'VARCHAR'
    END AS inferred_datatype, 
    data1, data2,data3
FROM healthcare_raw.raw_data.table_column_preview;
