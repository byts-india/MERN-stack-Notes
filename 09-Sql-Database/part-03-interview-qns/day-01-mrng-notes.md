# TIPS
- don't any extra / don't overreact.
- give ans of only what is asked ?

# WHAT IS SQL ? ( Structured query language )
- SQL is used to store, retrive,
and manipulate data in relational
databases.

# WHAT IS A TABLE ?
- Table is a structured format for rows
and columns used to store related data.
- rows      => records
- columns   => attributes

# what is database ?
- database is an organized collections of data
  that can be easily accessed and managed.

# difference btw
- database  : collection of related table
- tables    : structured data in rows and columns
- rows      : represents one complete record
- column    : represents a specific attributes

`TIPS: if interviewere interrupts you`
`it means answer is correct.`

# TYPES OF SQL COMMANDS ?
- DDL -> Data Definition language
    CREATE, ALTER, DROP
- DML -> Data manipulation language
    INSERT, UPDATE, DELETE
- DQL -> Data query language
    Used for fetching data

`TIPS: If you forget any FUll forms, give some eg.`

# SYNTAX

- single line comments starts with '--'
- multi line start with `/**` and ends with `**/`
- SQL is not case sensitive.
 eg: SELECT * FROM students;   <-- correct
     select * from studetns;   <-- correct

## DATABASES

mysql> SHOW DATBASES;
+--------------------------+
| Database                 |
+--------------------------+
| pvp_class                |
+--------------------------+
mysql> DROP DATABASE pvp_class;
Query OK, 0 rows affected (0.04 sec)
mysql> DROP DATABASE pvp_class;
ERROR 1008 (HY000): Can't drop database 'pvp_class'; database doesn't exist
mysql> CREATE DATABASE pvp_class;
Query OK, 1 row affected (0.01 sec)
mysql> CREATE DATABASE cartoons;
Query OK, 1 row affected (0.01 sec)
mysql> SHOW DATBASES;
+--------------------------+
| Database                 |
+--------------------------+
| cartoons                 |
| pvp_class                |
+--------------------------+
mysql> USE pvp_class;
Database changed
mysql> use temp;
ERROR 1049 (42000): Unknown database 'temp'
### HOW TO KNOW WHICH DATABASE I AM USING ?
mysql> SELECT DATABASE();
+------------+
| database() |
+------------+
| pvp_class  |
+------------+

## TABLES
mysql> SHOW TABLES;
Empty set (0.00 sec)

mysql> CREATE TABLE students (
    roll_no    INT          PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(200) NOT NULL,
    last_name  VARCHAR(200),
    email      VARCHAR(200) UNIQUE,
    phone_no   VARCHAR(200) UNIQUE,
    age        INT  CHECK age > 18,
);
Query OK, 0 rows affected (0.02 sec)

mysql> SHOW TABLES
+---------------------+
| Tables_in_pvp_class |
+---------------------+
| students            |
+---------------------+
1 row in set (0.00 sec)

mysql> DESCRIBE students;
+------------+--------------+------+-----+---------+----------------+
| Field      | Type         | Null | Key | Default | Extra          |
+------------+--------------+------+-----+---------+----------------+
| roll_no    | int          | NO   | PRI | NULL    | auto_increment |
| first_name | varchar(200) | NO   |     | NULL    |                |
| last_name  | varchar(200) | YES  |     | NULL    |                |
| email      | varchar(200) | YES  | UNI | NULL    |                |
| phone_no   | varchar(200) | YES  | UNI | NULL    |                |
+------------+--------------+------+-----+---------+----------------+
5 rows in set (0.02 sec)


# TABLES BASICS

- list all datatypes

- TINYINT       1 byte      small numbers
- SMALLINT      2 bytes     small ranges
- MEDIUMINT     3 bytes     medium ranges
- INT / INTEGER 4 bytes     most common
- BIGINT        8 bytes     very large numbers

`TIPS: INT is most commonly used for IDs.`

- FLOAT         
- DOUBLE  

- CHAR(n)       fixed length
- VARCHAR(n)    variable ln (MOSTLY USED)
- TEXT          large text
- TINYTEXT      very small text
- MEDIUMTEXT    medium text
- LONGTEXT      very large text

`CHAR is fixed lenght, VARCHAR is variable lenght.`

- DATE          YYYY-MM-DD
- TIME          HH:MM:SS
- DATETIME      Date + Time
- TIMESTAMP     Date + time ( auto updte )
- YEAR          Year only

`TIMESTAMP is timezone dependent, DATETIME is not`

- BOOLEAN/BOOL       TRUE / FALSE

`internally BOOLEAN uses TINEYINT(1)`
`MySQL treats BOOLEAN as TINYINT internally`

## 
- BINARY
- VARBINARY
- BLOB
- TINYBLOB
- MEDIUMBLOB
- LONGBLOB

