
TABLES

# DELETE TABLE
DROP TABLE tb_name;

# REMOVE CONTENT

## below code will reset auto_incr
TRUNCATE TABLE tb_name;             

## below code won't reset auto_incr
DELETE FROM student WHERE id > 0;

# SCENARIO BASED QUESTION

4 tables

## LIST OF COMMANDS TYPES

- DDL
- DML
- DCL
- TCL


## DDL Data definition lang

- DDL commands are used to define, modify and delete database
  structures such as databases, table, indexes, view etc.
- These commands change schema and are usually auto-commit
  in mysql.

### USAGE
    - creating database objects
    - modifying structures
    - removing objects

>>> DDL commands are auto-comit ( YES )
>>> Changes cannot be rolled back

### DDL COMMANDS
1. CREATE
    - `CREATE DATABASE college;`
    - `CREATE DATABASE IF NOT EXISTS college;`
    - `CREATE TABLE IF NOT EXISTS student ( id INT PRIMARY KEY AUTO_INCREMENT, age INT ); `
    - create table from another table.
     - ` CREATE TABLE student_backup AS SELECT * FROM students;`
     - constraints are not copied.
2. ALTER
    - Used to modify table structures

```sql
-- ADD COLUMNS
ALTER TABLE students ADD address VARCHAR(40);

ALTER TABLE students
ADD city VARCHAR(50) NOT NULL,
ADD email VARCHAR(100) UNIQUE,
ADD pincode INT DEFAULT 0;

-- MODIFY COLUMNS

ALTER TABLE students MODIFY name VARCHAR(100);

-- CHANGE COLUMN NAME

ALTER TABLE students CHANGE name first_name VARCHAR(100);

-- DROP COLUMN

ALTER TABLE students DROP address;

-- ADD CONSTRAINTS

ALTER TABLE students ADD PRIMARY KEY (id);
ALTER TABLE students ADD UNIQUE (email);

ALTER TABLE students ADD CONSTRAINT fk_dept
 FOREIGN KEY (dept_id) REFERENCES department(id);

ALTER TABLE students DROP PRIMARY KEY;
ALTER TABLE students DROP FOREIGN KEY fk_dept;
```
3. DROP

- used to permanently delete objects.

```sql
DROP TABLE students;
DROP TABLE IF EXISTS students;
DROP DATABASE college;
DROP DATABASE IF EXISTS college;

DROP INDEX idx_student_name ON students;
```

4. TRUNCATE
- Used to delete all records but keep structure.
- faster than delete
- cannot use WHERE
- RESETS AUTO_INCREMENT
- Cannot be rolled back.

```sql
TRUNCATE TABLE students;
```

+-----+---------------+-----------------+---------------------+
| sno | features      | drop            | truncate          |
+-----+---------------+-----------------+---------------------+
| 1   | structure     | removed         | remains             |
| 2   | data          | removed         | removed             |
| 2   | AUTO_INCR...  | removed         | reset               |
| 3   | rollback      | No              | no                  |
+-----+---------------+-----------------+---------------------+


5. RENAME

- RENAME A TABLE
- what happens when you rename
    - table structure remains same
    - data remains unchanged
    - indexes remain
    - constraints remain
    - auto_increment value remains
    - only the table name changes
- MySql does not support RENAME database;

```sql
RENAME TABLE students TO learners;
ALTER TABLE students RENAME TO learners;

RENAME TABLE students TO learners, department TO dept;
```



## DML ( DATA MANIPULATION LANG )

- DML are used to insert, update, retrive, and deletedata 
  inside database tables.
- DML works on existing table data, not on structure.

1. INSERT
    
```sql
-- insert single row
-- * ordrer of values must match table columns
INSERT INTO students VALUES (1, 'hari', 'CSE');

-- Insert with column names ( recommended )
--  Safe | readable | order dependent
INSERT INTO students ( id, name, dept_id )
VALUES 
    (1,'Rahul',2),
    (2,'Mownish',3);

INSERT INTO marks (id, marks) SELECT id, marks FROM students;
INSERT INTO students (id, name, dept) VALUES (5, NULL, 'CIVIL');
-- 

```

