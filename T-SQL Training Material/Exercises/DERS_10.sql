
--- TRIGGER
-- DML - INSERT UPDATE DELETE Trigger
-- DDL - CREATE , ALTER Trigger

-- DML Triggerlar, ram	deki tablo
--INSERTED 
--DELETED

-- UPDATED diye bir şey yok
-- UPDATE mantığı ilk önce siler sonra ekler


--CREATE TRIGGER trigger adı
--ON işlem yapılacak tablo
-- AFTER -- veya FOR DELETE,UPDATE,INSERT
--AS
-- KODLAR

USE Northwind

go

CREATE TRIGGER OrnekTrigger
ON Employees
AFTER INSERT
AS
SELECT * FROM Employees(NOLOCK)

go

INSERT Employees (FirstName, LastName)
VALUES ('Kiz', 'Fatma')


-- ORNEK 1 : Tedarikçiler tablosunda bir veri silindiğinde
-- tüm ürünlerin fiyatı otomatik olarak 10 artsın
