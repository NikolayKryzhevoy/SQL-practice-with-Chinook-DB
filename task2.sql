-- Which track generated the most revenue?
SELECT Name as 'Track_Name', tracks.TrackId, AlbumId, GenreId, SUM(tracks.UnitPrice) AS 'Track_Revenue'
FROM invoice_items
	JOIN tracks
		ON tracks.TrackId = invoice_items.TrackId
GROUP BY 2
ORDER BY 5 DESC
-- There are 8 tracks with the largest revenue 

  
-- Which album generated the most revenue?
SELECT albums.Title as 'Title', albums.AlbumId, Round(SUM(tracks.UnitPrice),2) AS 'Album_Revenue'
FROM invoice_items
	JOIN tracks
		ON tracks.TrackId = invoice_items.TrackId
	JOIN albums
		ON albums.AlbumId = tracks.AlbumId
GROUP BY 2
ORDER BY 3 DESC; 
-- Battlestar Galactica (Classic), Season 1 with 35.82$


-- Which genre generated the most revenue?
SELECT genres.Name as 'Genre', genres.GenreId, Round(SUM(tracks.UnitPrice),2) AS 'Genre_Revenue'
FROM invoice_items
	JOIN tracks
		ON tracks.TrackId = invoice_items.TrackId
	JOIN genres
		ON genres.GenreId = tracks.GenreId
GROUP BY 2
ORDER BY 3 DESC; 
-- Rock with 826.65$