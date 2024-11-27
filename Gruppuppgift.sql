use movielist
CREATE DATABASE movielist
GO
USE movielist
CREATE TABLE movies(Id int IDENTITY(1,1),
					Titel nvarchar(255),
					[Running time (min)] smallint,
					Director nvarchar(255),
					IsGood bit,
					[MPA Rating] nvarchar(255),
					[Release Year] smallint,
					[Genre] nvarchar(255),
					[IMDB Score] float(24) )
SELECT c.name AS ColumnName,
       t.name AS DataType,
       c.max_length,
       c.precision,
       c.scale
FROM sys.columns c
JOIN sys.types t ON c.system_type_id = t.system_type_id
WHERE OBJECT_ID = OBJECT_ID('movies');

INSERT INTO [dbo].[movies]
           ([Titel]
           ,[Running time (min)]
           ,[Director]
           ,[IsGood]
           ,[MPA Rating]
           ,[Release Year]
           ,[Genre]
           ,[IMDB Score])
     VALUES
           ('Inception', 148, 'Christopher Nolan', 1, 'PG-13', 2010, 'Science fiction/thriller', 8.8),
           ('The Grand Budapest Hotel', 99, 'Wes Anderson', 1, 'R', 2014, 'Komedi/drama', 8.1),
           ('Parasite', 132, 'Bong Joon-ho', 1, 'R', 2019, 'Thriller/drama', 8.6),
           ('The Shawshank Redemption', 142, 'Frank Darabont', 1, 'R', 1994, 'Drama', 9.3),
           ('Pulp Fiction', 154, 'Quentin Tarantino', 1, 'R', 1994, 'Kriminal/drama', 8.9),
           ('Spirited Away', 125, 'Hayao Miyazaki', 1, 'PG', 2001, 'Animerad/fantasy', 8.6),
           ('The Dark Knight', 152, 'Christopher Nolan', 1, 'PG-13', 2008, 'Action/superhjälte', 9.0),
           ('Forrest Gump', 142, 'Robert Zemeckis', 1, 'PG-13', 1994, 'Drama/komedi', 8.8),
           ('Get Out', 104, 'Jordan Peele', 1, 'R', 2017, 'Skräck/thriller', 7.7),
           ('The Lord of the Rings: The Fellowship of the Ring', 178, 'Peter Jackson', 1, 'PG-13', 2001, 'Fantasy/äventyr', 8.8),
           ('The Social Network', 120, 'David Fincher', 1, 'PG-13', 2010, 'Drama/biografi', 7.7),
           ('Mad Max: Fury Road', 120, 'George Miller', 1, 'R', 2015, 'Action/postapokalyptisk', 8.1),
           ('Lejonkungen', 88, 'Roger Allers, Rob Minkoff', 1, 'G', 1994, 'Animerad', 8.5),
           ('Mästerkatten i stövlar: Den sista önskningen', 102, 'Joel Crawford', 1, 'PG', 2022, 'Äventyr/komedi', 7.9),
           ('Insidan ut', 95, 'Pete Docter, Ronnie del Carmen', 1, 'PG', 2015, 'Animerad/familj', 8.2);
--Alla filmer med IMDB score över 8
GO
SELECT Titel FROM movies
WHERE [IMDB Score] >= 8.5
SELECT * FROM movies
-- En tabell med alla regissörer som har gjort en komedi
SELECT Director FROM movies
WHERE Genre LIKE '%komedi%'
-- En tabell med filmer som har fler än en regissör
SELECT Titel, Director FROM movies
WHERE CHARINDEX(',',Director) > 0
-- Transformera minuter (int) till h:mm
