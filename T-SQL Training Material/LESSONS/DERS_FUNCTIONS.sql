
USE Northwind
-- FUNCTIONS --> INLINE FUNCTIONS, SCALAR FUNCTIONS

--SCALAR FUNCTIONS -->  Geriye istediğimiz değeri dsöndüren fonksiyonlar
-- INLINE FUNCTIONS --> Geriye tablo döndüren fonksiyonlar

-- Fonksiyonlar fiziksel olarak veritabanı üzerinde oluşturulur
-- CREATE ile oluşturulur
-- Aggregate fonksiyonlar ve sistem fonksiyonları


-- SCALAR FUNCTIONS
GO;

CREATE FUNCTION Topla(@Sayi1 INT, @Sayi2 INT) RETURNS INT
AS
BEGIN
	RETURN @Sayi1 + @Sayi2	
END

GO;

-- ALTER
ALTER FUNCTION Topla(@Sayi1 INT, @Sayi2 INT) RETURNS INT
AS
BEGIN
	DECLARE @TOPLAM INT = @Sayi1 + @Sayi2	
	RETURN @TOPLAM
END

GO;

-- USAGE

SELECT dbo.TOPLA(12,23)
PRINT dbo.TOPLA(23,45)

GO;

CREATE FUNCTION MALIYET(@UNIT_PRICE MONEY, @STOCK INT) RETURNS MONEY
AS
BEGIN
	DECLARE @RESULT INT = @UNIT_PRICE * @STOCK * 1.18
	RETURN @RESULT
END

GO;

SELECT dbo.MALIYET(12.23,8)


---- INLINE FUNCTIONS
-- VIEW lere benzer bir yapı
-- view ile yapılan herşey in-line fonksiyonda da yapabilirsiniz
-- inline fonksiyonda begin end yapısı kullanılmaz

GO;

CREATE FUNCTION GET_EMPLOYEES(@NAME NVARCHAR(MAX)) RETURNS TABLE
AS
RETURN SELECT * FROM dbo.Employees(NOLOCK) WHERE FirstName = @NAME

GO;

SELECT * FROM dbo.GET_EMPLOYEES('Nancy')

GO;

-- WITH ENCRYPTION
-- o fonksiyonu oluşturan kişide dahil hiç kimse ilgili fonksiyonun kodunu göremeyecektir.
-- kodlarına erişemezsiniz

CREATE FUNCTION GET_CATEGORY(@NAME NVARCHAR(MAX)) RETURNS TABLE
WITH ENCRYPTION
AS
RETURN SELECT * FROM [dbo].[Categories](NOLOCK) WHERE CategoryName = @NAME

GO;

SELECT * FROM dbo.GET_CATEGORY('Beverages')

-- COMPUTED COLUMN

SELECT dbo.MALIYET(P.UnitPrice,P.UnitsInStock) AS TOPLAM_MALIYET,*
FROM Products(NOLOCK) AS P

