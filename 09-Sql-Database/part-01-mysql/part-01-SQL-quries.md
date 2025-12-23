# basic topics

## query basics

- select
- where
- and or not
- order by
- limit
- distinct
- as
- comments
  - single line `--`
  - multi line `/* */`

## DML

- insert into
- insert into values
- insert into select
- update
- delete
- truncate

## null handling

- null values
- is null
- is not null
- ifNull()
- coalesce()
- nullif()

## filtering & conditions

- Comparison operators
  - `=, !=, <, >, <=, >=`
  - `AND, OR, NOT`
  - in
  - between
  - like
    - wildcard (`%`, `_`)
    - Regular expression

## advance conditions

- exists
- any
- all
- sub queries

## aggregation

- count()
- sum()
- avg()
- min()
- max()

## clauses with aggregation

- group by
- having

## JOIN TABLES

- INNER JOIN
- LEFT JOIN
- RIGHT JOIN
- CROSS JOIN

## Join concepts

- Joining multiple tables
- Join conditions
- Cartesian product
- Join vs Subquery

## SET OPERATIONS

- UNION
- UNION ALL

## DDL

- create database
- drop database
- use database

## table

- create table
- drop table
- alter table
  - add column
  - modify column
  - drop column
  - rename column

## constraints & keys

- not null
- unique
- primary key
- foreign key
- check
- default

## keys type

- primary key
- foreign key
- composite key
- candidate key

## index & performance

- create index
- drop index
- unique index
- composite index
- index vs primary key
- when to use index

## data types

- Numberic: int, bigint, float, decimal
- string: char, varchar, text
- date & time: date, datetime, timestamp, time
- boolean : boolean, tinyint(1)

## AUTO

- auto_increment
- default timestamp
- date functions `now(), curdate(), datediff()`

## user management

- create user
- drop user
- alter user
- password management

## grant privileges

- grant
- revoke
- roles
- database - level privileges
- table - level privileges

## SOME FAMOUS QUIZ

- SQL vs MySQL
- GROUP BY vs ORDER BY
- WHERE vs HAVING
- DELETE vs TRUNCATE
- JOIN vs Subquery

## advance topics

- transactions
  - commit
  - rollback
  - savepoint
- ACID properties
- normalization `1nf, 2nf, 3nf`
- denormalization
- backup & restore ( basic )
