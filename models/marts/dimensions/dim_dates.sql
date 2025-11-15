{{ config(materialized='table') }}

with base as (
    -- Generate 10 years of daily dates using a generator
    select
        dateadd(day, seq4(), dateadd(day, -3650, current_date())) as date_day
    from table(generator(rowcount => 3650))
)
select
    date_day,
    extract(year from date_day) as year,
    extract(month from date_day) as month,
    extract(day from date_day) as day,
    extract(quarter from date_day) as quarter,
    to_char(date_day, 'Day') as day_name,
    to_char(date_day, 'Mon') as month_abbr,
    to_char(date_day, 'Month') as month_name,
    weekofyear(date_day) as week_of_year
from base
order by date_day
