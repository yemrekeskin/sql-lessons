
-- TRY-CATCH BLOCK

BEGIN TRY
	SELECT 1/0 AS ERROR
END TRY
BEGIN CATCH
	
	SELECT 
	ERROR_NUMBER() AS ErrorNumber, -- Hata numarasını bilmemizi sağlar, bilgi niteliğindedir
	ERROR_STATE() AS ErrorState, -- hatanın şiddetini verir
	ERROR_SEVERITY() AS ErrorSeverity, -- hatanın kodsal değerini verir
	ERROR_PROCEDURE() AS ErrorProcedure, -- hatanın hangi proc veya trigger da olduğunu verir
	ERROR_LINE() AS ErrorLine, -- hatanın hangi satırda olduğunu verir
	ERROR_MESSAGE() AS ErrorMessage; -- hata mesajı

END CATCH

go;

BEGIN TRY
	DROP TABLE KKKK
END TRY
BEGIN CATCH
	
	SELECT 
	ERROR_NUMBER() AS ErrorNumber, -- Hata numarasını bilmemizi sağlar, bilgi niteliğindedir
	ERROR_STATE() AS ErrorState, -- hatanın şiddetini verir
	ERROR_SEVERITY() AS ErrorSeverity, -- hatanın kodsal değerini verir
	ERROR_PROCEDURE() AS ErrorProcedure, -- hatanın hangi proc veya trigger da olduğunu verir
	ERROR_LINE() AS ErrorLine, -- hatanın hangi satırda olduğunu verir
	ERROR_MESSAGE() AS ErrorMessage; -- hata mesajı

END CATCH