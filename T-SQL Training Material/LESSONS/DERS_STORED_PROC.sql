

--STORED PROCEDURES

-- Normal sorgulardan daha hızlı çalışlır
-- EXECUTE PLAN yapılır --> hangi tablolardan ve kolonlardan veri çekilecek ise bunu bilir
-- ilk sorgu çalıştığında execute plan oluşur
-- sonraki sorgularda bunu yapmayacaktır,


-- SET DEFAULT VALUE, OUT PARAMETER , RETURN

CREATE PROC sp_find_Category
(
	@ID INT
)
AS
BEGIN
	SELECT * FROM Categories WHERE CategoryID = @ID
END

EXEC sp_find_Category 12

DROP PROC sp_find_Category

go;


CREATE PROCEDURE sp_get_Product
(
	@PRICE MONEY
)
AS
BEGIN
	SELECT * FROM Products(NOLOCK) WHERE UnitPrice = @PRICE
	RETURN @@ROWCOUNT
END

EXEC sp_get_Product 18


DECLARE @RESULT INT
EXEC @RESULT = sp_get_Product 18
SELECT @RESULT

-- OUTPUT PARAMS
go;

CREATE PROCEDURE sp_get_Product2
(
	@PRICE MONEY,
	@PRODUCT_NAME NVARCHAR(MAX) OUTPUT
)
AS
BEGIN
	SELECT TOP 1 @PRODUCT_NAME = ProductName FROM Products(NOLOCK) WHERE UnitPrice = @PRICE	
END

-- USAGE

DECLARE @NEW_PRICE MONEY, @NAME NVARCHAR(MAX)
EXEC sp_get_Product2 18, @NAME OUTPUT
SELECT @NAME 


---- Ornekler

-- TEMP TABLE

SELECT *
FROM dbo.Categories

CREATE TABLE #Categories_TEMP
(
	CATEGORY_NAME NVARCHAR(15),
	CATEGORY_DESCRIPTION NVARCHAR(MAX)
)

SELECT *
FROM #Categories_TEMP

INSERT INTO #Categories_TEMP(CATEGORY_NAME,CATEGORY_DESCRIPTION)
SELECT CategoryName,Description
FROM Categories

go;


CREATE PROCEDURE SelectAllCategories 
AS
	
	SELECT * FROM #Categories_TEMP

GO;

go;

EXEC SelectAllCategories
go;

CREATE PROC SelectCategoriesByName
	@CategoryName NVARCHAR(15)
AS
	SELECT * FROM #Categories_TEMP(NOLOCK) WHERE CATEGORY_NAME = @CategoryName


EXEC dbo.SelectCategoriesByName 'X'

go;

CREATE PROC SelectCategoriesByName2
	@CategoryName NVARCHAR(15) = NULL
AS
	SELECT * FROM #Categories_TEMP(NOLOCK) WHERE CATEGORY_NAME = @CategoryName


EXEC dbo.SelectCategoriesByName2 

go;

----------------

CREATE PROC CATEGORY_EXECUTE
	@CAT_NAME NVARCHAR(MAX),
	@CAT_DESC NVARCHAR(MAX)
AS

IF EXISTS(SELECT TOP 1 CATEGORY_NAME FROM #Categories_TEMP WHERE CATEGORY_NAME = @CAT_NAME)
BEGIN
	UPDATE #Categories_TEMP
	SET CATEGORY_DESCRIPTION = @CAT_DESC
	WHERE CATEGORY_NAME = @CAT_NAME

	--RAISERROR ('Girilen sayı çift sayı değil..',10,1)

END
ELSE
BEGIN
	
	INSERT #Categories_TEMP
	VALUES (@CAT_NAME,@CAT_DESC)

END

EXECUTE dbo.CATEGORY_EXECUTE 'X','UPDATED X'

EXECUTE dbo.CATEGORY_EXECUTE 'Y','UPDATED Y'

SELECT * FROM #Categories_TEMP(NOLOCK) WHERE CATEGORY_NAME = 'Y'



-- ALTER SP

go;

ALTER PROC CATEGORY_EXECUTE
(
	@CAT_NAME NVARCHAR(MAX),
	@CAT_DESC NVARCHAR(MAX),
	@INSERTED BIT OUTPUT
)
AS

IF EXISTS(SELECT TOP 1 CATEGORY_NAME FROM #Categories_TEMP WHERE CATEGORY_NAME = @CAT_NAME)
BEGIN
	UPDATE #Categories_TEMP
	SET CATEGORY_DESCRIPTION = @CAT_DESC
	WHERE CATEGORY_NAME = @CAT_NAME

	SET @INSERTED = 0;

END
ELSE
BEGIN
	
	INSERT #Categories_TEMP
	VALUES (@CAT_NAME,@CAT_DESC)

	SET @INSERTED = 1;

END

go;

DECLARE @RESULT BIT;

EXEC CATEGORY_EXECUTE 'ZX','ZX',@RESULT OUTPUT

SELECT @RESULT AS SONUC

-----


DROP PROC CATEGORY_EXECUTE

---
go;
CREATE SCHEMA SMO
go;

CREATE PROC SMO.CHECK_CATEGORY
(
	@CAT_NAME NVARCHAR(15)
)
AS
BEGIN
	SELECT * FROM Categories WHERE CategoryName = @CAT_NAME
END

go;
ALTER PROC SMO.CHECK_CATEGORY
(
	@CAT_NAME NVARCHAR(15)
)
AS
BEGIN
	SELECT * FROM Categories WHERE CategoryName = @CAT_NAME
	RETURN @@ROWCOUNT
END


DECLARE @RETURN_VALUE INT
EXEC @RETURN_VALUE = SMO.CHECK_CATEGORY 'FFFF'
SELECT @RETURN_VALUE AS RETURN_VALUE




