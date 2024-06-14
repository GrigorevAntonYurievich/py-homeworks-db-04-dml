-- Создание таблицы "JZANR" для хранения информации об жанрах
CREATE TABLE IF NOT EXISTS JZANR (
    IDJZ SERIAL PRIMARY KEY NOT NULL,
    HAZJZ VARCHAR(60) NOT NULL
);

-- Создание таблицы "ALBOMS" для хранения информации о альбомах
CREATE TABLE IF NOT EXISTS ALBOMS (
    ALID SERIAL PRIMARY KEY,
    NAMEALB VARCHAR(60) NOT NULL,
    GODVPS INTEGER
);

-- Создание таблицы "ISPOLNITELI" для хранения исполнителей
CREATE TABLE IF NOT EXISTS ISPOLNITELI (
    ISPID SERIAL PRIMARY KEY NOT NULL,
    NAMEISP VARCHAR(60) NOT NULL
);

-- Создание таблицы "SBORNIKI" для хранения информации о сборниках
CREATE TABLE IF NOT EXISTS SBORNIKI (
    SBORNIK_ID SERIAL PRIMARY KEY NOT NULL,
    SBORNIK_NAME VARCHAR(60) NOT NULL,
    DATA_RELIS INTEGER
);

-- Создание таблицы "TRAKS" для хранения информации о треках
CREATE TABLE IF NOT EXISTS TRAKS (
    TREKID SERIAL PRIMARY KEY,
    NAMETREK VARCHAR(60) NOT NULL,
    ALID INTEGER REFERENCES ALBOMS(ALID),    
    DLITEL TIME
);

-- Создание связующей таблицы "Compilation_Tracks" для хранения связей между сборниками и треками
CREATE TABLE IF NOT EXISTS Compilation_Tracks (
    SBORNIK_ID INTEGER REFERENCES SBORNIKI(SBORNIK_ID),
    TREKID INTEGER REFERENCES TRAKS(TREKID),
    CONSTRAINT pk_traks_sborniki PRIMARY KEY (SBORNIK_ID, TREKID)
);

-- Создание связующей таблицы "Artist_Genres" для хранения связей между исполнителями и жанрами
CREATE TABLE Artist_Genres (
    IDJZ INTEGER REFERENCES JZANR(IDJZ),
    ISPID INTEGER REFERENCES ISPOLNITELI(ISPID),
    CONSTRAINT Artist_Genres_pkey PRIMARY KEY (ISPID, IDJZ) -- связь между исполнителями и жанрами
);

-- Создание связующей таблицы "Artist_Albums" для хранения связей между исполнителями и альбомами
CREATE TABLE Artist_Albums (
    ISPID INTEGER REFERENCES ISPOLNITELI(ISPID),
    ALID INTEGER REFERENCES ALBOMS(ALID),
    CONSTRAINT pk_ispolniteli_alboms PRIMARY KEY (ISPID, ALID)
);
    
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

-- Название и продолжительность самого длительного трека.
 SELECT nametrek, dlitel from traks 
 order by dlitel desc
 limit 1; 
 
-- Название треков, продолжительность которых не менее 3,5 минут.
 SELECT nametrek, dlitel from traks
 where dlitel >='00:03:30'; 

-- Названия сборников, вышедших в период с 2018 по 2020 год включительно.
 select sbornik_name, data_relis  from sborniki
 where data_relis between 2018 and 2020;

-- Исполнители, чьё имя состоит из одного слова.
 select nameisp from ispolniteli
 where nameisp not like '% %';
 
--Название треков, которые содержат слово «мой» или «my».
SELECT nametrek 
FROM traks 
WHERE nametrek iLIKE '% my %' 
   OR nametrek iLIKE 'my %' 
   OR nametrek iLIKE '% my' 
   OR nametrek iLIKE '% мой %' 
   OR nametrek iLIKE 'мой %' 
   OR nametrek iLIKE '% мой';
  
-- Количество исполнителей в каждом жанре.
SELECT jzanr.hazjz, count(ispolniteli.nameisp) AS singers_in_genre FROM jzanr
JOIN artist_genres ON jzanr.idjz = artist_genres.ispid
JOIN ispolniteli ON artist_genres.ispid = ispolniteli.ispid
GROUP BY jzanr.hazjz
ORDER BY count(ispolniteli.ispid) DESC;

--Количество треков, вошедших в альбомы 2019–2020 годов.
SELECT COUNT(traks.nametrek) AS total_traks 
FROM alboms
JOIN traks ON traks.alid = alboms.alid
WHERE alboms.godvps BETWEEN '2019' AND '2020';

--Средняя продолжительность треков по каждому альбому.
SELECT alboms.namealb AS aloboms, avg(traks.dlitel) AS average_songs_duration FROM alboms
JOIN traks ON traks.alid = alboms.alid
GROUP BY alboms.namealb
ORDER BY avg(traks.dlitel);

--Все исполнители, которые не выпустили альбомы в 2020 году.
 SELECT DISTINCT ispolniteli.nameisp AS ispolniteli FROM ispolniteli
 WHERE ispolniteli.nameisp NOT IN
 (SELECT DISTINCT ispolniteli.nameisp AS ispolniteli FROM ispolniteli
 JOIN artist_albums ON ispolniteli.ispid = artist_albums.ispid
 JOIN alboms ON artist_albums.alid = alboms.alid
 WHERE alboms.godvps = 2020)
 ORDER BY ispolniteli.nameisp;

--Названия сборников, в которых присутствует конкретный исполнитель (выберите его сами).
 SELECT sborniki.sbornik_name AS sbornik1, ispolniteli.nameisp AS ispolniteli FROM sborniki
 LEFT JOIN compilation_tracks ON sborniki.sbornik_id = compilation_tracks.sbornik_id
 LEFT JOIN traks ON compilation_tracks.trekid = traks.trekid
 LEFT JOIN alboms ON traks.alid = alboms.alid
 LEFT JOIN artist_albums ON alboms.alid = artist_albums.alid
 LEFT JOIN ispolniteli ON artist_albums.ispid = ispolniteli.ispid
 WHERE ispolniteli.ispid = 2
 GROUP BY ispolniteli.nameisp, sborniki.sbornik_name;

