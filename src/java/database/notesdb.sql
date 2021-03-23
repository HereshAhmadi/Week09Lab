DROP DATABASE if exists usersdb;
CREATE DATABASE usersdb;

USE usersdb;

CREATE TABLE users (
    email VARCHAR(40) NOT NULL, 
    password VARCHAR(20) NOT NULL,
    active INT(1) NOT NULL DEFAULT '1',
    firstname VARCHAR(20), 
    lastname VARCHAR(20),  
    CONSTRAINT PK_email PRIMARY KEY (email));

INSERT INTO users(email, password, firstname, lastname)
VALUES
('sait.cprg.352+admin@gmail.com','password', null, null),
('sait.cprg.352+anne@gmail.com','password','Anne','Teak'),
('sait.cprg.352+matilda@gmail.com','password','Matilda','Keybroke'),
('sait.cprg.352+jerry@gmail.com','password','Jerry','Atrick'),
('sait.cprg.352+barb@gmail.com','password','Barbie','Kendall'),
('sait.cprg.352+billy@gmail.com','password','Billy','Maizear'),
('sait.cprg.352+patty@gmail.com','password','Patrick','O''Furniture');
COMMIT;

