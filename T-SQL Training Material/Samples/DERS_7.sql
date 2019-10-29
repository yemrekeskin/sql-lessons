

-- TEMPRORAL TABLE

-- Bilinen tablo yapısının aynısını sağlarlar, Tek fark bellekte geçici olarak oluşturulurlar,
-- Sunucu kapatıldığında ya da , oturum sahibi oturumu kapadığında bellekten silinir,

USE Northwind

SELECT * INTO Categories_2020 FROM Categories
-- SELECT INTO tabloyu fiziksel olarak oluşturulur,
-- bu kullanımda sadece primarykey ve foreignkey constaint ler oluşturulmaz
-- geriye kalan herşey fiziksel olarak oluşturulur,

SELECT * FROM Categories_2020

-- Geçici tablo olşarak kopyalama - Tek #

SELECT * INTO #Categories_Report FROM Categories

SELECT * FROM #Categories_Report

INSERT #Categories_Report (CategoryName) 
VALUES ('New Category')

DELETE FROM #Categories_Report
WHERE CategoryID = 9

UPDATE #Categories_Report
SET Description = 'UPDATED'
WHERE CategoryID = 10


-- ## tablo oluşturma
-- o an sql server da oturum açmış kişi içinde oluşturulur

SELECT * INTO ##Employees_TEST FROM Employees

SELECT * FROM ##Employees_TEST


-- VERI_TIPI uniqueidentifier 

CREATE TABLE OrnekTablo
(
	Id int primary key identity(1,1),
	KOLON_1 nvarchar(MAX),
	KOLON_2 uniqueidentifier
)

SELECT NEWID()
INSERT OrnekTablo VALUES('TEST DATA',NEWID())

SELECT * FROM OrnekTablo



-- VIEW
-- Karmaşık sorguları tek bir sorgu üzerinden çalıştırılabilmek için
-- güvenlik amaçlı - yazılan sorgunun başkası tarafından görntülenmesini engellemek
-- Sorgu nesne denir

-- Kolonları isimlerini alianz ile gizleriz
-- Order by tek başına kullanılmaz eğer istiyorsak TOP ile birlikte kullanılır
-- View üzerinde insert, update,delete yapılabilir, fiziksel taloya yansıtılır

CREATE VIEW VW_PRODUCT_GETIR
AS
SELECT FirstName,LastName FROM dbo.Employees

SELECT * FROM VW_PRODUCT_GETIR

-- VIEW - WITH ENCRIPTION
-- View in kaynak koduna erişlmesini istemiyorsak kullanırız
CREATE VIEW OrnekViewEmployee
WITH ENCRYPTION
AS
SELECT FirstName FROM Employees


SELECT * FROM OrnekViewEmployee

-- WITH SCHEMABINDING

CREATE TABLE OrnekTable
(
	Id int primary key identity,
	Kolon1 nvarchar(50)
)


CREATE VIEW OrnekTableView
WITH SCHEMABINDING
AS
SELECT Kolon1 FROM dbo.OrnekTable


ALTER TABLE OrnekTable
ALTER COLUMN Kolon1 int


-- VIEW - WITH CHECK OPTION
-- View'in içerisindeki sorguda bulunan şata uygun kayıların inser edilmesine müsade edip,
-- uymayan kayıtların eklenmemesini sağlayan komuttur

CREATE VIEW OrnekView2
AS
	SELECT CategoryName FROM dbo.Categories WHERE CategoryName LIKE 'b%'
WITH CHECK OPTION

INSERT OrnekView2 VALUES('beliha')
INSERT OrnekView2 VALUES('celiha')















