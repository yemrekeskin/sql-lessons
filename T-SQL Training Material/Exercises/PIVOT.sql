CREATE DATABASE PIVOT_DB

USE PIVOT_DB

CREATE TABLE tblSatis(
ID int identity(1,1),
MUSTERI varchar(50),
SATILAN_URUN varchar(50),
TUTAR int,
AY varchar(30)
)


insert into tblSatis
values('Nida', 'Telefon', 900, 'Ocak')


insert into tblSatis
values('Turabi', 'Buzdolabı', 1200, 'Mart')


insert into tblSatis
values('Turabi', 'Bilgisayar', 800, 'Ocak')


insert into tblSatis
values('Erdinç', 'Telefon', 800, 'Nisan')


insert into tblSatis
values('Erdinç', 'Bilgisayar', 50, 'Ocak')


insert into tblSatis
values('Nida', 'Telefon', 150, 'Şubat')



insert into tblSatis
values('Dilan', 'Telefon', 250, 'Mayıs')

insert into tblSatis
values('Dilan', 'Buzdolabı', 250, 'Şubat')

insert into tblSatis
values('Dilan', 'Bilgisayar', 250, 'Nisan')
 
 
insert into tblSatis
values('Nida', 'Bilgisayar', 250, 'Ocak')

insert into tblSatis
values('Nida', 'Telefon', 250, 'Mayıs')

insert into tblSatis
values('Nida', 'Buzdolabý', 250, 'Şubat')

insert into tblSatis
values('Nida', 'Bilgisayar', 250, 'Nisan')
 
 
insert into tblSatis
values('Dilan', 'Bilgisayar', 250, 'Ocak')

insert into tblSatis
values('Yunus', 'Bilgisayar', 150, 'Ocak')
insert into tblSatis
values('Yunus', 'Bilgisayar', 250, 'Şubat')
insert into tblSatis
values('Yunus', 'Bilgisayar', 350, 'Mart')


insert into tblSatis
values('Ahmet', 'Bilgisayar', 250, 'Ocak')
insert into tblSatis
values('Ahmet', 'Bilgisayar', 450, 'Nisan')
insert into tblSatis
values('Ahmet', 'Bilgisayar', 550, 'Mart')


insert into tblSatis
values('Halil', 'Bilgisayar', 250, 'Mart')
insert into tblSatis
values('Halil', 'Bilgisayar', 250, 'Nisan')
insert into tblSatis
values('Halil', 'Bilgisayar', 2250, 'Haziran')

select * from tblSatis


--PIVOT TBL,,
--EZBERLE
SELECT *
FROM (
SELECT T1.MUSTERI, T1.AY,SUM(T1.TUTAR) AS AY_TOPLAM_TUTAR
FROM tblSatis T1
GROUP BY T1.MUSTERI, T1.AY
) 
AS SATISLAR
PIVOT(
SUM(AY_TOPLAM_TUTAR)
FOR AY IN ([Ocak], [Şubat],[Mart], [Nisan], [Mayıs], [Haziran])
) AS PIVOT_EX




--2 ÖRNEK
SELECT PIVOT_EX.*, 
(ISNULL(PIVOT_EX.Ocak, 0) + 
ISNULL(PIVOT_EX.Şubat,0)+
ISNULL(PIVOT_EX.Mart,0)+
ISNULL(PIVOT_EX.Nisan,0)+
ISNULL(PIVOT_EX.Mayıs,0)+
ISNULL(PIVOT_EX.Haziran,0) )GENEL_TOPLAM

FROM (
SELECT T1.MUSTERI, T1.AY,SUM(T1.TUTAR) AS AY_TOPLAM_TUTAR
FROM tblSatis T1
GROUP BY T1.MUSTERI, T1.AY
) 
AS SATISLAR
PIVOT(
SUM(AY_TOPLAM_TUTAR)
FOR AY IN ([Ocak], [Şubat],[Mart], [Nisan], [Mayıs], [Haziran])

) AS PIVOT_EX
ORDER BY 8 DESC
 



 ----3. ÖRNEK
 SELECT PIVOT_EX.*, 
(ISNULL(PIVOT_EX.Ocak, 0) + 
ISNULL(PIVOT_EX.Şubat,0)+
ISNULL(PIVOT_EX.Mart,0)+
ISNULL(PIVOT_EX.Nisan,0)+
ISNULL(PIVOT_EX.Mayıs,0)+
ISNULL(PIVOT_EX.Haziran,0) )GENEL_TOPLAM,
(
CASE 
WHEN
(ISNULL(PIVOT_EX.Ocak, 0) + 
ISNULL(PIVOT_EX.Şubat,0)+
ISNULL(PIVOT_EX.Mart,0)+
ISNULL(PIVOT_EX.Nisan,0)+
ISNULL(PIVOT_EX.Mayıs,0)+
ISNULL(PIVOT_EX.Haziran,0) ) < 3000
THEN 'NEDENİ ARAŞTIRILSIN !!'
WHEN
(ISNULL(PIVOT_EX.Ocak, 0) + 
ISNULL(PIVOT_EX.Şubat,0)+
ISNULL(PIVOT_EX.Mart,0)+
ISNULL(PIVOT_EX.Nisan,0)+
ISNULL(PIVOT_EX.Mayıs,0)+
ISNULL(PIVOT_EX.Haziran,0) ) BETWEEN 3000 AND 6000
THEN 'NORMAL'
ELSE 'PRİM SENİNDİR'
END) DURUM_DEGERLENDIRME 
FROM (
SELECT T1.MUSTERI, T1.AY,SUM(T1.TUTAR) AS AY_TOPLAM_TUTAR
FROM tblSatis T1
GROUP BY T1.MUSTERI, T1.AY
) 
AS SATISLAR
PIVOT(
SUM(AY_TOPLAM_TUTAR)
FOR AY IN ([Ocak], [Şubat],[Mart], [Nisan], [Mayıs], [Haziran])

) AS PIVOT_EX
ORDER BY 8 DESC
 

