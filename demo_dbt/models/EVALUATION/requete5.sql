{{ config(tags=["requete"]) }}

SELECT distinct a.name,count(distinct al.title) as nb_albums

FROM {{ref('fact')}} as f
join {{ref('dimArtist')}} as a on a.artistid = f.artistid
join {{ref('dimAlbum')}} as al on al.albumid = f.albumid

GROUP by a.name
