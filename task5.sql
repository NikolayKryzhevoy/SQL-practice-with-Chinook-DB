-- Do longer or shorter length albums tend to generate more revenue?
WITH albums_query 
AS (
	SELECT AlbumId, COUNT(*) as 'NTracks', SUM(tracks.UnitPrice) as 'Album_Revenue' 
	FROM invoice_items
		JOIN tracks
			ON tracks.TrackId = invoice_items.TrackId
	GROUP BY 1           
	)
SELECT albums_query.NTracks, ROUND(AVG(albums_query.Album_Revenue),2) as 'Avg.Revenue'
FROM albums_query
GROUP BY 1
ORDER BY 1 DESC;
-- albums with more tracks generate more revenue

