{{ config(tags=["requete"]) }}

SELECT t.name as song, t.composer, g.name as genre

FROM {{ref('fact')}} as f
join {{ref('dimTrack')}} as t on t.trackid = f.trackid
join {{ref('dimGenre')}} as g on g.genreid = f.genreid

where g.name ='Rock' OR g.name ='Jazz'