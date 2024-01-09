{{ config(tags=["requete"]) }}

SELECT t.name

FROM {{ref('dimTrack')}} as t
join {{ref('fact')}} as f on t.trackid = f.trackid
join {{ref('dimAlbum')}} as a on a.albumid = f.albumid

where a.prod_year ='2002' OR a.prod_year = '2000'
