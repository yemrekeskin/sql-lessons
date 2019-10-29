-- KÜmeleme işlemleri
-- GROUP BY  hAVING
-- UNION , INTERSECT EXEPT

SELECT *
FROM Products


-- Kategory den kaç tane ürün var

SELECT * FROM Products

SELECT CategoryID, COUNT(*) AS PRODUCT_COUNT
FROM Products
GROUP BY CategoryID


SELECT CategoryID, SupplierID, COUNT(*) AS PRODUCT_COUNT
FROM Products
GROUP BY CategoryID, SupplierID

SELECT EmployeeID, COUNT(*)
FROM Orders
GROUP BY EmployeeID

SELECT EmployeeID, SUM(Freight)
FROM Orders
WHERE EmployeeID > 5
GROUP BY EmployeeID

-- WITH ROLLUP -- ara toplam alır
SELECT CategoryID, ProductID, SUM(SupplierID)
FROM Products
GROUP BY CategoryID, ProductID WITH ROLLUP

-- WITH CUBE -- teker teker toplam alır
SELECT CategoryID, ProductID, SUM(SupplierID)
FROM Products
GROUP BY CategoryID, ProductID WITH CUBE














-- HAVING AGGREGATE kolonu için where kullanılacak ise HAVING kullanılır

SELECT CategoryID, COUNT(*) AS PRODUCT_COUNT
FROM Products
GROUP BY CategoryID
HAVING COUNT(*) > 5



------ Tablo Birleştirme


SELECT * FROM Employees  -- 10
SELECT * FROM Orders  --830

SELECT  *
FROM Employees, Orders -- 12450

SELECT  FirstName,*
FROM Employees, Orders -- 12450

SELECT  Employees.EmployeeID,Orders.EmployeeID
FROM Employees, Orders

SELECT  E.EmployeeID,O.EmployeeID
FROM Employees AS E, Orders AS O

SELECT  E.EmployeeID,O.EmployeeID
FROM Employees E, Orders O

-- JOIN TYPES

-- INNER JOIN

-- Hangi Personel hangi satışları yapmıştır
SELECT E.FirstName + '-'+ E.LastName AS AD_SOYAD,O.*
FROM Orders AS O
INNER JOIN Employees AS E
ON O.EmployeeID = E.EmployeeID 

-- Hangi Ürün Hangi Kategoride
SELECT C.CategoryName, P.*
FROM Products AS P
INNER JOIN Categories AS C
ON P.CategoryID = C.CategoryID

SELECT COUNT(*)
FROM Products AS P
INNER JOIN Categories AS C
ON P.CategoryID = C.CategoryID
WHERE C.CategoryName = 'Beverages'


-- Hangi ürünlerin tedarikçilerinin fax numarası verilmemiş
SELECT S.Fax,*
FROM Suppliers AS S
INNER JOIN Products AS P
ON P.SupplierID = S.SupplierID
WHERE S.Fax IS NOT NULL
--WHERE S.Fax <> 'NULL'


SELECT S.Fax,*
FROM Suppliers AS S
INNER JOIN Products AS P
ON P.SupplierID = S.SupplierID
INNER JOIN Categories  AS C
ON C.CategoryID = P.CategoryID

-- 1997 yılından sonra Nancy'nin satış yaptığı firmalrın ismi

SELECT * 
FROM Employees AS P

INNER JOIN Orders AS O
ON P.EmployeeID = O.EmployeeID

INNER JOIN Customers AS C
On C.CustomerID = O.CustomerID

WHERE P.FirstName = 'Nancy' AND YEAR(O.OrderDate) > 1997 

-- Limited olan tedarikçilerden alınmış seafood kategorisindeki
-- ürünlerimin toplam satış tutarı (Ürünler,Kategoriler, Tedarikçiler)

USE Northwind

SELECT * FROM Suppliers

