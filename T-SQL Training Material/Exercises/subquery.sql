--alt sorgular

--örn 1 
select p1.ProductName, sum(p1.UnitPrice) toplam from Products p1 
where p1.CategoryID in (
select c1.CategoryID from Categories c1 where c1.CategoryName ='Beverages'
)
group by p1.ProductName


--örn 2
select urun_birim_top.ProductName from (
select p1.ProductName, sum(p1.UnitPrice) toplam from Products p1 
where p1.CategoryID in (
select c1.CategoryID from Categories c1 where c1.CategoryName ='Beverages'
)
group by p1.ProductName) as urun_birim_top


--örn3
select p2.ProductID from Products P2 where ProductName in (
select urun_birim_top.ProductName from (
select p1.ProductName, sum(p1.UnitPrice) toplam from Products p1 
where p1.CategoryID in (
select c1.CategoryID from Categories c1 where c1.CategoryName ='Beverages'
)
group by p1.ProductName) as urun_birim_top)

--4
select o1.ProductID, xx.CategoryID,
count(*)
 from [Order Details] o1 inner join 
(
select * from (
select p2.ProductID, p2.CategoryID from Products P2 where ProductName in (
select urun_birim_top.ProductName from (
select p1.ProductName, sum(p1.UnitPrice) toplam from Products p1 
where p1.CategoryID in (
select c1.CategoryID from Categories c1 where c1.CategoryName ='Beverages'
)
group by p1.ProductName) as urun_birim_top)) cat_product) xx
on xx.ProductID = o1.ProductID
group by o1.ProductID, xx.CategoryID


--sipariþi 100 den büyük olan ürünler
SELECT ProductName
  FROM Products s
 WHERE ProductID IN (SELECT ProductID 
                FROM [Order Details]
               WHERE Quantity > 100)

--
SELECT c.ContactName, 
TOPLAM_SIP = (SELECT COUNT(O.OrderID) FROM Orders O WHERE O.CustomerId = C.CustomerID),
C.ContactTitle
  FROM Customers C 

--subquery ile T tablosu yapýldý.
SELECT T.ORDERID, T.CUSTOMERID 
FROM (
SELECT ORDERID, CUSTOMERID FROM orders) AS T



SELECT ProductName AS 'ÜRÜN ADI',
UnitPrice AS 'BÝRÝM FÝYATI', 
UnitsInStock AS 'STOK',
(SELECT AVG(UnitPrice) FROM Products) AS ORTALAMA,
UnitPrice-(SELECT AVG(UnitPrice) FROM Products) AS FARK 

FROM Products  



SELECT OrderID, CustomerID 
FROM orders AS or1
WHERE 30<(SELECT quantity FROM [order details] AS od
WHERE or1.OrderID=od.OrderID AND od.ProductID=30)