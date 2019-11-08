

-- TRIGGER - TETİKLEYİCİLER

-- DDL
-- INSERT,UPDATE,DELETE  işlemleri gerçekleştiğinde devreye giren yapılardır,
-- Bu işlemler sonucunda veya sürecinde devreye giren yapılardır,

-- AFTER-FOR INSERT,DELETE,UPDATE --> yaptıktan sonra bunu da yap
-- INSTEAD OF TRIGGER --> yerine bunuda yap


-- DML
-- CREATE,ALTER,DROP işlemleri sonucunda veya sürecinde giren yapılardır,

-- DML TRIGGER

-- INSERTED TABLE
-- DELETED TABLE

-- Bir tabloda update işlemi yapıldığında UPDATED tablosu oluşmaz
-- SQL Server da güncelleme mantığı önde silme (DELETE) sonra ekleme (INSERT) mantığındadır
-- Eğer bir tabloda güncelleme işlemi yapılıyor ise hem DELETED hem INSERTED tablosunda bu değer oluşur
-- Güncelleme öncesi kayıt = DELETED
-- Güncelleme sonrası kayıt = INSERTED




USE Northwind

go;

-- ORNEK1

CREATE TRIGGER OrnekTrigger
ON Categories
AFTER INSERT -- VEYA FOR DELETE,UDPATE,INSERT
AS

SELECT * FROM Categories(NOLOCK)

--- USAGE

INSERT INTO Categories (CategoryName,Description)
VALUES('azsdgfsd','sz<dgfzsdf')


-- ORNEK 2
-- Tedarikçiler tablosunda bir veri silindiğinde tüm ürünlerin fiyatını otomatik arttıralım
go;

CREATE TRIGGER triggerTedarikciler
On Suppliers
AFTER DELETE
AS
UPDATE Products SET UnitPrice += 10 


SELECT * FROM Suppliers WHERE SupplierID = 11

SELECT UnitPrice FROM Products(NOLOCK) WHERE SupplierID = 11

DELETE FROM Products WHERE SupplierID = 11
DELETE FROM Suppliers WHERE SupplierID > 10

go;


CREATE TABLE LOGS
(
	ID INT PRIMARY KEY IDENTITY(1,1),
	ACIKLAMA NVARCHAR(MAX)
)



go;
SELECT * FROM Employees
go;

CREATE TRIGGER trgPersonellerRapor
ON Employees
INSTEAD OF UPDATE
AS
DECLARE @ESKIAdi NVARCHAR(MAX)
DECLARE @YENIAdi NVARCHAR(MAX)
DECLARE @ACIKLAMA NVARCHAR(MAX)

SELECT @ESKIAdi = FirstName FROM deleted
SELECT @YENIAdi = FirstName FROM inserted

SET @ACIKLAMA = SUSER_SNAME() +' Kullanıcısı Tarafından' + CAST(GETDATE() AS NVARCHAR(MAX)) + ' Tarihinde'
SET @ACIKLAMA += ' Adi ' + @ESKIAdi + ' olan personel ' + @YENIAdi + ' yeni adıyla değiştirilmek istendi.'
INSERT LOGS VALUES(@ACIKLAMA)



SELECT * FROM Employees
WHERE EmployeeID = '1'


UPDATE Employees
SET FirstName = 'Emre'
WHERE EmployeeID = '1'

SELECT * FROM LOGS(NOLOCK)


-- DDL TRIGGER
go;

CREATE TRIGGER DDL_Ornek
ON DATABASE
FOR DROP_TABLE, ALTER_TABLE
AS
ROLLBACK


--DROP TABLE LOGS
--DROP TABLE [dbo].[Table_1]

DROP TABLE [dbo].[OrnekTablo] --[dbo].[TEST_TABLE]

go;

DISABLE TRIGGER DDL_Ornek
ON DATABASE 

go;

ENABLE TRIGGER DDL_Ornek
ON DATABASE 

