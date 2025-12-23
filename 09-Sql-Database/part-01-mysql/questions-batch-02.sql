-- questions 


CREATE TABLE dept (
    id  INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE student (
    roll_no  INT PRIMARY KEY,
    name VARCHAR(200) NOT NULL,
    email VARCHAR(200) UNIQUE,
    dept_id  INT NOT NULL,
    FOREIGN KEY (dept_id) REFERENCES dept(id)
);

/*
ALTER TABLE student 
ADD CONSTRAINT 
FOREIGN KEY (dept_id) REFERENCES dept(id);
*/



INSERT INTO dept (name) VALUES 
('CSE'),
('ECE'),
('EEE');

SELECT * FROM dept;

SELECT count(*) AS dept_count FROM dept;

INSERT INTO student (roll_no, email, name, dept_id ) VALUES 
 ( 23 , 'chotta@gmail.com','chotta bheem', 1 ),
 ( 34 , 'shin@gmail.com','shin chan', 1 ),
 ( 55 , 'hatori@gmail.com','hatori', 2 ),
 ( 36 , 'jackie@gmail.com','jackie chan', 3 ),
 ( 43 , 'ben@gmail.com','ben tenison', 3 );

-- count no of students in each dept

SELECT dept_id, count(dept_id) as count 
FROM student GROUP BY dept_id;

SELECT 
    d.name AS dept_name, 
    count(s.dept_id) as count 
FROM 
    student AS s 
LEFT JOIN 
    dept as d 
ON s.dept_id = d.id 
GROUP BY s.dept_id;

UPDATE student SET email = NULL 
WHERE roll_no IN (36, 43);

SELECT * FROM student WHERE email IS NOT NULL;

SELECT name, IFNULL(email,"Not available") FROM student;

/* --------------------------------------------------  */

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    UnitPrice DECIMAL(10, 2),
    StockQuantity INT
);

INSERT INTO Products (ProductID, ProductName, Category, UnitPrice, StockQuantity)
VALUES
    (102, 'Smartphone', 'Electronics', 300.00, 200),
    (103, 'Headphones', 'Accessories', 30.00, 500),
    (104, 'Keyboard', 'Accessories', 20.00, 300),
    (105, 'Laptop', 'Electronics', 800.00, 150),
    (106, 'Tablet', 'Electronics', 250.00, 180),
    (107, 'Smartwatch', 'Electronics', 150.00, 220),
    (108, 'Monitor', 'Electronics', 200.00, 120),
    (109, 'Mouse', 'Accessories', 15.00, 600),
    (110, 'Charger', 'Accessories', 25.00, 400),
    (111, 'USB Cable', 'Accessories', 10.00, 1000),
    (112, 'External Hard Drive', 'Electronics', 100.00, 90),
    (113, 'Printer', 'Electronics', 180.00, 75),
    (114, 'Camera', 'Electronics', 500.00, 60),
    (115, 'Tripod', 'Accessories', 40.00, 200),
    (116, 'Speakers', 'Electronics', 120.00, 140),
    (117, 'Router', 'Electronics', 70.00, 160),
    (118, 'Power Bank', 'Accessories', 35.00, 350),
    (119, 'Microphone', 'Accessories', 80.00, 110),
    (120, 'VR Headset', 'Electronics', 400.00, 50),
    (121, 'Gaming Console', 'Electronics', 450.00, 80);


SELECT Category, sum(UnitPrice) FROM products
group by category;

SELECT * FROM products limit 5 offset 10;

SELECT ProductName, UnitPrice FROM products
WHERE UnitPrice <= 100;

SELECT ProductName, UnitPrice, StockQuantity FROM products
WHERE UnitPrice <= 100 OR (NOT StockQuantity > 200)
ORDER BY UnitPrice DESC;

SELECT ProductName, UnitPrice FROM products
ORDER BY UnitPrice DESC limit 5;

-- 

CREATE TABLE Marks (
    StudentID INT NOT NULL,
    SubjectName VARCHAR(50) NOT NULL,
    Mark INT NOT NULL,
    PRIMARY KEY (StudentID, SubjectName) -- Composite primary key for unique records
);

INSERT INTO Marks (StudentID, SubjectName, Mark)
VALUES
    (1, 'Math', 85),
    (1, 'Science', 72),
    (1, 'English', 90),
    (1, 'History', 70),
    (2, 'Math', 91),
    (2, 'Science', 78),
    (2, 'English', 88),
    (2, 'History', 65),
    (3, 'Math', 76),
    (3, 'Science', 82),
    (3, 'English', 92),
    (3, 'History', 80),
    (4, 'Math', 69),
    (4, 'Science', 74),
    (4, 'English', 85),
    (4, 'History', 77),
    (5, 'Math', 95),
    (5, 'Science', 89),
    (5, 'English', 93),
    (5, 'History', 84);


SELECT * FROM marks
WHERE mark BETWEEN 80 AND 90
ORDER BY mark;

SELECT * FROM marks
WHERE subjectName LIKE 's%';

select studentid, max(mark) from marks;

select avg(mark) from marks;

-- SUB QUERY

SELECT 
    studentid, 
    mark 
FROM marks
WHERE
mark > ( select avg(mark) from marks );

