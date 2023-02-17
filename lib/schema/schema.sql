-- Books table
CREATE TABLE books (
    id                  SERIAL PRIMARY KEY,
    publish_date        DATE,
    archived            BOOLEAN,
    publisher           VARCHAR(100),
    cover_state         VARCHAR(100),
    genre_id            INT REFERENCES genre(id),
    author_id           INT REFERENCES author(id),
    source_id           INT REFERENCES source(id),
    label_id            INT REFERENCES label(id)
);

-- Label table
CREATE TABLE label (
    id                  SERIAL PRIMARY KEY,
    title               VARCHAR(100),
    color               VARCHAR(100)
);

-- games table
CREATE TABLE games (
    id                  SERIAL PRIMARY KEY,
    publish_date        DATE,
    archived            BOOLEAN,
    genre_id            INT REFERENCES genre(id),
    author_id           INT REFERENCES author(id),
    source_id           INT REFERENCES source(id),
    label_id            INT REFERENCES label(id),
    multiplayer         BOOLEAN,
    last_played_at      DATE
);

-- authors table
CREATE TABLE authors (
    id                  SERIAL PRIMARY KEY,
    first_name          VARCHAR(100),
    last_name           VARCHAR(100)
);

-- music table
CREATE TABLE music_album (
    id                  SERIAL PRIMARY KEY,
    on_spotify          BOOLEAN NOT NULL,
    genre_id            INT REFERENCES genre(id),
    author_id           INT REFERENCES author(id),
    source_id           INT REFERENCES source(id),
    label_id            INT REFERENCES label(id),
);

-- genre table
CREATE TABLE genre (
    id                  SERIAL PRIMARY KEY,
    name                VARCHAR(255) NOT NULL
);