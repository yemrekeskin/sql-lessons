
-- TRAN = TRANSACTION
-- COMMIT   -- ONAYLAMA
-- ROLLBACK -- GERI-DÖNÜŞ
-- NESTED TRANSACTION
-- SAVE TRAN -- Kısmi Commit - Rollback


SELECT @@TRANCOUNT --Transaction sayısı

DBCC Opentran -- Çalışmakta olan bir transaction hakkında bilgi edinebilmek için ise aşagıdaki kodu yazıyoruz;

USE Northwind

BEGIN TRAN 
DELETE FROM [dbo].[LOGS] 
-- Transaction Başlatıp sonlandırmadığınızda siz ve buna bağlı olarak diğer kullanıcılar
-- Bu tabloya erişmek istediğinde hata alınacak ve tablo verilerine erişemeyeceksiniz
-- O yüzden Transactionlar çok doğru kullanılmalıdır,
-- Sistem kesintisine yok açabilir

COMMIT -- Transaction'ı sonlandırır ve yapılan işlemin fiziksel olarak tabloya yansıtılmasını sağlar.

ROLLBACK -- Transaction'ı sonlandırır ve yapılan işlemi geri alır


-- ORNEK

-- ADIM 1
CREATE TABLE Accounts
(
    AccountID   CHAR(10) PRIMARY KEY NOT NULL,
    FirstName   VARCHAR(50),
    LastName    VARCHAR(50),
    Branch  INT,
    Balance MONEY
);

-- ADIM 2
INSERT INTO Accounts
VALUES('0000065127','Cihan','Özhan', 489, 10000),
      ('0000064219','Ali','Veli', 489, 500),
      ('0000068233','Hasan','Hseyin', 252, 5844);

go;

-- ADIM 3

CREATE PROC sp_MoneyTransfer(
    @PurchaserID    CHAR(10),
    @SenderID       CHAR(10),
    @Amount         MONEY,
    @retVal         INT OUT
)
AS
BEGIN
    DECLARE @inControl MONEY;
    SELECT @inControl = Balance FROM Accounts WHERE AccountID = @SenderID;

    IF @inControl >= @Amount
    BEGIN

        BEGIN TRANSACTION
            UPDATE Accounts
            SET Balance = Balance - @Amount
            WHERE AccountID = @SenderID

        IF @@ERROR <> 0
        ROLLBACK

        UPDATE Accounts
        SET Balance = Balance + @Amount
        WHERE AccountID = @PurchaserID

        IF @@ERROR <> 0
			ROLLBACK

        COMMIT
    END
    ELSE
    BEGIN
        SET @retVal = -1;
        RETURN @retVal;
    END
END;



go;

DECLARE @rVal INT;
EXEC sp_MoneyTransfer '0000064219','0000065127',500, @rVal out;
SELECT @rVal;


-- ORNEK 2

SELECT * FROM [dbo].[Categories]

BEGIN TRANSACTION

UPDATE Categories SET CategoryName = 'isim5' 
WHERE CategoryID = 1

UPDATE Categories SET CategoryName = 'isim6'
WHERE CategoryID = 2 

-- Yukarıdaki işleme göre etkilenen kayıt sayısı iki olduğunda işlemi gerçekleştir
-- Diğer durumda yapılan işlemi geri al
IF @@ROWCOUNT = 2  
 COMMIT TRAN
ELSE
 ROLLBACK TRAN


 -- ORNEK 3

 -- UPDATE işlemi yapılırken hata alınmazsa işlemmi yap
 -- Hata alınırsa yapılan işlemi geri al
BEGIN TRAN
BEGIN TRY

	UPDATE Categories SET CategoryName = 'isim5' 
	WHERE CategoryID = 1

	UPDATE Categories SET CategoryName = 'isim6'
	WHERE CategoryID = 2 

	COMMIT TRAN
END TRY
BEGIN CATCH
	ROLLBACK TRAN
END CATCH

--- ORNEK 4

SELECT * FROM [dbo].[Categories]

BEGIN TRAN TRAN_1
	UPDATE Categories SET CategoryName = 'isim6'
	WHERE CategoryID = 2 

ROLLBACK TRAN TRAN_1;




