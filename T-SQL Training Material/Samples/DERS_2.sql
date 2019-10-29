
-- DML - Data Manupulation Language
-- SELECT , AS , PRINT

USE Northwind

SELECT 3
SELECT 'YunusEmreKeskin'
SELECT 1,2,3,4
SELECT 'TEST',7

PRINT 'YunusEmreKeskin'


SELECT * FROM dbo.Categories

SELECT * FROM Categories

SELECT CategoryName FROM Categories

SELECT CategoryName AS Kategori FROM Categories
SELECT CategoryName Kategori FROM Categories
SELECT CategoryName [Kategori Adı] FROM Categories

SELECT 'Emre' Ad, 'Keskin' Soyad

SELECT CategoryName + '  ' +CategoryName AS KategoriAdi FROM Categories

SELECT CONVERT(nvarchar,categoryID) + '-' + CategoryName
FROM Categories

SELECT CAST(categoryID as nvarchar) + '-' + CategoryName
FROM Categories

SELECT * 
FROM Categories
WHERE CategoryID = 2

SELECT * 
FROM Categories
WHERE CategoryName = 'Produce'

SELECT * FROM Employees
WHERE ReportsTo > 2

SELECT * FROM Employees
WHERE ReportsTo > 2 AND City = 'London'

SELECT * FROM Employees
WHERE ReportsTo > 2 OR City = 'London'

SELECT * FROM Employees
WHERE (ReportsTo > 2 OR City = 'London') AND TitleOfCourtesy = 'Mr.'

-- = != < > <= >= !> AND OR BETWEEN AND

-- YEAR, DAY, MONTH

SELECT * 
FROM Employees
WHERE YEAR(BirthDate) != 1990

SELECT * 
FROM Employees
WHERE DAY(BirthDate) = 29

SELECT * 
FROM Employees
WHERE YEAR(BirthDate) > 1950 AND YEAR(BirthDate) < 1965

SELECT * FROM Employees
WHERE City = 'Kirkland' OR City = 'London'

SELECT * 
FROM Employees
WHERE YEAR(BirthDate) BETWEEN 1950 AND 1965

SELECT * 
FROM Employees
WHERE City IN('Kirkland','London')

-- IN LIKE %  _ [] [^*] [*-*]

SELECT SPACE(0)

SELECT REPLICATE('125',12)

SELECT FirstName + ' ' + LastName  
FROM Employees
WHERE FirstName LIKE '%an%' 

SELECT FirstName + ' ' + LastName  
FROM Employees
WHERE FirstName LIKE 'n%y' 

SELECT FirstName + ' ' + LastName  
FROM Employees
WHERE FirstName LIKE 'n%an%' 

SELECT FirstName + ' ' + LastName  
FROM Employees
WHERE FirstName LIKE 'a_d%' 

SELECT *
FROM Employees
WHERE FirstName LIKE '[anm]%' 

SELECT *
FROM Employees
WHERE FirstName LIKE '%[d]%' 

SELECT *
FROM Employees
WHERE FirstName LIKE '[a-k]%' 

SELECT *
FROM Employees
WHERE FirstName LIKE '[^an]%' 


--  Eğer veriler içerisinde özel karakterler var ise
-- [] Escape

SELECT * 
FROM Employees WHERE FirstName LIKE '_%'

SELECT * 
FROM Employees WHERE FirstName LIKE '[_]%'

SELECT * 
FROM Employees WHERE FirstName LIKE 'X_%' ESCAPE 'X'

-- ORDER BY

SELECT * FROM Categories
ORDER BY CategoryID -- default asc

SELECT * FROM Categories
ORDER BY CategoryID DESC

SELECT * FROM Categories
ORDER BY 2 DESC

SELECT * FROM dbo.Products
ORDER BY SupplierID, ProductName







------ INSERT - SELECT INTO , INSERT SELECT

SELECT * FROM Northwind.dbo.Employees

INSERT Employees(FirstName, LastName) VALUES ('Yunus Emre','Keskin')

INSERT Employees
VALUES ('Yunus Emre','Keskin','Sales Department','Mr.','08.06.1990',GETDATE(),'Address','Ankara','AN',456,'TR','35416351',123,null,null,null,1)

-- INSERT INTO == INSERT

INSERT Employees(FirstName, LastName) VALUES ('Yunus Emre','Keskin')
INSERT Employees(FirstName, LastName) VALUES ('Yunus Emre','Keskin')
INSERT Employees(FirstName, LastName) VALUES ('Yunus Emre','Keskin')


INSERT Employees(FirstName, LastName) 
VALUES ('Test1','Keskin'),('Test2','Keskin'),('Test3','Keskin')


CREATE TABLE SampleEmployees 
(
	FirstName nvarchar(MAX),
	LastName nvarchar(MAX)
)

INSERT SampleEmployees 
Select FirstName, LastName FROM Employees

SELECT * FROM SampleEmployees


SELECT FirstName,LastName,City INTO EmployeesCity FROM Employees

SELECT * FROM EmployeesCity


USE MyCompany

-- BULK INSERT
BULK INSERT Staff
FROM 'C:\Data.txt'
WITH 
(
	FieldTerminator = '\t',
	RowTerminator = '\n'
)

SELECT * FROM dbo.Staff

-- NULL CONTROL 
USE Northwind

SELECT ContactName,
       Region
FROM Customers


SELECT ContactName,
       CASE 
		WHEN Region IS NULL THEN 'UnKnown Region' ELSE Region
	   END
FROM Customers

-- Coalesce
SELECT ContactName,Coalesce(Region,'UnKnown Region')       
FROM Customers

-- IsNULL
SELECT ContactName, ISNUll(Region,'UnKnown Region')       
FROM Customers


-- NULLIF
-- Fonksiyona verilen kolon, ikinci parametrede verilen değere eşit ise 
-- o kolon null olarak getirir

SELECT NULLIF(0,0)

SELECT NULLIF(0,2)

SELECT UnitsInStock FROM Products
SELECT AVG(UnitsInStock) FROM Products

SELECT AVG(UnitsInStock) FROM Products WHERE UnitsInStock <> 0

SELECT AVG(NULLIF(UnitsInStock,0)) FROM Products



-- BATCH Kavramı
--GO birbirinden bağımsız işlemler için GO kullanılır








-- UPDATE

USE Northwind

SELECT * FROM EmployeesCity

UPDATE Employees 
SET FirstName = 'Ahmet'

UPDATE Employees 
SET FirstName = 'Yunus Emre'
WHERE EmployeeID = 2


SELECT * FROM Products
SELECT * FROM Categories

-- biden falz tabloda güncelleme yapmak
SELECT P.*,C.* 
FROM Products AS P
INNER JOIN Categories AS C
ON P.CategoryID = C.CategoryID


UPDATE Products
SET ProductName = C.CategoryName
FROM Products AS P
INNER JOIN Categories AS C
ON P.CategoryID = C.CategoryID

-- Subquery
SELECT FirstName FROM Employees WHERE EmployeeID = 1
UPDATE Products 
SET ProductName = (SELECT FirstName FROM Employees WHERE EmployeeID = 1)

-- Satır kısıtlaması TOP
UPDATE TOP(10) Products 
SET ProductName = 'XXX ' + ProductName  
WHERE ProductName LIKE 'a%'


-- DELETE 

DELETE FROM Products

DELETE FROM Categories 
WHERE CategoryID = 10

TRUNCATE TABLE Products







































