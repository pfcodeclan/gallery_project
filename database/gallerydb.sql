DROP TABLE artists;
DROP TABLE exhibits;

CREATE TABLE exhibits (
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE artists (
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255),
  exhibit_id INT REFERENCES exhibits(id),
  price INT
);
