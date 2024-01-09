{{ config(tags=["requete"]) }}

SELECT g.name as Genre, AVG(duration)/1000 as "Durée Moyenne Morceaux (en sec)"
FROM {{ref('fact')}} as f
join {{ref('dimGenre')}} as g on g.genreid = f.genreid

GROUP by g.name
order by AVG(duration) desc