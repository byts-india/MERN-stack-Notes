
TABLES

# DELETE TABLE
DROP TABLE tb_name;

# REMOVE CONTENT

## below code will reset auto_incr
TRUNCATE TABLE tb_name;             

## below code won't reset auto_incr
DELETE FROM student WHERE id > 0;