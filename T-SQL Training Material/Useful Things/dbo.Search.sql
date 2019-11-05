-- Veritabanı nesne içerikleri
SELECT * FROM sys.syscomments(NOLOCK)
 
-- Şema isimlerinin tutulduğu tablo
SELECT * FROM sys.schemas(NOLOCK)
 
-- Bütün veritabanı nesne isimleri
SELECT * FROM sys.all_objects(NOLOCK)
 
-- ana select ifadesi 
SELECT  S.name AS SP_SCHEMA,
        O.name AS SP_NAME,
        C.text AS SP_TEXT
FROM sys.syscomments(NOLOCK) AS C
    JOIN sys.all_objects(NOLOCK) AS O
        ON C.id = O.object_id
    JOIN sys.schemas AS S
        ON S.schema_id = O.schema_id
WHERE O.type in ('P','FN','IF','FS','AF','X','TF','TR','PC') AND
      C.text like '%' + 'ARANACAK KELIME' + '%'
      
      