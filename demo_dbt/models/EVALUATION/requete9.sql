{{ config(tags=["requete"]) }}

SELECT distinct t.name as Morceaux, a.name as Artiste, g.name as Genre

FROM {{ref('fact')}} as f
join {{ref('dimGenre')}} as g on g.genreid = f.genreid
join {{ref('dimArtist')}} as a on a.artistid = f.artistid
join {{ref('dimTrack')}} as t on t.trackid = f.trackid
WHERE  a.country='France' AND g.name = 'Rock'