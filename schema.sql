DROP TABLE IF EXISTS album;
DROP TABLE IF EXISTS artist;
DROP TABLE IF EXISTS song;

CREATE TABLE album (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    year CHAR(4) NOT NULL,
    disk INTEGER
);

CREATE TABLE artist (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE song (
    id SERIAL PRIMARY KEY,
    album_id INTEGER NOT NULL,
    artist_id INTEGER NOT NULL,
    title VARCHAR(255),
    track INTEGER,
    time INTEGER,
    path VARCHAR(4098),
    FOREIGN KEY (artist_id) REFERENCES artist (id),
    FOREIGN KEY (album_id) REFERENCES album (id)
);
