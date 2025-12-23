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
	marks 		INT,
	FOREIGN KEY (stu_id) REFERENCES student(roll_no),
	FOREIGN KEY (dept_id) REFERENCES department(id)
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


ALTER TABLE marks 
ADD CONSTRAINT 
FOREIGN KEY (dept_id) 
REFERENCES department(id);

ALTER TABLE marks
ADD CONSTRAINT 
PRIMARY KEY (stu_id, dept_id, sub_id);
-- Here in above code,
-- combining three columns to form primary key.


--  below are taken in batch 02

-- single line comment
/*
multi
line 
comment
*/

SHOW DATABASES;
CREATE DATABASE temp_db;
USE temp_db;
DROP DATABASE temp_db;

SHOW TABLES;
DESCRIBE table_name;
SELECT * FROM customers;
SELECT first_name, age FROM customers;

CREATE TABLE student (
   id  		INT  			PRIMARY KEY, 
   name 	VARCHAR(50) 	NOT NULL,
   dept     VARCHAR(30)
);

INSERT INTO student VALUES 
(1, 'jackie', 'jackie@yahoo.com', 29, 'CSE'),
(2, 'julie','julie@gmail.com', 19, 'ECE');

SELECT * from student;

INSERT INTO student (id, name) VALUES
(3,'nobita'),
(4,'shin chan');

UPDATE student SET age = 20 WHERE age IS NULL; 
UPDATE student SET email = 'nobita@gmail.com' WHERE id = 3;
UPDATE student SET email = 'chan@gmail.com' WHERE id = 4;

DELETE FROM student WHERE dept IS NULL;
TRUNCATE student;  /* reset with empty values in table */

RENAME TABLE student TO marks;

ALTER TABLE student 
ADD COLUMN cgpa FLOAT DEFAULT 0;

ALTER TABLE student
RENAME COLUMN cgpa TO gpa;

ALTER TABLE student
DROP COLUMN age;
