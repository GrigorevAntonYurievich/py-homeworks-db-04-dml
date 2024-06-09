-- Создание таблицы "ISPOLNITELI" для хранения исполнителей
CREATE TABLE ISPOLNITELI (
    ISPID SERIAL PRIMARY KEY,
    NAMEISP VARCHAR(100) NOT NULL
);

-- Создание таблицы "JZANR" для хранения информации об жанрах
CREATE TABLE JZANR (
    IDJZ SERIAL PRIMARY KEY,
    HAZJZ VARCHAR(100) NOT NULL
);

-- Создание таблицы "ALBOMS" для хранения информации о альбомах
CREATE TABLE ALBOMS (
    ALID SERIAL PRIMARY KEY,
    NAMEALB VARCHAR(100) NOT NULL,
    GODVPS INTEGER NOT NULL
);

-- Создание таблицы "TRAKS" для хранения информации о треках
CREATE TABLE TRAKS (
    TREKID SERIAL PRIMARY KEY,
    NAMETREK VARCHAR(100) NOT NULL,
    DLITEL INTEGER NOT NULL,
    ALID INTEGER REFERENCES ALBOMS(ALID) ON DELETE CASCADE
);

-- Создание таблицы "SBORNIKI" для хранения информации о сборниках
CREATE TABLE SBORNIKI (
    SBORNIK_ID SERIAL PRIMARY KEY,
    SBORNIK_NAME VARCHAR(100) NOT NULL,
    DATA_RELIS INTEGER NOT NULL
);

-- Создание связующей таблицы "Artist_Genres" для хранения связей между исполнителями и жанрами
CREATE TABLE Artist_Genres (
    ISPID INTEGER REFERENCES ISPOLNITELI(ISPID) ON DELETE CASCADE,
    IDJZ INTEGER REFERENCES JZANR(IDJZ) ON DELETE CASCADE,
    PRIMARY KEY (ISPID, IDJZ)
);

-- Создание связующей таблицы "Artist_Albums" для хранения связей между исполнителями и альбомами
CREATE TABLE Artist_Albums (
    ISPID INTEGER REFERENCES ISPOLNITELI(ISPID) ON DELETE CASCADE,
    ALID INTEGER REFERENCES ALBOMS(ALID) ON DELETE CASCADE,
    PRIMARY KEY (ISPID, ALID)
);

-- Создание связующей таблицы "Compilation_Tracks" для хранения связей между сборниками и треками
CREATE TABLE Compilation_Tracks (
    SBORNIK_ID INTEGER REFERENCES SBORNIKI(SBORNIK_ID) ON DELETE CASCADE,
    TREKID INTEGER REFERENCES TRAKS(TREKID) ON DELETE CASCADE,
    PRIMARY KEY (SBORNIK_ID, TREKID)
);
