-- Название и продолжительность самого длительного трека.
 SELECT nametrek, dlitel from traks 
 order by dlitel desc
 limit 1; 
 
-- Название треков, продолжительность которых не менее 3,5 минут.
 SELECT nametrek, dlitel from traks
 where dlitel >=3.5; 

-- Названия сборников, вышедших в период с 2018 по 2020 год включительно.
 select sbornik_name, data_relis  from sborniki
 where data_relis between 2018 and 2020;

-- Исполнители, чьё имя состоит из одного слова.
 select nameisp from ispolniteli
 where nameisp not like '% %';

--Название треков, которые содержат слово «мой» или «my».
 select nametrek from traks 
 where nametrek like '%my%' or nametrek like '%мой%';

-- Количество исполнителей в каждом жанре.
select j.hazjz as jzanr, count(distinct t.alid) as artist_count from traks t 
join jzanr j on t.idjz = j.idjz 
group by j.hazjz 

--Количество треков, вошедших в альбомы 2019–2020 годов.
SELECT COUNT(*) AS total_tracks
FROM compilation_tracks
INNER JOIN artist_albums ON compilation_tracks.sbornik_id = artist_albums.alid 
WHERE alboms.year BETWEEN 2019 AND 2020;

