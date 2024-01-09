{{ config(tags=["requete"]) }}

SELECT a.title, sum(duration) as longueur

FROM {{ref('fact')}} as f
join {{ref('dimAlbum')}} as a on a.albumid = f.albumid
group by a.title
order by longueur desc
limit 10
