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

-- create table for tv providers with columns id and providername --

CREATE TABLE showProvider(
    id INTEGER(20) AUTO_INCREMENT NOT NULL,
    providerName VARCHAR(30),
    PRIMARY KEY(id)
);

-- insert provider names into table showProvider --

INSERT INTO showProvider (providerName) values ('Netflix'); -- Netflix id = 1 --
INSERT INTO showProvider (providerName) values ('Hulu'); -- Hulu id = 2 --
INSERT INTO showProvider (providerName) values ('DisneyPlus'); -- DisneyPlay id = 3 --

-- update the show table and replace the tvprodiver names with the matching showprovider ids -- 

UPDATE shows
SET tvProvider = 2 --Hulu
WHERE id = 1; --Handmaids Tale

UPDATE shows
SET tvProvider = 1 --Netflix
WHERE id = 2; --Bridgerton

UPDATE shows
SET tvProvider = 1 --Netflix
WHERE id = 3; -- Stranger Things

UPDATE shows
SET tvProvider = 3 --DisneyPlus
WHERE id = 4; --WandaVision

UPDATE shows
SET tvProvider = 2 --Hulu
WHERE id = 5; --Killing Eve

-- now, use the "showProvider" table values and replace the matching provider id in our "shows" table --

SELECT * FROM shows;
SELECT * FROM showProvider;

-- show ALL tv shows from "shows" using the showProvider instead of tvProvider id number
-- INNER JOIN will only return all matching values from both tables
SELECT showName, providerName
FROM shows
INNER JOIN showProvider ON shows.tvProvider = showProvider.id;
