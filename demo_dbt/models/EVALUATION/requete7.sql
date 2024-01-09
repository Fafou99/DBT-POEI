{{ config(tags=["requete"]) }}

SELECT g.name, count(distinct t.name) as nb_tracks

FROM {{ref('fact')}} as f
join {{ref('dimGenre')}} as g on g.genreid = f.genreid
join {{ref('dimAlbum')}} as a on a.albumid = f.albumid
join {{ref('dimTrack')}} as t on t.trackid = f.trackid
WHERE a.prod_year >= '2000'

GROUP by g.name
order by nb_tracks desc