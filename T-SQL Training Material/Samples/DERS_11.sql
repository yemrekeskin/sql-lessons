
USE Northwind

-- IDENTITY
-- İlgili veritabanı içerisinde yapılan son insert işleminin identity kolonunun değerini getirir.

INSERT Categories
VALUES('CATEGORYA','EXPLAANTION',NULL)

SELECT @@IDENTITY


-- ROWCOUNT
-- En son çalıştırılan sorgunun etkilene kayıt sayısını verir

SELECT * FROM Categories
SELECT @@ROWCOUNT 


-- IDENTITY kolonuna müdahale etmek
-- Tablodaki ideneity kolonunu belirttiğimiz bu sayıdan itibaren doldur diyebiliriz.

SELECT * FROM Employees 

DBCC CHECKIDENT(Employees,reseed,35)

DBCC CHECKIDENT(Categories,reseed,35)

INSERT Categories
VALUES('X','X',NULL)

SELECT * FROM Categories

-------

DECLARE @Yil NVARCHAR(4) ='2012'
DECLARE @Ay NVARCHAR(2)='03'
DECLARE @Gun NVARCHAR(2) = '03'

SELECT DATEFROMPARTS (@Yil, @Ay, @Gun)


-----------


-- ANY, ALL 

USE Northwind

SELECT * FROM Products

SELECT * FROM [Order Details] WHERE Quantity = 10 --181

SELECT DISTINCT ProductID FROM [Order Details] WHERE Quantity = 100 --181


SELECT ProductName
FROM Products
WHERE ProductID = ANY (SELECT ProductID FROM [Order Details] WHERE Quantity = 10);

SELECT ProductName
FROM Products
WHERE ProductID = SOME (SELECT ProductID FROM [Order Details] WHERE Quantity = 10);


SELECT ProductName
FROM Products
WHERE ProductID = ALL (SELECT ProductID FROM [Order Details] WHERE Quantity = 10);

-- TRANSACTION

-- Birden çok işlemin yapıldığı durumlarda eğer oluşan işlemlerden herhangi 
-- birinde sorun olursa tüm işlemi iptal ettrimeye yarar.

-- Örneğin Kredi kartı ile alışveriş işlemi

--BEGIN TRANSACTION - TRAN
--COMMIT TRANSACTION 
--ROLLBACK TRANSACTION 

-- Normalde default olarak yazdığımız her sorgu
-- BEGIN TRAN ile başlayıp commit TRAN ile biter

--BEGIN TRAN [TRAN_NAME] isim verebiliriz fakt bu zorun değil 

INSERT Categories
VALUES ('KATE_1','KATE_2',NULL)

SELECT TOP 3 * FROM Categories
ORDER BY CategoryID DESC

BEGIN TRAN Kontrol
INSERT Categories VALUES ('KATE_X','KATE_Y',NULL)
COMMIT TRAN

-- Example

BEGIN TRAN KONTROL_2
DECLARE @COUNTER INT 
UPDATE Categories SET CategoryName = 'UPDATED_X' WHERE CategoryID IN(37,36)
SET @COUNTER = @@ROWCOUNT

IF @COUNTER = 1
BEGIN
	PRINT 'COMMIT'	
	COMMIT TRAN
	--COMMIT
END 
ELSE
BEGIN
	PRINT 'ROLLBACK'
	ROLLBACK TRAN
	-- ROLLBACK
END





















