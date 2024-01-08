WITH region AS (
    SELECT * FROM {{ref ('country_codes')}}
),

pop as (
    select ISO3166_1, total_population from {{ source('COVID19_Epidemiological_Data', 'DEMOGRAPHICS') }}
),

final as (
    select * from pop 
    left join region on region.code = pop.ISO3166_1
)

select * from final

