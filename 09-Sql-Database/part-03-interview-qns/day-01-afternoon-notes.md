# interview questions

## BASIC

01. what is SQL ?
  - SQL structured query language
  - used in database queries

02. difference btw SQL and MYSQL ?
  - SQL  
  	- not a database / its a query lang
  - MYSQL
  	- is a database

03. what is database ?
  - database is an organized collections of data
  that can be easily accessed and managed.

04. what is a table ?
	- Table is a structured format for rows
	and columns used to store related data.
	- rows      => records
	- columns   => attributes

05. what is a primary key ?
	- PRIMARY KEY is a key, which uniquely identifies the row. 
	- Per table atleast one primary is mandatory.
	- PRIMARY KEY RULES :
		- NULL insertion is not allowed.
		- MUST be unique, no duplicates
	- = UNIQUE + NOT NULL
06. Can a table have multiple primary keys ?
	It will throw ERROR, as we can't keep multiple primary key.
	eg: 
	  CREATE TABLE sample (
		c1 INT PRIMARY KEY,
		c2 INT PRIMARY KEY,
		c3 INT PRIMARY KEY 
	  );
07. Can we create a table without PRIMARY KEY ?
	YES IT IS POSSIBLE.
	eg:
	CREATE TABLE sample (
		c1 INT,
		c2 INT,
		c3 INT 
	);
09. diff btw primary key and unique keys ?
	PRIMARY KEY
		- one per table
		- you can't have null
	UNIQUE:
		- Multiple col allowed,
		- we can pass null values;
10. what is foreign key ?
	- FOREIGN KEY is used to form a 
	  connection between 2 tables.
	CREATE TABLE dept (
		id   INT PRIMARY KEY, 
		name VARCHAR(20)
	);
	CREATE TABLE sample (
		id   	INT PRIMARY KEY,
		dept_id INT,
		FOREIGN KEY (dept_id) REFERENCES dept(id)
	);

09. can foreign key have NULL values ?
	- YES

10. what is constraint ?
	- Conditions or Rules we apply on columns are
	  called constraints

	eg: NOT NULL, UNIQUE, PRIMARY KEY, CHECK

01. Types of constraints in MYSQL ?
	- NOT NULL
	- UNIQUE
	- PRIMARY KEY
	- FOREIGN KEY
	- CHECK
	- DEFAULT

01. what is NOT NULL constraints ?
	- PREVENT from adding NULL values.

01. what is DEFAULT constraints ?
    - Assigning default value if none provided.

01. what is CHECK constraints ?
	- IT WILL VALIDATE BEFORE DOING insertion of data.

	eg:
		CREATE TABLE sample (
			id INT PRIMARY KEY AUTO_INCREMENT,
			age INT CHECK (age >= 18) 
		);
		
01. can CHECK constraints have a name ?
	yes. 
	eg:
	CREATE TABLE sample (
			id INT PRIMARY KEY AUTO_INCREMENT,
			age INT,
			CONSTRAINT check_age CHECK (age>=18) 
		);


- write syntax for SELECT ?
	- `SELECT COUNT(*) FROM sample;`
	- `SELECT COUNT(*) AS row_count FROM sample;`
	- `SELECT * FROM sample`
	- `SELECT age FROM sample`

- what is WHERE clause ?
	- IT is used to apply conditions.
	- `SELECT * FROM users WHERE id = 5 OR id = 8;`

## 

mysql> select * from users WHERE id = 5 OR id = 8;
+----+-------------+-------------------+-----------+
| id | username    | email             | password  |
+----+-------------+-------------------+-----------+
|  5 | mike_brown  | mike@example.com  | mikepass  |
|  8 | anita_gupta | anita@example.com | anita2024 |
+----+-------------+-------------------+-----------+

# WHERE CLAUSE

- SELECT * FROM users WHERE id > 10;

- select id, name, category, price from items;

- `SELECT 
		category, COUNT(*) AS count 
	FROM items 
	GROUP BY category 
	HAVING COUNT(*) = 5;`
+----------+-------+
| category | count |
+----------+-------+
| Grocery  |     5 |
| Fashion  |     5 |
+----------+-------+

- SELECT 
	category, SUM(price) 
  FROM 
  	items 
  WHERE id > 50 
  GROUP BY category
  HAVING SUM(price) > 1000; 


# AGGREGATIONS

is a process of performing calc on multi rows and returning a single value

COUNT()
SUM()
AVG()
MAX()
MIN()


SELECT category, COUNT(category) FROM items GROUP BY category;

## I want all items which is min price in each category

SELECT
  name, category, min(price) 
FROM items 
GROUP BY category
ORDER BY min(price);

- diff btw where and having ?
	- In where we cannot use AGGREGATE Func for condition
	- We can achieve that in HAVING.

- can we use aggregate func in WHERE ?
	- No
- what is LIKE operator ?
	- used to search for a pattern in a column. 
	- wildcards
		- %  -> matches zero or more characters
		- _  -> matches exactly one character

	SELECT * from users WHERE email LIKE '%gmail.com';

	'%gmail.com'  ends with gmail.com
	'a%'          starts with 'a'
	'%a%'         if 'a' present inside the text
	`_a%`			  where 2nd char is 'a'

- Diff btw = and LIKE ?
	- =    exact matching	| faster
	- LIKE pattern matching | slower 
