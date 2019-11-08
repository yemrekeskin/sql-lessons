select * from CARI
select * from CARI_TIP
--INNER JOIN

select c1.CARI_NO, c1.CARI_AD, ct.CARI_TIP_AD 
from CARI as c1 inner join CARI_TIP as ct
on c1.CARI_TIP_ID = ct.CARI_TIP_ID


use Northwind

select od.OrderID siparis_no, p1.ProductName urun_adi
from Products as p1 inner join [Order Details] od
on p1.ProductID = od.ProductID
order by 1 

SELECT "Order Details".OrderID, p1.ProductName,
Sum(CONVERT(money,("Order Details".UnitPrice*Quantity*(1-Discount)/100))*100) AS Subtotal
FROM "Order Details" inner join Products p1 
on [Order Details].ProductID = p1.ProductID
GROUP BY "Order Details".OrderID, p1.ProductName

