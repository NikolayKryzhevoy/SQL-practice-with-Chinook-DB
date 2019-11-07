-- Is the number of times a track appears in any playlist a good indicator of sales?
WITH playlist_query 
AS ( 
	SELECT tracks.TrackId, COUNT(*) as 'NPlaylists'
	FROM playlist_track
		JOIN tracks
			ON playlist_track.TrackId = tracks.TrackId
	GROUP BY 1
	),
revenue_query 
AS	(
	SELECT tracks.TrackId,  SUM(tracks.UnitPrice) AS 'Track_Revenue'
	FROM invoice_items
		JOIN tracks
			ON tracks.TrackId = invoice_items.TrackId
	GROUP BY 1
	)
SELECT playlist_query.TrackId, playlist_query.NPlaylists, revenue_query.Track_Revenue
FROM playlist_query
	JOIN revenue_query
		ON playlist_query.TrackId = revenue_query.TrackId
ORDER BY 3 DESC;
-- There is no correlation between the sales and the occurrance number of a track in playlists.
