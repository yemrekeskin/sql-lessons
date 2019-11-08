use Northwind

select o1.OrderID,
(select distinct ProductID from Products p2 where p2.ProductID = o1.ProductID)

from Products p1, [Order Details] o1
where p1.ProductID = o1.ProductID
--group by o1.OrderID, P1.ProductID
order by 2 desc

