USE Northwind

-- AGGREGATE FUNCTIONS

SELECT AVG(EmployeeId) FROM Employees

SELECT MAX(EmployeeId) FROM Employees

SELECT MIN(EmployeeId) FROM Employees

SELECT COUNT(*) FROM Employees
SELECT COUNT(EmployeeID) FROM Employees

--Freight nakliye ücreti
SELECT SUM(Freight) FROM Orders

SELECT SUM(UnitPrice)
FROM Products
WHERE SupplierID = 3

SELECT AVG(UnitPrice)
FROM Products
WHERE SupplierID = 3

SELECT MIN(UnitPrice)
FROM Products
WHERE SupplierID = 3

SELECT MAX(UnitPrice)
FROM Products
WHERE SupplierID = 3

SELECT COUNT(SupplierID)
FROM Products
WHERE SupplierID = 3

--having select de ki fonksiyonun where koyuludur. 

SELECT p1.CategoryID, count(*) kategori_toplam_urun 
FROM Products p1
group by p1.CategoryID
having count(*)>10

SELECT p1.CategoryID, count(*) kategori_toplam_urun 
FROM Products p1
group by p1.CategoryID
having count(*)<10


select p1.ProductID, sum(p1.ReorderLevel) ReorderLevel 
from Products p1
group by p1.ProductID
having sum(p1.ReorderLevel) > 10

--group by gruplma

select * from Employees

select p1.City from Employees p1
group by p1.City

select p1.FirstName from Employees p1
group by FirstName

select p1.City, count(*) toplam_personel 
from Employees p1 
group by  p1.City  
having count(*) < 3 -- having gruplamada ki sonuca kriter vermek icin kullanılır.