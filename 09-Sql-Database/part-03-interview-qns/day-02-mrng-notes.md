
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

> students

CREATE DATABASE test_db;
USE test_db;


-- 1. Create Departments (Must be first due to foreign key in students)

CREATE TABLE departments (
    id          INT PRIMARY KEY,
    dept_name   VARCHAR(30)
);

-- 2. Create Students
CREATE TABLE students (
    id          INT PRIMARY KEY AUTO_INCREMENT,
    name        VARCHAR(40) NOT NULL,
    dept_id     INT,
    marks       INT,
    created_at  TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (dept_id) REFERENCES departments(id)
);

-- 3. Create Employees
CREATE TABLE employees (
    id           INT PRIMARY KEY AUTO_INCREMENT,
    name         VARCHAR(50),
    manager_id   INT, -- Self-referencing hierarchy usually
    salary       FLOAT,
    joining_date DATETIME
);

-- 4. Create Orders
CREATE TABLE orders (
    id           INT PRIMARY KEY AUTO_INCREMENT,
    customer_id  INT,
    amount       FLOAT,
    order_date   DATETIME
);



-- Insert into Departments
INSERT INTO departments (id, dept_name) VALUES 
(1, 'Computer Science'),
(2, 'Mathematics'),
(3, 'Physics'),
(4, 'Literature');

-- Insert into Students
-- Note: dept_id must match an id from the departments table
INSERT INTO students (name, dept_id, marks) VALUES 
('Alice Johnson', 1, 88),
('Bob Smith', 1, 75),
('Charlie Brown', 2, 92),
('Diana Prince', 3, 81),
('Evan Wright', 2, 65);

-- Insert into Employees
-- We insert a "Manager" first, then employees who report to them
INSERT INTO employees (name, manager_id, salary, joining_date) VALUES 
('Sarah Connor', NULL, 95000.00, '2020-01-15 09:00:00'), -- The Boss (ID 1)
('Kyle Reese', 1, 65000.00, '2021-03-10 09:00:00'),      -- Reports to ID 1
('John Doe', 1, 62000.00, '2021-04-22 09:30:00'),        -- Reports to ID 1
('Jane Smith', 2, 48000.00, '2023-06-01 10:00:00');      -- Reports to ID 2

-- Insert into Orders
INSERT INTO orders (customer_id, amount, order_date) VALUES 
(101, 150.50, '2023-10-01 14:30:00'),
(102, 299.99, '2023-10-02 10:15:00'),
(101, 45.00,  '2023-10-03 09:45:00'),
(103, 1200.00, '2023-10-05 16:20:00');


SELECT * FROM departments;
SELECT * FROM students;
SELECT * FROM employees;
SELECT * FROM orders;


## 1. Find students who scored more than average marks.


SELECT * FROM students
WHERE marks > (SELECT AVG(marks) FROM students);