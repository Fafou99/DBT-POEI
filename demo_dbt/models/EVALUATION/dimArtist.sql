{{ config(materialized="table", tags=["starscheme"]) }}

with alb as (
    select artistid,
    name,
    birthyear,
    country
     from {{ source('EVALUATION', 'ARTIST') }}
)

SELECT * from alb