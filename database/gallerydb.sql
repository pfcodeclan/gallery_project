DROP TABLE artists;
DROP TABLE exhibits;

CREATE TABLE artists (
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  category VARCHAR(255) NOT NULL
);

CREATE TABLE exhibits (
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  category VARCHAR(255) NOT NULL
);
