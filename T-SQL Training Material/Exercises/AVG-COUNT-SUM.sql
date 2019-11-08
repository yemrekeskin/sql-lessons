--avg : ortalama
--count
--sum

select avg(UnitPrice) from Products --bütün ürünlerin birim fiyat ortalamasý

select pr.ProductName
urun_adi
, pr.CategoryID kategori_no, pr.UnitPrice birim_fiyat from Products pr


select pr.CategoryID kategori_no, avg(pr.UnitPrice) ortalama_birim_fiyat 
from Products pr
group by 
pr.CategoryID
order by 2 desc
---------------------
select pr.CategoryID kategori_no,
(select c1.CategoryName from Categories c1 where c1.CategoryID = pr.CategoryID) CategoryName,
 avg(pr.UnitPrice) ortalama_birim_fiyat
from Products pr
group by 
pr.CategoryID
order by 2 desc

select count(*) from Categories -- kaç kategori var
select count(*) from Employees -- kaç personelim var
select count(*) from Products -- ürün var



select o1.EmployeeID, count(*) toplam_siparis from Orders o1
group by o1.EmployeeID
order by 2 desc  -- hangi personel ne kadar sipariþ almýþ



select o1.EmployeeID, count(*) toplam_siparis from Orders o1
group by o1.EmployeeID
having count(*) < 100
order by 2 desc



select sum(ps.UnitPrice) toplam_birim_fiyat, 
sum(ps.UnitsInStock) top_stok_bekleyen,  
sum(ps.UnitsOnOrder) top_siparis_bekleyen
from Products ps



select ps.CategoryID,
(select c1.CategoryName from Categories c1 where c1.CategoryID = ps.CategoryID)CategoryName,
sum(ps.UnitPrice) toplam_birim_fiyat, 
sum(ps.UnitsInStock) top_stok_bekleyen,  
sum(ps.UnitsOnOrder) top_siparis_bekleyen
from Products ps
group by ps.CategoryID

select ps.CategoryID,
(select c1.CategoryName from Categories c1 where c1.CategoryID = ps.CategoryID)CategoryName,
sum(ps.UnitPrice) toplam_birim_fiyat, 
sum(ps.UnitsInStock) top_stok_bekleyen,  
sum(ps.UnitsOnOrder) top_siparis_bekleyen
from Products ps
group by ps.CategoryID


--PIVOT HALÝ
select * from 
(
select ps.CategoryID,
(select c1.CategoryName from Categories c1 where c1.CategoryID = ps.CategoryID)CategoryName,
sum(ps.UnitPrice) toplam_birim_fiyat
from Products ps
group by ps.CategoryID
) AS SATIS_ORTALAMA
PIVOT
(	SUM(toplam_birim_fiyat)
	FOR CategoryName IN ([Beverages],[Condiments],[Confections], [Dairy Products])) AS P1