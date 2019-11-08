
-- AGGREGATE FUNCTIONS

-- AVG MAX MIN COUNT SUM

SELECT AVG(EmployeeId) FROM Employees

SELECT MAX(EmployeeId) FROM Employees

SELECT MIN(EmployeeId) FROM Employees

SELECT COUNT(*) FROM Employees
SELECT COUNT(EmployeeID) FROM Employees

--Freight nakliye ücreti
SELECT SUM(Freight) FROM Orders


-- STRING Functions

SELECT LEFT(CategoryName,2) FROM Categories

SELECT RIGHT(CategoryName,4) FROM Categories

SELECT UPPER(CategoryName) FROM Categories

SELECT LOWER(CategoryName) FROM Categories

-- index(0 dan başlar), adet
SELECT SUBSTRING(CategoryName,3,2) FROM Categories

SELECT LTRIM(CategoryName),
	   RTRIM(CategoryName),
	   TRIM(CategoryName)
FROM Categories


SELECT CategoryName, 
       REVERSE(CategoryName),
	   REPLACE(CategoryName,'Con','Don')
FROM Categories

-- CHARINDEX - belirtilen karakterin metindeki yerini verir
-- sıra numarası = index -1 eğer 0 ise karakter hiç yok
SELECT CHARINDEX('e',CategoryName), CategoryName
FROM Categories

-- sadece ismini elde etmek
SELECT ContactName,
	   SUBSTRING(ContactName,0,CHARINDEX(' ', ContactName))
FROM Customers

-- sadece soyadı test etmek
SELECT ContactName,
	   LEN(ContactName),
	   SUBSTRING(ContactName, CHARINDEX(' ', ContactName), LEN(ContactName) - (CHARINDEX(' ', ContactName) - 1))
FROM Customers

-- Sayısal işlemler

SELECT 3 + 2
SELECT 3 - 2
SELECT 3 * 2
SELECT 3 / 2

SELECT PI()
SELECT SIN(90)
SELECT SQUARE(25)

SELECT ISNUMERIC('adfsd')

SELECT SIGN(123), SIGN(-963)

SELECT IIF(500<1000, 'YES', 'NO');
SELECT NULLIF(25, 25);


SELECT POWER(2,3) -- 2 üs 3

SELECT ABS(-639) -- Mutlak değer

SELECT RAND() -- 0-1 arası rastgele sayı üretir

SELECT RAND() * 10
SELECT FLOOR(RAND()*10) -- Yukarı yuvarlama yapar
SELECT FLOOR(RAND()*100) -- Yukarı yuvarlama yapar
SELECT FLOOR(RAND()*1000) -- Yukarı yuvarlama yapar

-- Date Functions

SELECT GETDATE()

SELECT DATEADD(DAY, 999,GETDATE())
SELECT DATEADD(MONTH, 10,GETDATE())
SELECT DATEADD(YEAR, 3,GETDATE())

-- İki tarih arasında gün ay yıl hesaplar
SELECT DATEDIFF(DAY, '09.05.1990',GETDATE())
SELECT DATEDIFF(MONTH, '09.05.1992',GETDATE())
SELECT DATEDIFF(YEAR, '09.05.1995',GETDATE())


SELECT DATEPART(DW, GETDATE())
SELECT DATEPART(MONTH, GETDATE())
SELECT DATEPART(DAY, GETDATE())


-- TOP - DISTINCT

USE Northwind

SELECT TOp(3) * FROM Employees

SELECT DISTINCT City FROM Employees

SELECT PARSE('5' AS INT) + 12

SELECT TRY_CONVERT(INT,'DENEME')
SELECT TRY_CONVERT(INT,'58')
















