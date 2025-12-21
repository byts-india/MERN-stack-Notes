# SQL BASICS

## 4 types of commands

- DDL
- DML
- DCL
- TCL

## explanation

- DDL - Data Definition Language
  - Create
  - Drop
  - Alter
  - Truncate
  - Rename
- DML - Data Manipulation Language
  - Insert
  - Update
  - Delete
  - Select
- DCL - Data Control Language
  - Grant
  - Revoke
- TCL - Transaction control language
  - Commit
  - Rollback
  - Save point

## ACID Properties

- Acid ensures reliable and safe database transactions.
- Atomicity
  - A mean all or nothing
  - if any part fails, the entire transaction is rolled back.
  - no partial updates
  - eg: Money debit succeeds but credit fails → debit is undone
- Consistency
  - Database moves from one valid state to another
  - Constraints, rules, and data integrity are preserved
  - eg: Balance cannot become negative if a rule exists
- Isolation
  - Multiple transactions execute independently
  - One transaction’s data is not visible to others until committed
  - eg: Two users updating the same row won’t conflict
- Durability
  - Once committed, data is permanently saved
  - Data survives system crash or power failure
  - eg: Committed order remains even after server restart
- conclusion: ACID guarantees correctness, safety, and reliability of database transactions.

## Data Modeling [ ER modeling ( entity relation ) ]

- Entity
  - strong
  - weak
- attributes
  - simple - age, name
  - composite - address
  - derived - age ( from dob )
  - multi valued - phone number
  - key attribute - roll no
- relation
  - 1:1
  - 1:M
  - M:1
  - M:M
- keys in ER MODEL
  - primary key - unique identifiers
  - composite key - multiple attributes
  - foreign key - references another entity
- Symbols
  - rectangle - entity
  - double rectangle - weak entity
  - oval - attributes
  - underlined oval - primary key
  - diamond - relationship
  - double diamond - identifying relationship
- advantages
  - asy to understand
  - Visual representation
  - Reduces design errors
  - Helps in normalization
- ER to relational model
  - Entity - table
  - attribute - column
  - relationship - foreign key

## Normalization

- DBMS Normalization
- DBMS 1NF
- DBMS 2NF
- DBMS 3NF
- DBMS BCNF
- Functional dependency
- partial Dependency
- transitive Dependency
- normalize the given table up to 3nf
