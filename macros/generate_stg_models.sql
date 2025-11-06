{% macro generate_stg_models() %}
{# 
    Reads from HEALTHCARE_RAW.UTIL.INFERRED_COLUMN_TYPES
        and builds one stg_<table>.sql model per raw table.
        #}
        
            {% set tables = run_query(
                    "select distinct table_name from HEALTHCARE_RAW.UTIL.INFERRED_COLUMN_TYPES"
                        ).columns[0].values() %}
                        
                            {% for tbl in tables %}
                                    {% set cols_query %}
                                                select column_name, inferred_datatype
                                                            from HEALTHCARE_RAW.UTIL.INFERRED_COLUMN_TYPES
                                                                        where table_name = '{{ tbl }}'
                                                                                    order by column_name
                                                                                            {% endset %}
                                                                                                    
                                                                                                            {% set model_sql %}
                                                                                                                    select
                                                                                                                            {% for row in run_query(cols_query) %}
                                                                                                                                        try_cast({{ row['COLUMN_NAME'] }} as {{ row['INFERRED_DATATYPE'] }}) as {{ row['COLUMN_NAME'] }}
                                                                                                                                                    {% if not loop.last %},{% endif %}
                                                                                                                                                            {% endfor %}
                                                                                                                                                                    from {{ source('raw_data', tbl|lower) }};
                                                                                                                                                                            {% endset %}
                                                                                                                                                                                    
                                                                                                                                                                                            {{ write_file('models/staging/stg_' ~ tbl|lower ~ '.sql', model_sql) }}
                                                                                                                                                                                                {% endfor %}
                                                                                                                                                                                                
                                                                                                                                                                                                    {{ log("✅ Staging models generated for " ~ tables|length ~ " tables.", info=True) }}
                                                                                                                                                                                                    {% endmacro %}%}