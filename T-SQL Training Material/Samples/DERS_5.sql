
-- UNION
-- Birden fazla select sonucunu tek seferde göstermek için kullanılıt

-- JOIN yan yana, UNION lar alt alta birleştirir
-- JOINLer ilişkili , UNION lar ilişkili değildir
-- UNION kolon isimleri ilk tablonun kolon isimleri olur
-- UNION tabloları kolon sayısı aynı olmalı
-- UNION tablo kolonları benzer veri tipinde olmalı

USE Northwind

SELECT FirstName, LastName FROM Employees
SELECT ContactName,ContactTitle FROM Customers

SELECT FirstName, LastName FROM Employees
UNION
SELECT ContactName,ContactTitle FROM Customers

SELECT FirstName, LastName FROM Employees
UNION
SELECT ContactName,ContactTitle FROM Customers
UNION
SELECT ShipName,ShipAddress  FROM Orders

-- UNION tekrarlı kayıtları getirmez
-- UNION ALL tekrarlı kayıtları getirir

SELECT FirstName,LastName FROM Employees
UNION ALL
SELECT FirstName,LastName FROM Employees

-- INTERSECT 

SELECT * INTO Category_Backup FROM Categories

SELECT * FROM Category_Backup
SELECT * FROM Categories

DELETE FROM Category_Backup WHERE CategoryID IN(1,2,3,4,5)

SELECT CategoryName FROM Categories
INTERSECT
SELECT CategoryName FROM Category_Backup

-- EXCEPT

-- Birinci tablo baz alındığında
SELECT CategoryName FROM Categories 
EXCEPT
SELECT CategoryName FROM Category_Backup

-- İKinci tablo baz alındığında
SELECT CategoryName FROM Category_Backup
EXCEPT
SELECT CategoryName FROM Categories


-- Farklı Veritabanlarındaki tabloları çekmek

SELECT * FROM Northwind.dbo.Categories

SELECT * FROM pubs.dbo.employee


-- WITH TIES -- son satır ile ilişkili olan diğer kayıtları da getirir.

SELECT * FROM [Order Details]

SELECT TOP 6 * FROM [Order Details]

SELECT TOP 6 WITH TIES * FROM [Order Details] AS OD
ORDER BY OD.OrderID


-- WITH 
-- daha anlaşılşır sorgular yazmak için kullanılır
-- karmaşık sorguları bölmek için kullanılır

WITH EmployeeOrders(id, firstName, LastName)
AS
(
	SELECT E.EmployeeID, E.FirstName, E.LastName
	FROM Employees AS E
	INNER JOIN Orders AS O
	ON O.EmployeeID = E.EmployeeID
)
SELECT * FROM EmployeeOrders















