{{ config(materialized="table", tags=["starscheme"]) }}

with play as (
    select playlistid,
    name
    
     from {{ source('EVALUATION', 'PLAYLIST') }}
)

SELECT * from play