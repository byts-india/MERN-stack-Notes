CREATE DATABASE test_db;
DROP DATABASE test_db;
SHOW DATABASES;
USE test_db;
-----------------

CREATE TABLE student (
	roll_no  VARCHAR(10)  PRIMARY KEY,
	name     VARCHAR(255) NOT NULL,
	age      INT,
	dept     INT
);

CREATE TABLE department (
	id   INT 			PRIMARY KEY,
	name VARCHAR(255) 	NOT NULL,
	hod  VARCHAR(255)
);

CREATE TABLE subject (
	id      INT     	PRIMARY KEY,
	dept_id INT     	NOT NULL,
	name    VARCHAR(255)	
);

CREATE TABLE marks (
	stu_id      INT,
	dept_id     INT,
	sub_id      INT,
	marks 		INT
);

SHOW TABLES;
DESCRIBE table_name;
DROP TABLE table_name;

CREATE TABLE sample (
   id INT PRIMARY KEY AUTO_INCREMENT,
   name VARCHAR(255) NOT NULL
);

INSERT INTO sample VALUES
(1, 'raju'),
(2, 'ram'),
(3, 'vel'),
(4, 'rani');

INSERT INTO sample (name) VALUES
('karthick'),
('jackie'),
('shin chan');

SELECT * FROM sample;
SELECT name FROM sample;
SELECT id AS roll_no, name FROM sample;
-- below will only delete contents.
-- below will also reset your auto_incr
TRUNCATE sample;

RENAME TABLE sample TO test; 
RENAME TABLE test TO sample;  

/*
alter table
	add column
	modify column
	drop column
	rename column
*/

ALTER TABLE sample
ADD COLUMN age int CHECK ( age > 18 );

ALTER TABLE sample
MODIFY COLUMN age float NOT NULL;

ALTER TABLE sample
DROP COLUMN age;

ALTER TABLE sample
RENAME COLUMN id TO sno;

UPDATE sample SET age = 19;