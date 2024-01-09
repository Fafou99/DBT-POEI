{{ config(materialized="table", tags=["starscheme"]) }}

with genre as (
    select genreid,
    name
    
     from {{ source('EVALUATION', 'GENRE') }}
)

SELECT * from genre