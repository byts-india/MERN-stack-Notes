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