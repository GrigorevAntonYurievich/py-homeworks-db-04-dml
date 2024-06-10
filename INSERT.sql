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
('Yellow', '1', '4:25'),
('Bad Guy', '2', '3:02'),
('Gods Plan', '3', '3:32'),
('Radioactive', '1', '4:16'),
('Ocean Eyes', '2', '3:52'),
('In my feeling', '3', '2:11'),
('myself', '2', '1:25'),
('by myself', '2', '1:24'),
('bemy self', '2', '1:23'),
('myself by', '2', '1:22'),
('by myself by', '2', '1:21'),
('beemy', '2', '1:20'),
('premyne', '2', '1:26');

-- заполнение данными таблицы sbornik
INSERT INTO sborniki (sbornik_name, data_relis)
VALUES 
('Top Rock Hits', '2018');
('Pop Essential', '2019');
('Hip-Hop Vibes', '2020');
('Mixed Favorites', '2017');

-- заполнение данными таблицы compilation_tracks
INSERT INTO compilation_tracks (trekid , sbornik_id)
VALUES
(1,1);

INSERT INTO compilation_tracks (trekid , sbornik_id)
VALUES
(generate_series(2, 10),generate_series(2, 10));


INSERT INTO compilation_tracks (trekid, sbornik_id)
VALUES 
(generate_series(11, 20, generate_series(1, 10));

-- заполнение данными таблицы artist_albums
INSERT INTO artist_albums (ispid, alid)
VALUES 
(generate_series(1, 10), generate_series(1, 10));

INSERT INTO artist_albums (ispid, alid)
VALUES 
(generate_series(3, 6), generate_series(7, 10));

-- заполнение данными таблицы artist_genre
INSERT INTO artist_genre (ispid, idjz)
VALUES 
(generate_series(1, 10), generate_series(1, 10));

INSERT INTO artist_genre (ispid, idjz)
VALUES 
(generate_series(2, 5), generate_series(6, 9));




