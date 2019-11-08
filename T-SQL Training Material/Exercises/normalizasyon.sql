use Northwind

Select 
ks.Ad, ks.Soyad, 
(select DepartmanAdi from DepartmanTbl where DepartmanID = ks.DepartmanID) departman,
(select t.Tel1 from telefonTbl t where t.KisiNo = ks.KisiNo) TEL1,
(select t.Tel2 from telefonTbl t where t.KisiNo = ks.KisiNo) TEL2,
(select t.Tel2 from telefonTbl t where t.KisiNo = ks.KisiNo) TEL3
from KisilerTbl as ks