-- заполнение данными таблицы ispolniteli
INSERT INTO ispolniteli (nameisp)
VALUES ('Coldplay');
INSERT INTO ispolniteli (nameisp)
VALUES ('Billie Eillish');
INSERT INTO ispolniteli (nameisp)
VALUES ('Drake');
INSERT INTO ispolniteli (nameisp)
VALUES ('Image Dragons');

-- заполнение данными таблицы alboms
INSERT INTO alboms (namealb, godvps)
VALUES
('Rock Anthems', '2020'),
('Pop Hits', '2019'),
('Hip-Hop Classic', '2021');

-- заполнение данными таблицы jzanr
INSERT INTO jzanr (hazjz)
VALUES 
('Rock'),
('Pop'),
('Hip-Hop');

-- заполнение данными таблицы traks
INSERT INTO traks (nametrek, alid, dlitel)
VALUES 
('Yellow', '1', '00:04:25'),
('Bad Guy', '2', '00:03:02'),
('Gods Plan', '3', '00:03:32'),
('Radioactive', '1', '00:04:16'),
('Ocean Eyes', '2', '00:03:52'),
('In my feeling', '3', '00:02:11'),
('myself', '2', '00:01:25'),
('by myself', '2', '00:01:24'),
('bemy self', '2', '00:01:23'),
('myself by', '2', '00:01:22'),
('by myself by', '2', '00:01:21'),
('beemy', '2', '00:01:20'),
('premyne', '2', '00:01:26');

-- заполнение данными таблицы sbornik
INSERT INTO sborniki (sbornik_name, data_relis)
VALUES 
('Top Rock Hits', '2018'),
('Pop Essential', '2019'),
('Hip-Hop Vibes', '2020'),
('Mixed Favorites', '2017');

-- заполнение данными таблицы compilation_tracks
INSERT INTO compilation_tracks (sbornik_id, trekid)
VALUES
(1,1),
(2,2),
(3,3),
(4,4),
(2,5),
(3,6),
(2,7),
(2,8),
(2,9),
(2,10),
(4,11),
(4,12),
(4,13);

-- заполнение данными таблицы Artist_Genres
INSERT INTO Artist_Genres (ispid, idjz)
VALUES 
(1,1),
(2,2),
(3,3),
(4,1);

-- заполнение данными таблицы artist_albums
INSERT INTO Artist_Albums (ispid, alid)
VALUES 
(1,1),
(4,1),
(2,2),
(3,3);