-- create new database --
DROP DATABASE IF EXISTS tv_db;
CREATE DATABASE tv_db;
USE tv_db;

-- create a table shows and with 3 columns: id, showname and tv provider --

CREATE TABLE shows(
  id INTEGER(11) AUTO_INCREMENT NOT NULL,
  showName VARCHAR(30),
  tvProvider VARCHAR(100),
  PRIMARY KEY (id)
);

-- add values to your database, specifying which column and values --

INSERT INTO shows (showName, tvProvider) values ("The Handmaid's Tale", "Hulu");
INSERT INTO shows (showName, tvProvider) values ("Bridgerton", "Netflix");
INSERT INTO shows (showName, tvProvider) values ("Stranger Things", "Netflix");
INSERT INTO shows (showName, tvProvider) values ("WandaVision", "DisneyPlus");
INSERT INTO shows (showName, tvProvider) values ("Killing Eve", "Hulu");


-- CREATE TABLE authors(
--   id INTEGER(11) AUTO_INCREMENT NOT NULL,
--   firstName VARCHAR(100),
--   lastName VARCHAR(100),
--   PRIMARY KEY (id)
-- );

-- INSERT INTO authors (firstName, lastName) values ('Jane', 'Austen');
-- INSERT INTO authors (firstName, lastName) values ('Mark', 'Twain');
-- INSERT INTO authors (firstName, lastName) values ('Lewis', 'Carroll');
-- INSERT INTO authors (firstName, lastName) values ('Andre', 'Asselin');


SELECT * FROM authors;
SELECT * FROM shows;

-- show ALL books with authors
-- INNER JOIN will only return all matching values from both tables
SELECT title, firstName, lastName
FROM books
INNER JOIN authors ON books.authorId = authors.id;

-- show ALL books, even if we don't know the author
-- LEFT JOIN returns all of the values from the left table, and the matching ones from the right table
SELECT title, firstName, lastName
FROM books
LEFT JOIN authors ON books.authorId = authors.id;

-- show ALL books, even if we don't know the author
-- RIGHT JOIN returns all of the values from the right table, and the matching ones from the left table
SELECT title, firstName, lastName
FROM books
RIGHT JOIN authors ON books.authorId = authors.id;
