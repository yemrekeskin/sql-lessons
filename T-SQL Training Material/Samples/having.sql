--having select de ki fonksiyonun where koþuludur. 

SELECT p1.CategoryID, count(*) kategori_toplam_urun FROM Products p1
group by p1.CategoryID
having count(*)>10

SELECT p1.CategoryID, count(*) kategori_toplam_urun FROM Products p1
group by p1.CategoryID
having count(*)<10


select p1.ProductID, sum(p1.ReorderLevel) ReorderLevel from Products p1
group by p1.ProductID
having sum(p1.ReorderLevel) > 10

select * from Products