2. SELECT
3. UPDATE
```sql
-- Dangerous ( no WHERE )
UPDATE students SET dept = 'IT';
-- With where
UPDATE students SET dept = 'IT' WHERE id IN (1,4,12);
UPDATE students SET name = 'Arjun', dept = 'ECE' WHERE id = 3;
-- with sub query
UPDATE students SET dept = 'CSE' WHERE id IN ( SELECT id FROM toppers );
```
4. DELETE ALL ROWS
- Table remain
- Can be rolled back ( if transaction supported )
```sql
-- DELETE all rows
DELETE FROM students;
-- DELETE USING SUB-QUERIES
DELETE FROM students
    WHERE id IN  (SELECT id FROM alumni);
```

# DCL ( Data Control Language )

- DCL commands are used to control access and permissions on database object.s
- mostly used by DBA ( database administrators ) / Admin, not normal users.

## two commands

- `GRANT`
- `REVOKE`

1. GRANT

```sql
GRANT SELECT ON students TO user1;
-- alreay one user called user1.
-- we are providing READ access to this user1
-- ON ( students ) table.
-- INSERT, UPDATE, DELETE

-- MULTIPLE privileges
GRANT SELECT, INSERT, UPDATE ON students TO user1;

-- GRANT ALL 
GRANT ALL PRIVILEGES ON students TO user1;

-- DB LEVEL ACCESS
GRANT ALL PRIVILEGES ON college_db.* TO user1;

-- SCENARIO
-- - you are the only admin.
--   want to create another admin and grant permission 
GRANT SELECT ON students TO admin1 WITH GRANT OPTION;
```
2. REVOKE

- used to remove permissions

```sql
REVOKE SELECT ON students FROM user1;
REVOKE UPDATE ON students FROM user1;
REVOKE ALL PRIVILEGES ON students FROM user1;
GRANT SELECT ON students TO admin1 WITH GRANT OPTION;
REVOKE GRANT OPTION ON students FROM admin1;
```

3. COMMON PREVILGES IN MYSQL LIST

SELECT      - read data
INSERT      - add data
UPDATE      - modify data
DELETE      - remove data
CREATE      - create object
DROP        - delete object
ALTER       - modify structure
INDEX       - CREATE index
ALL         - all privileges

## HOW TO CREATE NEW USERS ?

```sql
-- CREATE A new user (user1) BY password ( pass@123 )
-- <localhost>  : access within the machine
-- ip address   : access within from the ip address
-- %            : access from anywhere.

CREATE USER 'user1'@'localhost' IDENTIFIED BY 'pass@123';
CREATE USER 'user2'@'172.12.21.22' IDENTIFIED BY 'pass@123';
CREATE USER 'user3'@'%' IDENTIFIED BY 'pass@123';

-- create user without password.
CREATE USER 'user4'@'localhost';
/**
 * Not recommended
 * Mostly asked as a theory questions
 * **/

-- after creating do save changes
FLUSH PRIVILEGES;
```
## login as a root user, give password
> mysql -u root -p
## login as a user1.
> mysql -u user1 -p

## TCL ( Transaction control lang )

1. COMMIT
2. ROLLBACK
3. SAVEPOINT
4. SET AUTOCOMMIT

1. COMMIT

- permanently saves all changes made in the transactions.
- cannot rollback after commit 

2. ROLLBACK

- reverts changes
- Works only before commit 

3. SAVEPOINT

- `SAVEPOINT sp1;`

4. ROLLBACK to SAVEPOINT

- `ROLLBACK TO sp1;`
- `RELEASE SAVEPOINT sp1;`

5. SET AUTOCOMMIT

- `SET AUTOCOMMIT = 0;  -- TURN OFF AUTOCOMMIT`
- `SET AUTOCOMMIT = 1;  -- TURN ON  AUTOCOMMIT`

```sql
SET AUTOCOMMIT = 0;

UPDATE students SET marks = 45 WHERE id = 1;
SAVEPOINT s1;

UPDATE students SET marks = 95 WHERE id = 1;
ROLLBACK TO s1;

COMMIT;

SET AUTOCOMMIT = 1;
```

## ACID properties ( MUST - KNOW )

A - Atomicity    - All or nothing
C - Consistency  - valid state
I - Isolation    - No interferences
D - Durability   - Data persists

### How we achieve ACID properties ?
- TCL helps enforce Atomicity & durability
