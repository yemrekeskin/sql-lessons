USE Northwind


select A.companyName,B.ShipName 
from Customers A inner join orders B on A.CustomerID=B.CustomerID --830 SATIR


select A.companyName,B.ShipName 
from Customers A left join orders B on A.CustomerID=B.CustomerID --832 SATIR

select distinct CustomerID from orders -- o1 where o1.ShipName is null
select distinct CustomerID from  Customers  where CustomerID not in 
(select distinct CustomerID from orders )--hiç sipariþi olmayan müþteriler

SELECT A.FirstName+' '+A.LastName AS PERSONEL, OrderID SIP_NO,OrderDate  SIP_TARIH

FROM Employees A LEFT JOIN Orders B ON A.EmployeeID=B.EmployeeID --YANLIÞ çünkü personel
--Employees tablosuna göre iþlem yapýyoruz, bu durumda sipariþ sayý net ve doðru çýkmaz.


SELECT B.FirstName+' '+B.LastName AS PERSONEL, OrderID SIP_NO,OrderDate  SIP_TARIH
FROM Orders A LEFT JOIN Employees B ON A.EmployeeID=B.EmployeeID --DOÐRU sipariþ sayýsý


select B.OrderID, A.FirstName, A.LastName, A.Title 
from Employees A right join Orders B 
ON a.EmployeeID = b.EmployeeID --personel bilgisi olmayan sipariþler. 


SELECT A.companyname, A.CustomerID, B.orderdate
FROM customers A RIGHT JOIN orders  B ON A.CustomerID = B.CustomerID

SELECT count(*)
FROM customers A RIGHT OUTER JOIN orders  B ON A.CustomerID = B.CustomerID

SELECT count(*)
FROM Orders A LEFT OUTER JOIN Employees B ON A.EmployeeID=B.EmployeeID --DOÐRU sipariþ sayýsý

SELECT count(*)
FROM Orders A FULL OUTER JOIN Employees B ON A.EmployeeID=B.EmployeeID --DOÐRU sipariþ sayýsý

SELECT count(*)
FROM Orders A FULL OUTER JOIN Employees B ON A.EmployeeID=B.EmployeeID 
