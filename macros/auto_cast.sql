{% macro auto_cast(table_name) %}
{% set query %}
    SELECT DISTINCT COLUMN_NAME, INFERRED_DATATYPE, ORDINAL_POSITION
    FROM HEALTHCARE_RAW.UTIL.INFERRED_COLUMN_TYPES
    WHERE TABLE_NAME = upper('{{ table_name }}')
    ORDER BY ORDINAL_POSITION
{% endset %}

{% set results = run_query(query) %}
{% if execute %}
    {% set rows = results.rows %}
{% else %}
    {% set rows = [] %}
{% endif %}

{% for row in rows %}
    {% set col = row[0] %}
    {% set dtype = row[1] %}
    {% if 'NUMBER' in dtype or 'FLOAT' in dtype %}
        TRY_TO_NUMBER({{ col }}) AS {{ col }}
    {% elif 'TIMESTAMP' in dtype %}
        TRY_TO_TIMESTAMP_NTZ({{ col }}) AS {{ col }}
    {% elif 'DATE' in dtype %}
        TRY_TO_DATE({{ col }}) AS {{ col }}
    {% else %}
        {{ col }}
    {% endif %}
    {% if not loop.last %},{% endif %}
{% endfor %}
{% endmacro %}
