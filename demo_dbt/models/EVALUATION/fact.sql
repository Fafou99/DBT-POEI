{{ config(materialized="table", tags=["starscheme"]) }}

with track as (
    select trackid, milliseconds as duration, bytes as size, genreid, albumid
     from {{ source('EVALUATION', 'TRACK') }}
),

play as (
    select playlistid, trackid
    from {{ source('EVALUATION', 'PLAYLISTTRACK') }}
),

alb as (
    select albumid, artistid
    from {{ source('EVALUATION', 'ALBUM') }}
),

final as (
    SELECT alb.albumid,
    alb.artistid,
    track.genreid,
    play.playlistid,
    track.trackid,
    track.duration,
    track.size
    from track
    join alb on track.albumid=alb.albumid
    join play on play.trackid=track.trackid
)

SELECT * FROM final