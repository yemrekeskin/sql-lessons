USE Northwind

-- Değişken tanımlama
DECLARE @A int

DECLARE @B NVARCHAR

DECLARE @C MONEY

DECLARE @X int, @Y NVARCHAR, @Z BIT

DECLARE @Age int = 63 -- set default value

SET @Age = 78

SET @X = 5; SET @Y = '10'; SET @Z = 1;

DECLARE @TARIH datetime
SET @TARIH = GETDATE()

SELECT @TARIH AS TRH
PRINT @TARIH


-- Sorgu sonucu 1 adet olmalı
--DECLARE @NameSurname NVARCHAR -- 1 karakter
DECLARE @NameSurname NVARCHAR(100)

SELECT TOP 1 @NameSurname = E.FirstName + '-' + E.LastName
FROM Employees AS E

SELECT @NameSurname AS [ISIM SOYISIM]


-- CASE WHEN ELSE END

SELECT 
	 FirstName, 
	 LastName,
	 CASE 
		WHEN E.TitleOfCourtesy IN('Mrs.','Ms.') THEN 'Kadin'
		WHEN E.TitleOfCourtesy = 'Mr.' THEN 'Erkek'
		ELSE E.TitleOfCourtesy
	 END AS UNVAN
FROM Employees AS E


SELECT 
	ProductID,
	CASE 
		WHEN UnitPrice > 0 AND UnitPrice < 50 THEN 'CinMalı'
		WHEN UnitPrice BETWEEN 50 AND 100     THEN 'Ucuz'
		WHEN UnitPrice BETWEEN 100 AND 200    THEN 'Normal'
		WHEN UnitPrice > 200                  THEN 'Pahalı'
		ELSE 'Belirsiz'
	END
FROM Products AS P

-- IF CLAUSE - BEGIN END SCOPE

DECLARE @CategoryName NVARCHAR(100)
SET @CategoryName = 'UnKnown'

IF @CategoryName = 'UnKnown' PRINT 'YES'
ELSE PRINT 'NO'


IF @CategoryName = 'UnKnown' 
	SELECT 'YES'
ELSE 
	SELECT 'NO'


DECLARE @Sayi1 int = 3, @Sayi2 int  = 5

IF (@Sayi1 > @Sayi2)
	BEGIN
		PRINT 'Sayi1 Sayi2 den BUYUK'
		SELECT @Sayi1 AS SAYI_1, @Sayi2 AS SAYI_2
	END
ELSE
	BEGIN
		PRINT 'Sayi1 Sayi2 den KUCUK'
		SELECT @Sayi1 AS SAYI_1, @Sayi2 AS SAYI_2
	END


SELECT * FROM Customers WHERE Country = 'USA'
-- @@ROWCOUNT Etkilenen kayıt sayısını verir
IF @@ROWCOUNT > 0 PRINT 'EVET' ELSE PRINT 'HAYIR'


DECLARE @FirstName NVARCHAR(50)  = 'Yunus', @LastName NVARCHAR(50) = 'Keskin'

SELECT * 
FROM dbo.Employees AS E 
WHERE E.FirstName = @FirstName AND E.LastName = @LastName

IF @@ROWCOUNT > 0 
	SELECT 'VAR'
ELSE INSERT dbo.Employees (FirstName,LastName) VALUES(@FirstName, @LastName)

-- IF-ELSE IF-ELSE


-- EXIST

IF EXISTS(SELECT * FROM Employees)
	SELECT 'FULL'
ELSE SELECT 'EMPTY'

-- WHILE

DECLARE @Counter int  = 1
WHILE @Counter <= 10
BEGIN
	PRINT @Counter

	SET @Counter = @Counter + 1
END

-- BREAK
DECLARE  @Counter1 int = 1
WHILE @Counter1 <= 100
BEGIN
	PRINT @Counter1
	SET @Counter1 = @Counter1 + 1

	IF @Counter1 % 5 = 0 BREAK
END

-- CONTINUE

DECLARE  @Counter2 int = 1
WHILE @Counter2 <= 100
BEGIN
	
	IF @Counter2 % 5 = 0 
	BEGIN
		SET @Counter2 = @Counter2 + 1
		CONTINUE
	END

	PRINT @Counter2
	SET @Counter2 = @Counter2 + 1
END




