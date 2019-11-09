
SELECT * FROM [dbo].[Categories]

--Kod içinde kullanılan değişken tanımlanır.
DECLARE @KategoriAd NVARCHAR(100)
--Cursor tanımlanır
DECLARE Cursorumuz CURSOR
FOR
    SELECT  CategoryName
    FROM    dbo.Categories

--Cursor kullanım için açılır
OPEN Cursorumuz
--Satırlarda cursorumuzun ilerleme kısmı	
FETCH NEXT FROM Cursorumuz 
--İlerleyen kategoriadları @KategoriAd değişkenine atanır
INTO @KategoriAd

--While komutuyla kayıtlarda dolaşma imkanı buluruz. 
-- Eğer FETCH_STATUS 0 ise kayıt başarılı, -1 ise kayıt başarısız, -2 ise kayıt bulunamadığını gösterir.
WHILE @@FETCH_STATUS = 0

--Begin ve end başla bitir kısımlarıdır.
    BEGIN
  --Bu kısımda satır satır alınan kayıtlarla istenilen işlem yapılabilir. Yani işlem yapılma kısmı burası

        SELECT  CategoryName
        FROM    dbo.Categories
        WHERE   CategoryName = @KategoriAd

        FETCH NEXT FROM Cursorumuz INTO @KategoriAd
    END
--İşlem yapılan datayı serbest bırakır. Tablo üstündeki kilit işlemini kaldırır.
CLOSE Cursorumuz
--Cursorumuzu yok eder
DEALLOCATE Cursorumuz
