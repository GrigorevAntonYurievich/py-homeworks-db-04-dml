-- заполнение данными таблицы alboms
INSERT INTO alboms (alid, namealb, godvps)
VALUES (1, 'Rock Anthems', 2020);
INSERT INTO alboms (alid, namealb, godvps)
VALUES (2, 'Pop Hits', 2019);
INSERT INTO alboms (alid, namealb, godvps)
VALUES (1, 'Hip-Hop Classic', 2021);

-- заполнение данными таблицы ispolniteli
INSERT INTO ispolniteli (ispid, nameisp)
VALUES (1, 'Coldplay');
INSERT INTO ispolniteli (ispid, nameisp)
VALUES (2, 'Billie Eillish');
INSERT INTO ispolniteli (ispid, nameisp)
VALUES (3, 'Drake');
INSERT INTO ispolniteli (ispid, nameisp)
VALUES (4, 'Image Dragons');

-- заполнение данными таблицы jzanr
INSERT INTO jzanr (idjz, hazjz)
VALUES (1, 'Rock');
INSERT INTO jzanr (idjz, hazjz)
VALUES (2, 'Pop');
INSERT INTO jzanr (idjz, hazjz)
VALUES (3, 'Hip-Hop');

-- заполнение данными таблицы sbornik
INSERT INTO sbornik (sbornik_id, sbornik_name, data_relis)
VALUES (1, 'Top Rock Hits', 2018);
INSERT INTO sbornik (sbornik_id, sbornik_name, data_relis)
VALUES (2, 'Pop Essential', 2019);
INSERT INTO sbornik (sbornik_id, sbornik_name, data_relis)
VALUES (3, 'Hip-Hop Vibes', 2020);
INSERT INTO sbornik (sbornik_id, sbornik_name, data_relis)
VALUES (4, 'Mixed Favorites', 2017);

-- заполнение данными таблицы traks
INSERT INTO traks (trekid, nametrek, dlitel, alid)
VALUES (1, 'Yellow', 4, 1);
INSERT INTO traks (trekid, nametrek, dlitel, alid)
VALUES (2, 'Bad Guy', 3, 2);
INSERT INTO traks (trekid, nametrek, dlitel, alid)
VALUES (3, 'Gods Plan', 3, 3);
INSERT INTO traks (trekid, nametrek, dlitel, alid)
VALUES (4, 'Radioactive', 4, 1);
INSERT INTO traks (trekid, nametrek, dlitel, alid)
VALUES (5, 'Ocean Eyes', 3, 2);
INSERT INTO traks (trekid, nametrek, dlitel, alid)
VALUES (5, 'In my feeling', 2, 3);

-- заполнение данными таблицы artist_albums
INSERT INTO artist_albums (ispid, alid)
VALUES (1, 1);
INSERT INTO artist_albums (ispid, alid)
VALUES (2, 2);
INSERT INTO artist_albums (ispid, alid)
VALUES (3, 3);
INSERT INTO artist_albums (ispid, alid)
VALUES (4, 1);

-- заполнение данными таблицы artist_genre
INSERT INTO artist_genre (ispid, idjz)
VALUES (1, 1);
INSERT INTO artist_genre (ispid, idjz)
VALUES (2, 2);
INSERT INTO artist_genre (ispid, idjz)
VALUES (3, 3);
INSERT INTO artist_genre (ispid, idjz)
VALUES (4, 1);

-- заполнение данными таблицы compilation_tracks
INSERT INTO compilation_tracks (sbornik_id, trekid)
VALUES (1, 1);
INSERT INTO compilation_tracks (sbornik_id, trekid)
VALUES (2, 2);
INSERT INTO compilation_tracks (sbornik_id, trekid)
VALUES (3, 3);
INSERT INTO compilation_tracks (sbornik_id, trekid)
VALUES (4, 1);
INSERT INTO compilation_tracks (sbornik_id, trekid)
VALUES (2, 5);
INSERT INTO compilation_tracks (sbornik_id, trekid)
VALUES (3, 6);

