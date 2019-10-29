use test_db
--distinct
--where 
--=
--or
--and
--<
-->
--<=
-->=
--<>
--between
--in 
-- exists

select * from dbo.personel -- her þeyi listeler

select p1.adi, p1.sehir from Personel  p1 -- tabloya isim ver ve istelen alanlarý liste

select top 2 p1.adi, p1.sehir from  Personel p1 --kayýt sayýsý sýnýrý

select top(25) percent * from Personel --yüzdelik kayýt getir

select distinct sehir from Personel --distinct kolonu yada kolarý birleþtirir

select distinct adi, soy_adi from Personel --kolonlarý fazla ise ayný kolonlar olduðu sürece birleþtirir.

select * from Personel where sehir = 'Ýstanbul' -- eþittir oparatörü
select * from Personel where sehir = 'Ýstanbul' and maas = 220; -- 2 adet and koþulu var.
select * from Personel where adi = 'Ahmet' or adi =  'Serdar' --veya

select * from Personel where sehir = 'Ýstanbul'
AND dogum_tar = '1980-01-01'
AND maas = 100
OR (sehir = 'Erzurum' or sehir = 'Ýzmir' or sehir = 'Kýrþehir') -- OR VE AND KULLANIMI



SELECT p1.adi, p1.adres, p1.sehir, p1.maas FROM Personel as p1
where p1.maas < 200 --200 den küçük olanlar

select p1.adi,p1.adres,p1.sehir,p1.maas from Personel as p1 where p1.maas>150  --150 den büyükler


select * from Personel p1 where maas = 100
or (maas>=140) -- => büyük eþit 

select * from Personel p1 where maas = 100
or (maas<=200) -- <= küçük eþit

select * from Personel where sehir !='Ýstanbul'
select * from Personel where sehir <> 'Ýstanbul'
select * from Personel where sehir <> 'Ýstanbul' and sehir!='Erzurum'  -- olumsuzluk ifade eder getirmez

select * from Personel where maas between 10 and 140 -- arasýnda oparatörü 10 ile 140
select * from Personel where dogum_tar between '1930-01-01' and '1980-01-01'
select * from Personel where p_id between 1 and 3
select * from Personel where p_id between 1 and 3
and sehir != 'Erzurum'

select * from Personel where adi like 'Y%' -- ilk harfi y olan
select * from Personel where adi like '%r' -- son harf r olan kayýtlar
select * from Personel where adi like '%S%'--içinde s harfi geçenler
select * from Personel where adi like '%A%' --küçük büyük fark etmez içinde a harfi olanlar


select * from Personel where sehir = 'Erzurum' or sehir = 'Ýzmir' or sehir = 'Erzurum'
or sehir = 'Ankara' -- gereksiz

select * from Personel where sehir in ('Erzurum','Ýzmir', 'Ýstanbul') -- içersinde var olanlar
select * from Personel where p_id in (7,2,4); -- içerisinde 7 2 ve 4 olanlarý getir

select * from Personel where sehir in ('Erzurum','Ýzmir', 'Ýstanbul') 
select * from Personel where p_id in (7,2,4); 


--where 
--=
--or
--and
--<
-->
--<=
-->=
--<>
--between
--in 
-- exists