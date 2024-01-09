{{ config(tags=["requete"]) }}

SELECT title FROM {{ref('dimAlbum')}} 
where cd_number>1