- what is IN operator ?
	- used to check multiple values in a col.
	- alternate for OR conditions.
	`SELECT * from users where id IN (5,10,11);`
	`SELECT * from users where id NOT IN (5,10,11);`

- what is BETWEEN ?
	- `SELECT * from users where id >= 5 and id <= 10`;
	- `SELECT * from users where id BETWEEN 5 and 10;`
	- `SELECT * from users where id NOT BETWEEN 5 and 10;`

- how to find records starting with 'A' ?
	LIKE 'A%'
- how to find records ending with 'n' ?
	LIKE '%n'
- how to find records containing 'sql' ?
	LIKE '%sql%'



28. `count(*)` vs count(col)

- `count(*)`   count all the rows
- count(col)   ignores NULL

mysql> select * from department;
+----+------+-----------+---------+
| id | name | hod       | ranking |
+----+------+-----------+---------+
|  1 | CSE  | Hemalatha |     4.5 |
|  2 | IT   | Suresh    |     3.9 |
+----+------+-----------+---------+
2 rows in set (0.00 sec)

mysql> UPDATE department SET hod = NULL  where id = 2;
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from department;
+----+------+-----------+---------+
| id | name | hod       | ranking |
+----+------+-----------+---------+
|  1 | CSE  | Hemalatha |     4.5 |
|  2 | IT   | NULL      |     3.9 |
+----+------+-----------+---------+
2 rows in set (0.00 sec)

# GROUP BY
	- used to group rows with same values

# GROUP BY without aggregation ?
	- YES 

# Employees per deprtment
`SELECT dept_id, count(*) FROM emp GROUP BY dept_id;`

# dept with >5 employess
`SELECT dept_id, count(*) FROM emp GROUP BY dept_id HAVING count(*) > 5;`


## JOINS

- what is join ?
	- combines data from multiple tables
- types of join ?
	- inner, left, right, full, self
- INNER JOIN vs LEFT JOIN ?
	- inner : common records
	- left  : all left + matching right
- LEFT vs RIGHT ?
	- Directions of table priority
- FULL OUTER JOIN ?
	- All records from both tables.
- SELF JOIN ?
	- table joins with itself.

CREATE TABLE department (
	dept_id INT PRIMARY KEY AUTO_INCREMENT,
	dept_name VARCHAR(200) NOT NULL
);
CREATE TABLE student (
	student_id INT PRIMARY KEY AUTO_INCREMENT,
	student_name varchar(200),
	dept_id int,
	foreign key (dept_id) references department(dept_id)
);

INSERT INTO department 
	(dept_name)
VALUES 
	('IT'),
	('CSE'),
	('MECH'),
	('ECE');

INSERT INTO student 
	(student_name, dept_id)
VALUES
	('Ravi', 1),
	('Priya', 2),
	('Kiran', 1),
	('Neha', NULL),
	('Arjun', 5);

mysql> select * from department;
+---------+-----------+
| dept_id | dept_name |
+---------+-----------+
|       1 | IT        |
|       2 | CSE       |
|       3 | MECH      |
|       4 | ECE       |
+---------+-----------+

mysql> select * from student;
+------------+--------------+---------+
| student_id | student_name | dept_id |
+------------+--------------+---------+
|          1 | Ravi         |       1 |
|          2 | Priya        |       2 |
|          3 | Kiran        |       1 |
|          4 | Neha         |    NULL |
|          5 | Arjun        |       5 |
+------------+--------------+---------+

MAJOR JOINS
- INNER, LEFT, RIGHT, FULL JOIN

### INNER JOIN ( COMMON VALUES btw 2 tables )

SELECT      
	 s.student_name, s.dept_id, d.dept_name
FROM student AS s 
INNER JOIN department as d
ON d.dept_id = s.dept_id;


### LEFT JOIN ( priority goes to left table )
- first pick all left table rows, then its matching rows

SELECT      
	 s.student_name, s.dept_id, d.dept_name
FROM student AS s 
LEFT JOIN department as d
ON d.dept_id = s.dept_id;

### RIGHT JOIN ( priority goes to right table )
- first pick all right table rows, then its matching rows


SELECT      
	 s.student_name, s.dept_id, d.dept_name
FROM student AS s 
RIGHT JOIN department as d
ON d.dept_id = s.dept_id;

### FULL JOIN ( MYSQL does'nt support FULL JOIN. )

INNER 	: common data
LEFT 	: all students
RIGHT 	: all departments
FULL    : EVERYTHING


## SUB-QUERY

- What is subquery ?
	- query inside another query.
- Subquery vs Join ?
	- subquery is nested, join is flat.
- Can return multiple rows ?
	- yes
- subquery in WHERE ?
	- `WHERE salary > (SELECT AVG(salary) FROM emp)`

# FIND HIGHEST PRICE ( USAGE OF SUB-QUERY )

SELECT 
	name, category, price
FROM items
ORDER BY price 
LIMIT 1;


- BELOW QUERY we have a wrong value.
- it find max of price and display first row. 

SELECT
	name, category, max(price)
FROM items;

- we solve above issue with subquery.

SELECT 
	name, category, price 
FROM items
WHERE price = ( SELECT max(price) FROM items );

# FIND SECOND HIGHEST priced items.

SELECT
	name, category, price 
FROM items
ORDER BY price DESC
LIMIT 1
OFFSET 1;

SELECT 
	max(price) 
FROM items
WHERE price < ( SELECT max(price) FROM items );