SELECT SUM(P.UnitPrice * P.UnitsInStock)
FROM Products AS P
INNER JOIN Suppliers AS S
ON P.SupplierID = S.SupplierID
INNER JOIN Categories AS C
ON C.CategoryID = P.CategoryID
WHERE S.CompanyName LIKE '%Ltd.%' AND C.CategoryName = 'Seafood'


-- aynı tablodaki ilişkiler
SELECT EmployeeID,ReportsTo,* FROM Employees

SELECT * FROM Employees
WHERE ReportsTo IS NULL

SELECT P2.FirstName AS REPORT_TO_NAME,
	   P1.*
FROM Employees AS P1
INNER JOIN Employees AS P2
ON P1.ReportsTo = P2.EmployeeID  


-- INNER JOIN ve GROUP BY

-- Hangi personelin (adı-soyadı) kaç adetlik satış yapmış,
-- satış adedi 100 den fazla olanlar ve personelin adına göre filtreleme


SELECT E.FirstName, COUNT(*) 
FROM Employees AS E
INNER JOIN Orders AS O
ON E.EmployeeID = O.EmployeeID
--WHERE E.FirstName LIKE 'a%'
GROUP BY E.FirstName
HAVING COUNT(*) > 100


SELECT CategoryID, COUNT(*)
FROM Products
GROUP BY CategoryID

SELECT P.CategoryID,
	   COUNT(*),
	  (SELECT TOP(1) CategoryName FROM Categories AS C WHERE C.CategoryID = P.CategoryID) 
FROM Products AS P
GROUP BY P.CategoryID


-- seafood kategorisindeki ürünlerin sayısı ?

SELECT C.CategoryName, Count(*) 
FROM Categories AS C
INNER JOIN Products AS P
ON C.CategoryID = P.CategoryID
WHERE C.CategoryName = 'Seafood'
GROUP BY C.CategoryName

-- Hangi personel toplam kaç adet satış yapmıştır

SELECT E.FirstName,COUNT(*) 
FROM Employees AS E
INNER JOIN Orders AS O
On E.EmployeeID = O.EmployeeID
GROUP BY E.FirstName
ORDER BY COUNT(*) DESC


USE MyCompany

-- OUTER JOIN -- eşleşmeyen kayıtların da getirilmesinin sağlanması

SELECT * FROM Movies
SELECT * FROM Casts


-- LEFT OUTER JOIN
-- Join ifadesinin solundaki kayıtların hepsini getirir
-- sağdaki tabloda ise eşleyen kayıtları getirir
-- LEFT OUTER JOIN = LEFT JOIN

SELECT * 
FROM Casts AS C
LEFT OUTER JOIN Movies AS M
ON C.MovieID = M.MovieID


SELECT * 
FROM Movies AS M
LEFT JOIN Casts AS C
ON C.MovieID = M.MovieID

-- RIGHT OUTER JOIN
-- Join ifadesinin sağındaki kayıtlar hepsini getitir
-- solundaki tabloda ise eşleşen kayıtları getitir , eşleşmeyenler null olur
-- RIGHT JOIN = RIGHT OUTER JOIN

SELECT * 
FROM Casts AS C
RIGHT OUTER JOIN Movies AS M
ON C.MovieID = M.MovieID

SELECT * 
FROM Movies AS M
RIGHT OUTER JOIN Casts AS C
ON C.MovieID = M.MovieID


-- FULL OUTER JOIN
-- iki taraftaki kayıtlardan eşleşen eşleşmeyen kayıtların tamamını getirir

SELECT * 
FROM Movies AS M
FULL OUTER JOIN Casts AS C
ON C.MovieID = M.MovieID


SELECT * FROM Movies AS M
FULL JOIN Casts AS C
ON C.MovieID = M.MovieID

-- CROSS JOIN
-- Kartezyen Çarpım -- kombinasyondur
-- Bu sorgulara WHERE ile şart veremiyoruz

USE Northwind

SELECT COUNT(*) FROM Employees --11

SELECT COUNT(*) FROM Region --4


SELECT E.FirstName, R.RegionDescription
FROM Employees AS E
CROSS JOIN Region AS R




















