# normalization

Normalization is the process of organizing data in a database to

- reduce data redundancy
- avoid data anomalies
- improve data integrity

Problems solved by normalization:

- Insertion anomaly ( abnormal )
- Update anomaly
- Deletion anomaly

Goal:

- Split large tables into smaller tables
- Establish proper relationships using keys

---

## 1nf

1. Each field contains atomic (indivisible) values
2. No multi-valued attributes
3. Each record can be uniquely identified

| student_id | name | phone                  |
| ---------- | ---- | ---------------------- |
| 1          | revi | 9876212311, 1111122222 |

-> convert to 1nf

| student_id | name | phone      |
| ---------- | ---- | ---------- |
| 1          | revi | 9876212311 |
| 1          | revi | 1111122222 |

## 2NF

1. It is already in 1NF
2. No partial dependency
   - Non-key attribute should depend on the whole primary key

| StudentID | CourseID | StudentName | CourseName |
| --------- | -------- | ----------- | ---------- |
| 1         | C1       | Ravi        | DBMS       |

-> convert to 2nf

- splits into 3 tables
- table 01: student table

| StudentID | name |
| --------- | ---- |
| 1         | Ravi |

- table 02: course table

| courseID | name |
| -------- | ---- |
| c1       | DBMS |

- table 03: enrollment table

| studentID | courseID |
| --------- | -------- |
| 1         | c1       |

## 3nf

1. It is already in 2NF
2. No transitive dependency : Non-key attribute should not depend on another non-key attribute

| stuID | StuName | DeptID | DeptName |
| ----- | ------- | ------ | -------- |
| 1     | ravi    | 1      | cse      |
| 2     | ramu    | 2      | ece      |
| 3     | somu    | 1      | cse      |
| 4     | raju    | 2      | ece      |

-> convert to 3nf

- split to 2 table
- 1.  employee table
- 2.  department table

| EmpID | EmpName | DeptID |
| ----- | ------- | ------ |
| 1     | ravi    | 1      |
| 2     | ramu    | 2      |
| 3     | somu    | 1      |
| 4     | raju    | 2      |

| DeptID | DeptName |
| ------ | -------- |
| 1      | cse      |
| 2      | ece      |

## BCNF Boyce–Codd Normal Form

- It is in 3NF
- For every functional dependency A → B,
  A must be a super key

### what is functionality dependency

- A Functional Dependency is a relationship between two sets of attributes in a table where one attribute uniquely determines another attribute.
- `A → B`
- A determines B
- For every value of A, there is only one value of B
- If you know A, you can uniquely find B.
- RollNo → StudentName
  - If RollNo is 101, the StudentName will always be the same
  - So, StudentName depends on RollNo

| StudentID | Course | Instructor |
| --------- | ------ | ---------- |
| S1        | DBMS   | Ravi       |
| S1        | OS     | Kumar      |
| S2        | DBMS   | Ravi       |
| S3        | OS     | Kumar      |

#### step 01 : Identify Functional Dependencies

From real-world rules:

1. A student can take many courses
1. Each course is handled by only one instructor

So the functional dependencies are:

- (StudentID, Course) → Instructor
- Course → Instructor

#### step 02: Find Candidate Key

- (StudentID, Course) uniquely identifies each row.
- Candidate Key = (StudentID, Course)

#### Step 3: Check BCNF Condition

- BCNF Rule:
- For every functional dependency X → Y, X must be a super key

| Functional Dependency            | Is LHS Super Key? | Status         |
| -------------------------------- | ----------------- | -------------- |
| (StudentID, Course) → Instructor | ✅ Yes            | OK             |
| Course → Instructor              | ❌ No             | BCNF violation |

split into 2 tables:

- course-instructor
- student-course

| Course | Instructor |
| ------ | ---------- |
| DBMS   | Ravi       |
| OS     | Kumar      |

| StudentID | Course |
| --------- | ------ |
| S1        | DBMS   |
| S1        | OS     |
| S2        | DBMS   |
| S3        | OS     |

Earlier, instructor name was repeating for each student.
After BCNF, instructor details are stored only once, and students are linked using course.
