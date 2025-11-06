USE ROLE TRANSFORM;
USE WAREHOUSE TRANSFORMING;
USE DATABASE HEALTHCARE_RAW;
USE SCHEMA UTIL;

CREATE OR REPLACE TABLE table_column_preview (
  table_name  VARCHAR,
  column_name VARCHAR,
  data1       VARCHAR,
  data2       VARCHAR,
  data3       VARCHAR
);

CREATE OR REPLACE PROCEDURE build_preview()
RETURNS VARCHAR
LANGUAGE JAVASCRIPT
AS
$$
var db  = 'HEALTHCARE_RAW';
var sch = 'RAW_DATA';

// get all tables in schema
var rs = snowflake.execute({
  sqlText: `SELECT TABLE_NAME
            FROM ${db}.INFORMATION_SCHEMA.TABLES
            WHERE TABLE_SCHEMA = '${sch}'
            AND TABLE_TYPE = 'BASE TABLE'
            ORDER BY TABLE_NAME`
});

while (rs.next()) {
  var tbl = rs.getColumnValue(1);

  var sql = `
    INSERT INTO ${db}.${sch}.TABLE_COLUMN_PREVIEW
    SELECT
      '${tbl}' AS table_name,
      f.key AS column_name,
      MAX(IFF(rn = 1, TO_VARCHAR(f.value), NULL)) AS data1,
      MAX(IFF(rn = 2, TO_VARCHAR(f.value), NULL)) AS data2,
      MAX(IFF(rn = 3, TO_VARCHAR(f.value), NULL)) AS data3
    FROM (
      SELECT OBJECT_CONSTRUCT(*) AS row_obj,
             ROW_NUMBER() OVER (ORDER BY 1) AS rn
      FROM ${db}.${sch}."${tbl}"
      QUALIFY rn <= 3
    ) t,
    LATERAL FLATTEN(input => t.row_obj) f
    GROUP BY f.key
  `;

  snowflake.execute({ sqlText: sql });
}

return 'OK';
$$;
