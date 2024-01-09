{{ config(tags=["requete"]) }}

SELECT distinct p.name
FROM {{ref('fact')}} as f
join {{ref('dimTrack')}} as t on t.trackid = f.trackid
join {{ref('dimPlaylist')}} as p on p.playlistid = f.playlistid

WHERE f.duration >= (60*4*1000)