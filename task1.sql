-- Which tracks appeared in the most playlists? how many playlists did they appear in? 
-- How tracks are distributed over playlists ?
WITH tmp 
AS	(
	SELECT TrackId, COUNT(*) AS 'Playlists'
	FROM playlist_track
	GROUP BY 1
	)
SELECT COUNT(*) as 'Tracks', Playlists
FROM tmp
GROUP BY 2
ORDER BY 2 DESC; 
--   41 tracks are present in 5 playlists
--   70 tracks are present in 4 playlists
-- 1446 tracks are present in 3 playlists
-- 1946 tracks are present in 2 playlists


SELECT Name as 'Track_Name', tracks.TrackId, COUNT(*) AS 'Playlists'
FROM playlist_track
	JOIN tracks
		ON playlist_track.TrackId = tracks.TrackId
GROUP BY 2
ORDER BY 3 DESC
LIMIT 41;
-- 41 tracks appearing in 5 playlists
 