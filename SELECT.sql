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
