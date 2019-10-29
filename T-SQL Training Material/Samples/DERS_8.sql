
--Functions 
-- Scalar Function = Geriye istediğimiz tipte değer gönderen fonksiyon

-- Inline Function = Geriye tablo döndüren fonksiyon

USE Northwind
go

CREATE FUNCTION Topla(@Sayi1 INT, @Sayi2 INT)
RETURNS INT
AS
BEGIN
	DECLARE @RESULT INT = 0
	SET @RESULT = @Sayi1 + @Sayi2
	RETURN @RESULT;
END

go

--SELECT Topla(2,5)
SELECT dbo.Topla(2,5);

go

CREATE FUNCTION Maliyet(@BIRIM_FIYATI INT, @STOK_MIKTARI INT)
RETURNS INT
AS
BEGIN
	DECLARE @RESULT INT = @BIRIM_FIYATI * @STOK_MIKTARI * 1.18
	RETURN @RESULT;
END

go

SELECT dbo.Maliyet(10,20);

-- INLINE FUNCTION
-- Geriye bir değer değil, tablo gönderen fonksiyonlardır,
-- Genellikle VIEW lere benzer bir yapı olduğu için VIEW ler tercih edilebilmelidir
-- BEGIN END yapısı kullanılmaz

go

CREATE FUNCTION FC_GONDER(@AD NVARCHAR(20), @SOYAD NVARCHAR(20))
RETURNS TABLE
AS
RETURN SELECT * FROM Employees(NOLOCK) WHERE FirstName = @AD AND LastName = @SOYAD

GO


SELECT * FROM dbo.FC_GONDER('Nancy','Davolio')


-- WITH ENCRIPTION
-- Başkasının editlemesini istemiyorsak bu komutu kullanırız
-- fonksiyonu oluşturan kişinin ilgili fonksiyonun yedeğini almak gerekir
-- ALTER lamak gerekir,
go
CREATE FUNCTION OrnekFonksiyon()
RETURNS INT
WITH ENCRYPTION
AS
BEGIN
	RETURN 5
END

go

CREATE FUNCTION OrnekFonksiyon2()
RETURNS TABLE
WITH ENCRYPTION
AS
RETURN SELECT * FROM Employees(NOLOCK)

go

ALTER FUNCTION OrnekFonksiyon2()
RETURNS TABLE
--WITH ENCRYPTION
AS
RETURN SELECT * FROM Employees(NOLOCK)


-- COMPUTED COLUMN
-- Herhangi bir kolonda fonksiyon kullanılarak otomatik hesaplanabilir kolon oluşturulur

go

CREATE FUNCTION TOPLA2(@Sayi1 INT, @Sayi2 INT)
RETURNS INT
AS
BEGIN
	RETURN @Sayi1 + @Sayi2;
END

go

SELECT dbo.TOPLA2(10,45) AS HESAPLI_KOLON FROM Employees(NOLOCK)

-- ORNEK
-- Çıktı olarak "________ kategorisindeki ______ ürünün toplam fiyatı : ______ dir" 
-- şeklinde çıktı veren bir fonksiyon yazalım 





















