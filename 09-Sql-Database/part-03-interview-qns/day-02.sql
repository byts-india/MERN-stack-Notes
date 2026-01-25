
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


-- 11. Find employees who don't have managers

SELECT * FROM employees
WHERE manager_id IS NULL;

-- 12. Fetch employee and their manager name

SELECT
    e.name as employee,
    m.name as manager 
FROM employees as e
JOIN employees as m
ON e.manager_id = m.id;

-- 13. Find employees earning more than their manager.

SELECT
    e.name as employee,
    e.salary as employee_salary,
    m.name as manager,
    m.salary as manager_salary 
FROM employees as e
JOIN employees as m
ON e.manager_id = m.id 
WHERE e.salary > m.salary;

-- 14. Get total salary department-wise.

SELECT 
    dept_id, sum(salary)
FROM employees
GROUP BY dept_id;

-- 15. Find employees joined in last 30 days.

SELECT *
FROM employees
WHERE joining_date >= CURDATE() - INTERVAL 30 DAY;

-- 16. Find customers who placed more than 1 orders.

SELECT customer_id
FROM orders
GROUP BY customer_id
HAVING COUNT(*) > 1;

-- 17. Find total order amount per customer.

SELECT 
    customer_id, SUM(amount) AS total_spent
FROM orders
GROUP BY customer_id;

-- 18. Find highest order amount. 

SELECT MAX(amount) FROM orders;

-- 19. Fetch orders placed in current month.

SELECT *
FROM orders
WHERE 
    MONTH(order_date) = MONTH(CURDATE()) AND
    YEAR(order_date) = YEAR(CURDATE());

-- 20. Find customers who never placed an order.

CREATE TABLE customers (
    id      INT         PRIMARY KEY AUTO_INCREMENT,
    name    VARCHAR(50)
);

INSERT INTO customers (id, name) VALUES (101 ,'kayal');
INSERT INTO customers (id, name) VALUES (102 ,'khan');
INSERT INTO customers (id, name) VALUES (103 ,'ram');
INSERT INTO customers (id, name) VALUES (104 ,'jothi');

SELECT
    c.name
FROM customers c 
LEFT JOIN orders as o 
ON c.id = o.customer_id
WHERE o.id IS NULL;


-- 21. Find top 3 highest scoring students

SELECT * FROM students
ORDER BY marks DESC
LIMIT 3;

-- 22. Update all students marks by +5

UPDATE students SET marks = marks + 5;

-- 23. Find students whose name starts with 'A'

SELECT * FROM students WHERE name LIKE 'A%';

-- 24. Find students whose name contains 'an'

SELECT * FROM students WHERE name LIKE '%an%';

-- 25. Find students btw marks 60 and 80

SELECT * FROM students WHERE marks BETWEEN 60 AND 80;

-- 26. Find count of students per year.

SELECT 
    YEAR(created_at) AS year,
    COUNT(*)         AS count
FROM students
GROUP BY YEAR(created_at);

-- 27. Find students who scored same marks

SELECT
 marks,
 count(*)
FROM students
GROUP BY marks
HAVING COUNT(*) > 1;

-- 28. Fetch last inserted student

SELECT * FROM students ORDER BY created_at DESC LIMIT 1; 

-- 29. Create index on student name

CREATE INDEX idx_student ON students(name);

-- 30. Remove all records but keep table

TRUNCATE TABLE students;