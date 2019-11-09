<img src="https://raw.githubusercontent.com/yemrekeskin/sql-lessons/master/T-SQL%20Training%20Material/icon.png" width="50" height="50"> 

# SQL Lessons - Training Materials

This repo contains sample querying exercises, examples, huge data files and training materials with transact-SQL on microsoft **ms-sql** server

## Curriculum

* Introduction to T-SQL
* Schema 
    - CREATE SCHEMA
    - DROP SCHEMA
* Database 
    - CREATE DATABASE
    - DROP DATABASE
* Table
    - CREATE/ALTER/DROP TABLE
    - TRUNCATE TABLE
* Data Manipulations
    - INSERT INTO = INSERT
    - SELECT 
    - DELETE
    - UPDATE
    - WHERE
    - INSERT INTO SELECT
    - SELECT INTO
* SQL Operators
    - Arithmetic Operators ➥  + - * / %
    - Bitwise Operators ➥ & | ^
    - Comparison Operators ➥ = != < > <= >= <>
    - Compound Operators ➥ += -= *= /= %=
    - Logical Operators ➥ AND, OR, BETWEEN, IN, LIKE, NOT, ALL, ANY, SOME
* MS-SQL Functions
* Aggregate Functions
    - AVG, COUNT, SUM, MIN, MAX
* Grouping Statements
    - GROUP BY
    - HAVING
* Constrait 
    - NULL / NOT NULL
    - UNIQUE
    - CHECK
    - DEFAULT
    - PRIMARY KEY - IDENTITY(1,1)
    - FOREIGN KEY - CASCADE, SET NULL
* Sub-Query
* Joins
    - FULL OUTER JOIN = FULL JOIN
    - LEFT OUTER JOIN = LEFT JOIN
    - RIGHT OUTER JOIN = RIGHT JOIN
    - CROSS JOIN
    - INNER JOIN
    - SELF JOIN
* View
    - CREATE VIEW AS 
    - ALTER VIEW AS
    - DROP VIEW
* Programmatic Concepts
    - DECLARE @, SET, SELECT, PRINT
    - BEGIN - END
    - IF, IF-ELSE, IF-ELSE IF-ELSE
    - WHILE - BREAK - CONTINUE
    - CASE - WHEN THEN - ELSE END
    - CURSOR
* Function
    - Inline Functions
        - RETURN TABLE
    - Scalar-Value Functions
        - RETURN TABLE
* Stored Procedure
    - CREATE/ALTER/DROP PROC
    - PROC = PROCEDURE
    - Set default value
    - Input/Output parameters
    - RETURN
    - EXEC = EXECUTE
* Trigger
    - DDL TRIGGER
        - AFTER/FOR DROP_TABLE,DROP_PROCEDURE, CREATE_FUNCTION 
        - ON DATABASE
    - DML TRIGGER 
        - AFTER/FOR INSERT,DELETE,UPDATE
        - INSERTED - DELETED TABLE
        - UPDATED = DELETED + INSERTED
        - INSTEAD OF INSERT
    - ENABLE-DISABLE TRIGGER
* Index
* Transactions
    - TRAN = TRANSACTION
    - BEGIN TRAN
    - COMMIT - COMMIT TRAN
    - ROLLBACK - ROLLBACK TRAN
    - SAVE TRAN 
    - NESTED TRANSACTIONS

## Sample Databases

You can find sample databases (Northwind, Adventure-Works, Pubs) for Microsoft's SQL databases by this [link](https://github.com/microsoft/sql-server-samples/tree/master/samples/databases) 


## Sample Data

- [Excel 1](https://www.dropbox.com/s/da2g7xag0ddc7q1/SampleData_1055751.csv?dl=0) - 800.000 sample records 
- [Excel 2](https://www.dropbox.com/s/i7om2owu6uvy8tx/SampleData_766454.csv?dl=0) - 1.200.000 sample records 

## Useful Links

- [Transact-SQL Reference](https://docs.microsoft.com/en-us/sql/t-sql/language-reference?view=sql-server-ver15) 
- [W3Schools SQL Tutorial](https://www.w3schools.com/sql/default.asp)
- [Tutorialspoint SQL Tutorial](https://www.tutorialspoint.com/sql/index.htm)
- [Geeksforgeeks SQL Tutorial](https://www.geeksforgeeks.org/sql-tutorial/)
