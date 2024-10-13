Retrieve the names of all tracks that have more than 1 billion streams.

select track from spotify
where stream >= 1000000000;

List all albums along with their respective artists.


select album,artist from spotify;

Get the total number of comments for tracks where licensed = TRUE.


select count(comments) from spotify 
where licensed = 'True';


Find all tracks that belong to the album type single.


select track from spotify where album_type = 'single';


Count the total number of tracks by each artist.



select count(track), artist from spotify
group by artist;






Calculate the average danceability of tracks in each album.


select avg(danceability),album from spotify
group by album;




Find the top 5 tracks with the highest energy values.


select track,energy from spotify 
order by energy Desc
limit 5;

List all tracks along with their views and likes where official_video = TRUE.


select track,views,likes from spotify 
where official_video = 'True';

For each album, calculate the total views of all associated tracks.


select sum(views) ,album
from spotify
group by album;



Retrieve the track names that have been streamed on Spotify more than YouTube.


SELECT track, most_played_on
FROM spotify
WHERE most_played_on = 'Spotify';


Find the top 3 most-viewed tracks for each artist using window functions.


select artist,track, sum(views) as total_views,
dense_rank() over(partition by artist order by sum(views) desc)
as rank from spotify 
group by 1,2
order by 1,3 desc


Write a query to find tracks where the liveness score is above the average.

select track , liveness
from spotify 
where liveness > (select avg(liveness) from spotify);




