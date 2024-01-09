{{ config(materialized="table", tags=["starscheme"]) }}

with trc as (
    select trackid,
    name,
    composer

     from {{ source('EVALUATION', 'TRACK') }}
)

SELECT * from trc