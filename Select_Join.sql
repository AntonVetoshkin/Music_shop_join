SELECT Genre_name, COUNT(ArtistID) FROM Genre g
JOIN Artist_in_Genre a ON g.GenreID = a.GenreID;

SELECT Year, COUNT(TrackID) FROM Albums a
WHERE Year BETWEEN 2019 AND 2020
JOIN Tracks t ON a.AlbumID = t.AlbumID
GROUP BY a.Year;

SELECT Album_name, AVG(t.Time) FROM Albums a
JOIN Tracks t ON a.AlbumID = t.AlbumID
GROUP BY Album_name;

SELECT Artist_name FROM Artists a
JOIN Artist_in_Album aa ON a.ArtistID = aa.ArtistID
JOIN Albums al ON aa.AlbumID = al.AlbumID
WHERE Year != 2020;

SELECT Collection_name FROM Collection c
JOIN Tracks_in_Collection tc ON c.CollectionID = tc.CollectionID
JOIN Tracks t ON tc.TrackID = t.TrackID
JOIN Artist_in_Album aa ON t.AlbumID = aa.AlbumID
JOIN Artists a ON aa.ArtistID = a.ArtistID
WHERE Artist_name = 'Flame';

SELECT Album_name FROM Albums a
JOIN Artist_in_Album aa ON a.AlbumID = aa.AlbumID
JOIN Artists as ON aa.ArtistID = as.ArtistID
JOIN Artist_in_Genre ag ON as.ArtistID = ag.ArtistID
WHERE COUNT(ag.ID) > 1;

SELECT Track_name FROM Tracks t
LEFT JOIN Tracks_in_Collection tc ON t.TrackID = tc.TrackID
WHERE tc.TrackID IS NULL;

SELECT Artist_name, MIN(t.Time) FROM Tracks t
JOIN Artist_in_Album aa ON t.AlbumID = aa.AlbumID
JOIN Artists a ON aa.ArtistID = a.ArtistID;

SELECT Album_name, COUNT(TrackID) c FROM Albums a
JOIN Tracks t ON a.AlbumID = t.AlbumID
GROUP BY Album_name
ORDER BY c
LIMIT 3;