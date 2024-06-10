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
