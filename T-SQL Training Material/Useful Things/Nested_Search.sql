DECLARE @text1 VARCHAR(MAX),
        @text2 VARCHAR(MAX),
        @text3 VARCHAR(MAX),
        @text4 VARCHAR(MAX),
        @text5 VARCHAR(MAX),
        @dbname VARCHAR(64)
        
SET @dbname='DB_NAME'
SET @text1='TEXT1_TO_SEARCH'
SET @text2='TEXT2_TO_SEARCH'
SET @text3='TEXT3_TO_SEARCH'
SET @text4='TEXT4_TO_SEARCH'
SET @text5='TEXT5_TO_SEARCH'
   
DECLARE @sql VARCHAR(MAX)  
SELECT @sql = ''
   
SELECT @sql = @sql + 'SELECT * FROM ('
SELECT @sql = @sql + 'SELECT * FROM ('
SELECT @sql = @sql + 'SELECT * FROM ('
SELECT @sql = @sql + 'SELECT * FROM ('
   
select @sql = @sql + 'SELECT ''' + @dbname + ''' AS db, o.name,m.definition '  
select @sql = @sql + ' FROM '+@dbname+'.sys.sql_modules m '  
select @sql = @sql + ' INNER JOIN '+@dbname+'..sysobjects o on m.object_id=o.id'  
select @sql = @sql + ' WHERE [definition] LIKE ''%'+@text1+'%'''  
   
SELECT @sql = @sql + ' ) X WHERE [definition] LIKE ''%'+@text2+'%'''
SELECT @sql = @sql + ' ) X WHERE [definition] LIKE ''%'+@text3+'%'''
SELECT @sql = @sql + ' ) X WHERE [definition] LIKE ''%'+@text4+'%'''
SELECT @sql = @sql + ' ) X WHERE [definition] LIKE ''%'+@text5+'%'''
   
--PRINT @sql
execute (@sql)  