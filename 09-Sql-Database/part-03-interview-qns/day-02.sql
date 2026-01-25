
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


-- 1. Find students who scored more than average marks.


SELECT * FROM students
WHERE marks > (SELECT AVG(marks) FROM students);

-- 2. Get department wise student count.

SELECT dept_id, count(*) FROM students
GROUP BY dept_id;


-- 3.  Find departments with more than or equal 5 students

SELECT dept_id FROM students
GROUP BY dept_id
HAVING COUNT(*) >= 5;

-- 4.  Fetch student name along with department name.

SELECT
    s.name,
    d.dept_name
FROM students as s 
LEFT JOIN departments as d 
ON d.id = s.dept_id;

-- 5. Find students who don't belong to any department.

UPDATE students SET dept_id = NULL
    WHERE id IN (3,6,10);

-- NULL sometimes won't with '=' | alternate IS NULL
SELECT name FROM students WHERE dept_id = NULL;
SELECT name FROM students WHERE dept_id IS NULL;

-- 6. Get highest marks in each department.
SELECT 
    dept_id, 
    max(marks) AS highest_mark 
FROM students
WHERE dept_id IS NOT NULL
GROUP BY dept_id;

SELECT 
    d.dept_name, 
    max(s.marks) AS highest_mark 
FROM students AS s
LEFT JOIN departments AS d 
ON d.id = s.dept_id
WHERE s.dept_id IS NOT NULL
GROUP BY s.dept_id;

-- 7. Find students who joined today.

SELECT * FROM students
WHERE DATE(created_at) = CURDATE();

-- 8. Find duplicate student names.

SELECT name, COUNT(*)
FROM students
GROUP BY name 
HAVING COUNT(*) > 1;

-- 9. Delete duplicate students ( keep lowest id )

DELETE s1 
FROM students s1
JOIN students s2
ON s1.name = s2.name AND s1.id > s2.id;

-- 10. Find second highest marks

SELECT 
    *
FROM students
ORDER BY marks DESC
LIMIT 1
OFFSET 1;
