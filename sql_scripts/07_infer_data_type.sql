USE ROLE TRANSFORM;
USE WAREHOUSE TRANSFORMING;
USE DATABASE HEALTHCARE_RAW;
USE SCHEMA UTIL;

CREATE OR REPLACE TABLE INFERRED_COLUMN_TYPES AS 
SELECT
    table_name,
    column_name,
    ordinal_position,
    CASE
        /* ---- Integer ---- */
        WHEN REGEXP_LIKE(data1, '^-?[0-9]+$')
         AND REGEXP_LIKE(data2, '^-?[0-9]+$')
         AND REGEXP_LIKE(data3, '^-?[0-9]+$')
        THEN 'NUMBER'

        /* ---- Float ---- */
        WHEN REGEXP_LIKE(data1, '^-?[0-9]+\\.[0-9]+([eE]-?[0-9]+)?$')
         OR  REGEXP_LIKE(data2, '^-?[0-9]+\\.[0-9]+([eE]-?[0-9]+)?$')
         OR  REGEXP_LIKE(data3, '^-?[0-9]+\\.[0-9]+([eE]-?[0-9]+)?$')
        THEN 'FLOAT'

        /* ---- Date (YYYY-MM-DD) ---- */
        WHEN REGEXP_LIKE(data1, '^[0-9]{4}-[0-9]{2}-[0-9]{2}$')
         OR  REGEXP_LIKE(data2, '^[0-9]{4}-[0-9]{2}-[0-9]{2}$')
         OR  REGEXP_LIKE(data3, '^[0-9]{4}-[0-9]{2}-[0-9]{2}$')
        THEN 'DATE'

        /* ---- Timestamp (YYYY-MM-DD HH:MI:SS[.fff][Z]) ---- */
        WHEN REGEXP_LIKE(data1, '^[0-9]{4}-[0-9]{2}-[0-9]{2}[ T][0-9]{2}:[0-9]{2}:[0-9]{2}(\\.[0-9]+)?Z?$', 'i')
         OR  REGEXP_LIKE(data2, '^[0-9]{4}-[0-9]{2}-[0-9]{2}[ T][0-9]{2}:[0-9]{2}:[0-9]{2}(\\.[0-9]+)?Z?$', 'i')
         OR  REGEXP_LIKE(data3, '^[0-9]{4}-[0-9]{2}-[0-9]{2}[ T][0-9]{2}:[0-9]{2}:[0-9]{2}(\\.[0-9]+)?Z?$', 'i')
        THEN 'TIMESTAMP_NTZ'

        /* ---- Boolean-like ---- */
        WHEN REGEXP_LIKE(data1, '^(true|false|yes|no|0|1)$', 'i')
         OR  REGEXP_LIKE(data2, '^(true|false|yes|no|0|1)$', 'i')
         OR  REGEXP_LIKE(data3, '^(true|false|yes|no|0|1)$', 'i')
        THEN 'BOOLEAN'

        /* ---- Default ---- */
        ELSE 'VARCHAR'
    END AS inferred_datatype,
    data1, data2, data3
FROM HEALTHCARE_RAW.UTIL.TABLE_COLUMN_PREVIEW
QUALIFY ROW_NUMBER() OVER (PARTITION BY table_name, column_name ORDER BY ordinal_position) = 1
ORDER BY table_name, ordinal_position;

select replace(listagg(sql_script),', );',');\n') as final_script from (select table_name, 'CREATE OR REPLACE TEMP TABlE HEALTHCARE_RAW.RAW_DATA.' || table_name || '(' || listagg('"' || column_name || '" ' || INFERRED_DATATYPE || ', ') within group (order by ordinal_position) || ');' as sql_script FROM HEALTHCARE_RAW.UTIL.INFERRED_COLUMN_TYPES group by table_name);