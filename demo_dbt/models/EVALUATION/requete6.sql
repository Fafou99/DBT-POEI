{{ config(tags=["requete"]) }}

SELECT a.name, count(distinct t.name) as nb_tracks

FROM {{ref('fact')}} as f
join {{ref('dimArtist')}} as a on a.artistid = f.artistid
join {{ref('dimTrack')}} as t on t.trackid = f.trackid

GROUP by a.name