## ENUM

- ENUM('male','female','other')

`Datatypes are categorized into numeric, string, date & time, boolean, binary and special type (ENUM)`


## COMMANDS

C  -> create  ✅
R  -> READ
U  -> UPDATE
D  -> DELETE  ✅

## HOW TO DELETE A TABLE ?

mysql> DROP TABLE marks;

## INSERTING A ROWS in TABLE.


CREATE TABLE marks (
    id          INT         PRIMARY KEY AUTO_INCREMENT,
    roll_no     INTEGER     UNIQUE NOT NULL,
    marks       FLOAT,
    remarks     TEXT,
    gender      ENUM('male','female','other'),
    pass        BOOLEAN,
    updated_at  TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    created_at  TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

## CONSTRAINTS

NOT NULL            - we can't keep null
UNIQUE              - no duplicates values
PRIMARY KEY         - = UNIQUE + NOT NULL
                    - At least one primary key suppose to be there in a table.
FOREIGN KEY         - maintain relationship btw tables
CHECK               - constraints like validations
DEFAULT             - assign default value when null is provided

CREATE TABLE employees (
    emp_id     INT              PRIMARY KEY,
    name       VARCHAR(50)      NOT NULL,
    email      VARCHAR(100)     UNIQUE,
    age        INT              CHECK (age >= 18),
    dept_id    INT,
    status     VARCHAR(20)      DEFAULT 'active',
    created_at TIMESTAMP        DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (dept_id) REFERENCES department(id)
);

CREATE TABLE department (
    dept_id     INT              PRIMARY KEY  AUTO_INCREMENT,
    name        VARCHAR(100)     NOT NULL
);

---------------------------------------------------------------------

mysql> SELECT * FROM department;
Empty set (0.00 sec)

# inserting 1 or more rows and values at a time.

mysql> INSERT INTO department VALUES (1,'ECE'); 
mysql> INSERT INTO department 
            (name, dept_id)  
       VALUES 
            ('CSE',2), 
            ('IT',3), 
            ('EEE',4);
mysql> INSERT INTO department (name) VALUES ('AIML'),('AIDS'),('CSD');

mysql> SELECT * FROM department;
+---------+------+
| dept_id | name |
+---------+------+
|       1 | ECE  |
|       2 | CSE  |
|       3 | IT   |
|       4 | EEE  |
|       5 | AIML |
|       6 | AIDS |
|       7 | CSD  |
+---------+------+
7 rows in set (0.00 sec)

# PRIMARY KEY AND FOREGIN KEY

- PRIMARY KEY    => UNIQUE + NOT NULL
    - at least one column should be there to 
      uniquly identify the row.
- FOREIGN KEY    => 
    - to provide relation between two tables.

CREATE TABLE department (
    id      INT         PRIMARY KEY AUTO_INCREMENT,
    name    VARCHAR(40)        UNIQUE NOT NULL,
    hod     VARCHAR(40) ,
    ranking FLOAT
);

CREATE TABLE students (
    roll_no  INT         PRIMARY KEY AUTO_INCREMENT,
    name     VARCHAR(20) NOT NULL,
    dept_id  INT,
    FOREIGN KEY (dept_id) REFERENCES department(id)
);

INSERT INTO department 
    ( name, hod, ranking )
VALUES
    ( 'CSE', 'Hemalatha', 4.5 ),
    ( 'IT' , 'Suresh'   , 3.9 );

mysql> select * from department;
+----+------+-----------+---------+
| id | name | hod       | ranking |
+----+------+-----------+---------+
|  1 | CSE  | Hemalatha |     4.5 |
|  2 | IT   | Suresh    |     3.9 |
+----+------+-----------+---------+
2 rows in set (0.00 sec)

INSERT INTO students 
    ( name, dept_id )
VALUES 
    ( 'prakash', 1 ),
    ( 'susmitha', 1 ),
    ( 'praveen', 1 ),
    ( 'harish', 2 ),
    ( 'ashika', 3 );

mysql> select * from students;
+---------+----------+---------+
| roll_no | name     | dept_id |
+---------+----------+---------+
|       1 | prakash  |       1 |
|       2 | susmitha |       1 |
|       3 | praveen  |       1 |
|       4 | harish   |       2 |
|       5 | ashika   |       3 |
+---------+----------+---------+

mysql> SELECT s.name, d.name AS dept, d.hod 
            FROM students AS s
            LEFT JOIN department as d 
                ON d.id = s.dept_id;
+----------+------+-----------+
| name     | dept | hod       |
+----------+------+-----------+
| prakash  | CSE  | Hemalatha |
| susmitha | CSE  | Hemalatha |
| praveen  | CSE  | Hemalatha |
| harish   | IT   | Suresh    |
| ashika   | NULL | NULL      |
+----------+------+-----------+
5 rows in set (0.00 sec)