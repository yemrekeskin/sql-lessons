--1 YÖNTEM
select o1.OrderID siparis_no, p1.ProductName from Products p1 inner join [Order Details]
o1 on o1.ProductID = p1.ProductID
where o1.OrderID in (select o2.OrderID from Orders o2 where o2.OrderDate between 
'1991-07-04 00:00:00.000'  and '1999-07-04 00:00:00.000' and o2.OrderID = o1.OrderID)
order by 1 desc

--2.YÖNTEM 
select o1.OrderID siparis_no, p1.ProductName from Products p1, [Order Details] o1
where o1.ProductID = p1.ProductID
and o1.OrderID in (select o2.OrderID from Orders o2 where o2.OrderDate between 
'1991-07-04 00:00:00.000'  and '1999-07-04 00:00:00.000' and o2.OrderID = o1.OrderID)
order by 1 desc
--3. YÖNTEM


select o1.OrderID siparis_no, p1.ProductName 
from Products p1
CROSS JOIN [Order Details] o1
where o1.ProductID = p1.ProductID
and o1.OrderID in (select o2.OrderID from Orders o2 where o2.OrderDate between 
'1991-07-04 00:00:00.000'  and '1999-07-04 00:00:00.000' and o2.OrderID = o1.OrderID)
order by 1 desc

select * from  Orders