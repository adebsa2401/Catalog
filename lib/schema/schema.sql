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
    color               VARCHAR(100),
);