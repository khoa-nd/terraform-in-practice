CREATE DATABASE bookdb

CREATE TABLE book
(id int NOT NULL,
 title varchar(1000),
 author varchar(1000),
 "year" int,
 PRIMARY KEY (id))

INSERT INTO bookdb.public.book (id, title, author, "year") VALUES ('1', 'Gone with the wind', 'Margaret Mitchell', '1936');
INSERT INTO bookdb.public.book (id, title, author, "year") VALUES ('2', 'Game of thrones', 'George R. R. Martin', '1996');
