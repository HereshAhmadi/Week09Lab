DROP DATABASE if exists notesdb;
CREATE DATABASE notesdb;

USE notesdb;

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

CREATE TABLE notes (
    note_id int(11) NOT NULL AUTO_INCREMENT,
    title varchar(30) NOT NULL,
    contents varchar(20000) CHARACTER SET utf8 NOT NULL,
    owner varchar(40) NOT NULL,
  PRIMARY KEY (note_id),
  KEY FK_Notes_User (owner),
  CONSTRAINT FK_Notes_User FOREIGN KEY (owner) REFERENCES users (email) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO notes(title,contents,owner)
VALUES
('Quote #1', 'Writing is nature''s way of letting you know how sloppy your thinking is.', 'sait.cprg.352+anne@gmail.com'),
('Another Quote', '"Java is to JavaScript as ham is to hamster." -  Jeremy Keith', 'sait.cprg.352+anne@gmail.com' ),
('Matilda''s Note', 'I do not want Anne reading this note. She stole my broccoli casserole recipe 8 years ago and claimed it was hers.','sait.cprg.352+matilda@gmail.com');
COMMIT;