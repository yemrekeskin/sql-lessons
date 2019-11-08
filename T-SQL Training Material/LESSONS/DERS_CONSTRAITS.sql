
-- CONSTRAITS -- Kısıtlayıcılar

 -- NULL - NOT NULL    *
 -- DEFAULT            *
 -- CHECK              *
 -- UNQUE              *
 -- PRIMARY KEY        *
 -- FOREIGN KEY       --> 

 -- Tablo oluþtururken
 -- Tablo oluþtuktan sonra


 USE Northwind

 --use USE uSe 

 CREATE TABLE Ogrenciler
 (
	Adi NVARCHAR(10) NOT NULL,
	Soyadi NVARCHAR(20) NOT NULL,
	Yasi INT NULL
 )

 
 SELECT * FROM Ogrenciler
 SELECT * FROM dbo.Ogrenciler


 INSERT INTO Ogrenciler 
 VALUES ('Yunus Emre','Keskin',12)

 INSERT INTO Ogrenciler (Adi,Soyadi,Yasi)
 VALUES (NULL,'Keskin',12)

 INSERT INTO Ogrenciler (Adi,Soyadi,Yasi)
 VALUES ('ABC','Keskin',NULL)

 UPDATE Ogrenciler
 SET Yasi = 25

 -- DEFAULT
 -- Kolonlara varsayýlan deðer atamasý yapar


 INSERT INTO Ogrenciler (Adi,Soyadi)
 VALUES ('AAAAAA','BBBBBBB')

 SELECT * FROM Ogrenciler
 
 ALTER TABLE Ogrenciler
 ADD CONSTRAINT Default_Yasi DEFAULT 18 FOR Yasi
  
 ALTER TABLE Ogrenciler
 ADD CONSTRAINT Default_DogumTarihi DEFAULT GETDATE() FOR DogumTarihi

 -- UNIQUE

  SELECT * FROM Ogrenciler

  UPDATE Ogrenciler
  SET OgrenciNo = 'XXXXX'

  -- Yeni tablo oluþturuken
  CREATE TABLE Ogretmenler
  (
	Adi NVARCHAR(10) NOT NULL,
	Soyadi NVARCHAR(10) NOT NULL,
	OgretmenKodu NVARCHAR(5) NOT NULL UNIQUE
  )
  
  DELETE FROM Ogrenciler

 ALTER TABLE Ogrenciler
 ADD CONSTRAINT Unique_DogumTarihi UNIQUE(OgrenciNo)


 -- CHECK

 SELECT * FROM Ogretmenler

 ALTER TABLE Ogretmenler
 ADD CONSTRAINT CHECK_DersSayisi CHECK (DersSayisi % 5 = 0)

 ALTER TABLE Ogretmenler
 DROP CONSTRAINT CHECK_DersSayisi -- Kýsýtlayýcýyý siler

 DELETE FROM Ogretmenler

 ALTER TABLE Ogretmenler
 ADD CONSTRAINT CHECK_Adi CHECK (LEN(Adi) >= 5)



 -- PRIMARY KEY

 SELECT * FROM Ogretmenler

 --DELETE FROM Ogretmenler

 --INSERT INTo = INSERT
 
 INSERT Ogretmenler
 VALUES('Yusuf','Genç','D1234',10)

 INSERT Ogretmenler
 VALUES('Yusuf2','Genç2','D1235',20)

  
 -- MOD % 
 -- 10 % 5 = 0
 -- 265 % 5 = 0


 -- CONVERT, PARSE, CAST
 -- Donuþum Fonksiyonlarý

 SELECT CONVERT(nvarchar,UrunID)  + '-' + UrunAdi FROM Urunler
 SELECT CAST(UrunID AS nvarchar)  + '-' + UrunAdi FROM Urunler

 SELECT '125' + 25
 SELECT '125' + '25'

 SELECT CONVERT(INT,'125')  + 25




















