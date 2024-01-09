{{ config(tags=["requete"]) }}

SELECT distinct p.name

FROM {{ref('fact')}} as f
join {{ref('dimPlaylist')}} p on p.playlistid = f.playlistid
join {{ref('dimArtist')}} a on a.artistid = f.artistid
join {{ref('dimTrack')}} t on t.trackid = f.trackid
WHERE a.birthyear <= '1990'