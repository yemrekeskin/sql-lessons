-- STORED PROCEDURE
-- Normal Sorgulardan daha hızlıdır,
-- Normal SELECT sorgular çalıştırıldığında EXECUTE PLAN oluşturulur,
-- SP ile yapıldığında ilk çağrıldığında EXECUTE plan oluşur ve sonraki çağrımda oluşturulmaz

--CREATE PROC
--CREATE PROCEDURE

--CREATE PROC SAMPLE_PROC
--( -- parantez kullanmayada biliriz, okunabilirlilk açısından kullanılabilir
--	varsa parametre
--)
--AS
--işlemler


CREATE PROC sp_Ornek
(
	@ID INT -- input parametre
)
AS
BEGIN
	SELECT * FROM Employees(NOLOCK) WHERE EmployeeID = @ID
END

go

CREATE PROC sp_Ornek2
	@ID INT -- input parametre
AS
BEGIN
	SELECT * FROM Employees(NOLOCK) WHERE EmployeeID = @ID
END

go

EXECUTE sp_Ornek 2

EXEC sp_Ornek2 2

-- OUTPUT PARAMETER

go

CREATE PROC sp_getProduct
(
	@AMOUNT MONEY
)
AS
SELECT * FROM Products(NOLOCK) WHERE UnitPrice > @AMOUNT
RETURN @@ROWCOUNT
go

EXEC sp_getProduct 10

DECLARE @RESULT INT
EXEC @RESULT = sp_getProduct 40
SELECT @RESULT


go


CREATE PROC sp_Ornek3
	@ID INT = 0, -- 0 ile varsayılan değer atamak
	@AD NVARCHAR(MAX) OUTPUT,
	@SOYAD NVARCHAR(MAX) OUTPUT
AS
BEGIN

	SELECT 
		@AD = FirstName, 
		@SOYAD = LastName 
	FROM Employees(NOLOCK) 
	WHERE EmployeeID = @ID

END


go

DECLARE @AD1 NVARCHAR(MAX), @SOYAD1 NVARCHAR(MAX)
EXEC sp_Ornek3 3, @AD1 OUTPUT, @SOYAD1 OUTPUT
SELECT @AD1 + ' - ' + @SOYAD1
go

-- ORNEK : Insert yapan bir proc yaz


-- EXEC komutu

EXEC('SELECT * FROM Employees(NOLOCK)')

EXECUTE('SELECT * FROM Employees(NOLOCK)')

-- İki exec komutu birbirinden bağımsızdır
EXEC('DECLARE @SAYAC INT = 0')
EXEC('PRINT @SAYAC')

go

CREATE PROC sp_TableCreate
(
	@TABLE_NAME NVARCHAR(MAX),
	@COLUMN_NAME NVARCHAR(MAX)
)
AS
BEGIN

DECLARE @RESULT NVARCHAR(MAX)
SET @RESULT = 'CREATE TABLE ' + @TABLE_NAME +
'(' 
	+ @COLUMN_NAME + ' NVARCHAR(MAX) ' +
')';
EXEC(@RESULT)

END

go

EXEC sp_TableCreate 'TEST_TABLE', 'ILK_KOLON'






