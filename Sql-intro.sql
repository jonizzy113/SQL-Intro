-- 1. Query all of the entries in the Genre table
SELECT * FROM Genre;

-- 2. Using INSERT, add an artist to the Artist Table
INSERT INTO Artist (ArtistName, YearEstablished) VALUES ('Imagine Dragons', 2008);
SELECT * FROM Artist;

-- DELETE FROM Artist WHERE ArtistName = 'Jisie David';

-- 3. Using the INSERT statement, add one, or more, albums by your artist to the Album table.
INSERT INTO Album (Title, AlbumLength, ReleaseDate, Label, ArtistId) VALUES ('Evolve', 12, 2017, 'Universial Music Group', 35);
INSERT INTO Album (Title, AlbumLength, ReleaseDate, Label, ArtistId) VALUES ('Night Visions', 13, 2012, 'Interscope Records', 35);

SELECT * FROM Album;

-- 4. Using the INSERT statement, add some songs that are on that album to the Song table

INSERT INTO Song (Title, SongLength, ReleaseDate, AlbumId, ArtistId) VALUES ('Whatever it takes', 174, '01/18/2012', 31, 35);
INSERT INTO Song (Title, SongLength, ReleaseDate, AlbumId, ArtistId) VALUES ('radioactive', 220, '01/18/2012', 32, 35);

SELECT * FROM Song;

-- 5. Write a SELECT query that provides the song titles, album title, and artist name for all of the data you just entered in. Use the LEFT JOIN keyword sequence to connect the tables, and the WHERE keyword to filter the results to the album and artist you added.

SELECT
    a.Title,
    s.Title,
    ar.ArtistName
    FROM Album a 
    LEFT JOIN Song s on s.ArtistId = a.ArtistId
    LEFT JOIN Artist ar on ar.Id = s.ArtistId;

SELECT
    a.Title,
    s.Title,
    ar.ArtistName
    FROM Song s
    LEFT JOIN Album a on a.ArtistId = s.ArtistID
    LEFT JOIN Artist ar on ar.Id = s.ArtistId;


-- 6. Write a SELECT statement to display how many songs exist for each album. You'll need to use the COUNT() function and the GROUP BY keyword sequence.

SELECT
    a.Title,
    COUNT(AlbumId)
    FROM Song s
    LEFT JOIN Album a on a.Id = s.AlbumId
    GROUP BY a.Title;

-- 7. Write a SELECT statement to display how many songs exist for each artist. You'll need to use the COUNT() function and the GROUP BY keyword sequence.

SELECT
    COUNT(Title),
    a.ArtistName
    FROM Song s
    LEFT JOIN Artist a on a.Id = s.ArtistId
    GROUP BY a.ArtistName;

-- 8. Write a SELECT statement to display how many songs exist for each genre. You'll need to use the COUNT() function and the GROUP BY keyword sequence.

SELECT
    COUNT(Title),
    g.Label
    FROM Song s
    LEFT JOIN Genre g on g.Id = s.GenreId
    GROUP BY g.Label;

-- 9. Using MAX() function, write a select statement to find the album with the longest duration. The result should display the album title and the duration.

SELECT
    a.Title,
    a.AlbumLength
    FROM Album a
    WHERE (SELECT MAX(AlbumLength) as LongestAlbum
            FROM Album) = a.AlbumLength;

-- 10. Using MAX() function, write a select statement to find the song with the longest duration. The result should display the song title and the duration.

SELECT
    s.Title,
    s.SongLength
    FROM Song s
    WHERE (SELECT MAX(SongLength) as LongestSong FROM Song) = s.SongLength;

-- 11. Modify the previous query to also display the title of the album.

SELECT
    s.Title,
    s.SongLength,
    a.Title
    FROM Song s
    JOIN Album a on a.Id = s.AlbumId
    WHERE (SELECT MAX(SongLength) as LongestSong FROM Song) = s.SongLength;