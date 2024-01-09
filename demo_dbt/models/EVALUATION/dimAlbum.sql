{{ config(materialized="table", tags=["starscheme"]) }}

with req1 as (
    select albumid,
    title,
    prod_year,
    cd_number
     from {{ source('EVALUATION', 'ALBUM') }}
)

SELECT * from req1