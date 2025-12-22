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

| student_id | name | phone                        |
| ---------- | ---- | ---------------------------- |
| 1          | revi | 98762121csr12311, 1111122222 |

-> convert to 1nf

| student_id | name | phone            |
| ---------- | ---- | ---------------- |
| 1          | revi | 98762121csr12311 |
| 1          | revi | 1111122222       |

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

1. A student can take many courses.
1. Each course is handled by only one instructor.

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

---

## BEST EXAMPLE to convert from ( 1nf to 3nf )

- `1nf` : `no multi values cells`
  - eg: marks, subjects
- `2nf` : `no partial deps`
  - eg: ( roll_no + subject ) -> marks
  - ( primary key ) <= ( col1 + col2 ) [ composite key ].
- `3nf` : `no transitive deps`
  - A -> B -> C, where `A` is primary key, `B` and `C` is non-key attribute
  - stu_id -> sub -> marks
  - where `sub` and `marks` is not primary key

| roll_no   | name | dept | subject      | marks    |
| --------- | ---- | ---- | ------------ | -------- |
| 121csr123 | ram  | cse  | dbms,os,java | 80,75,40 |
| 121ece124 | raju | ece  | c,os,java    | 80,75,40 |

## 1nf

| roll_no   | name | dept | subject       | marks |
| --------- | ---- | ---- | ------------- | ----- |
| 121csr123 | ram  | cse  | dbms          | 80    |
| 121csr123 | ram  | cse  | os            | 75    |
| 121csr123 | ram  | cse  | java          | 40    |
| 121ece124 | raju | ece  | communication | 80    |
| 121ece124 | raju | ece  | circuits      | 75    |
| 121ece124 | raju | ece  | embedded      | 40    |

# 2nf

- in above table
- partial dependency there.
- eg: student details are repeated.
- so marks details we kept in separate table.

- student table

| roll_no   | name | course |
| --------- | ---- | ------ |
| 121csr123 | ram  | cse    |
| 121ece124 | raju | ece    |

- marks table

| stu_id    | sub           | marks |
| --------- | ------------- | ----- |
| 121csr123 | dbms          | 80    |
| 121csr123 | os            | 75    |
| 121csr123 | java          | 40    |
| 121ece124 | communication | 80    |
| 121ece124 | circuits      | 75    |
| 121ece124 | embedded      | 40    |

# 3nf

- per table -> one primary key.
- transitive dependency: non_key_attrib depends on non_key_attrib to unique identify a row.

- further splitting marks table as
- ( dept, subject, marks )

- dept table

| dept_id | dept_name |
| ------- | --------- |
| d1      | cse       |
| d2      | ece       |

- subject table

| subject_id | dept_id | sub_name      |
| ---------- | ------- | ------------- |
| s1         | d1      | dbms          |
| s2         | d1      | os            |
| s3         | d1      | java          |
| s4         | d2      | communication |
| s5         | d2      | circuits      |
| s6         | d2      | embedded      |

- marks

| sno | stu_id    | dept_id | sub_id | marks |
| --- | --------- | ------- | ------ | ----- |
| 1   | 121csr123 | d1      | s1     | 80    |
| 2   | 121csr123 | d1      | s2     | 75    |
| 3   | 121csr123 | d1      | s3     | 40    |
| 4   | 121ece124 | d2      | s4     | 80    |
| 5   | 121ece124 | d2      | s5     | 75    |
| 6   | 121ece124 | d2      | s6     | 40    |

- student table

| roll_no   | name | dept |
| --------- | ---- | ---- |
| 121csr123 | ram  | d1   |
| 121ece124 | raju | d2   |
