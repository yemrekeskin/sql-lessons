GO
/****** Object:  StoredProcedure [dbo].[INSERT]    Script Date:  ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--drop proc [dbo].[INSERT] 

CREATE procedure  [dbo].[INSERT]                              
(                                                          
   @Query  Varchar(MAX)                                                          
)                              

AS                              

SET nocount ON                  

DECLARE @WithStrINdex AS INT                            
DECLARE @WHEREStrINdex AS INT                            
DECLARE @INDExtouse AS INT                            

DECLARE @SchemaANDTAble VArchar(270)                            
DECLARE @Schema_name  varchar(30)                            
DECLARE @Table_name  varchar(240)                            
DECLARE @Condition  Varchar(MAX)                             

SET @WithStrINdex=0                            

SELECT @WithStrINdex=CHARINDEX('With',@Query )                            
, @WHEREStrINdex=CHARINDEX('WHERE', @Query)                            

IF(@WithStrINdex!=0)                            
SELECT @INDExtouse=@WithStrINdex                            
ELSE                            
SELECT @INDExtouse=@WHEREStrINdex                            

SELECT @SchemaANDTAble=LEFT (@Query,@INDExtouse-1)                                                     
SELECT @SchemaANDTAble=LTRIM (RTRIM( @SchemaANDTAble))                            

SELECT @Schema_name= LEFT (@SchemaANDTAble, CharINdex('.',@SchemaANDTAble )-1)                            
,      @Table_name = SUBSTRING(  @SchemaANDTAble , CharINdex('.',@SchemaANDTAble )+1,LEN(@SchemaANDTAble) )                            

,      @Condition=SUBSTRING(@Query,@WHEREStrINdex+6,LEN(@Query))--27+6                            


DECLARE   @COLUMNS  table (Row_number SmallINT , Column_Name VArchar(Max) )                              
DECLARE @CONDITIONS AS varchar(MAX)                              
DECLARE @Total_Rows AS SmallINT                              
DECLARE @Counter AS SmallINT              


DECLARE @ComaCol AS varchar(MAX)            
SELECT @ComaCol=''                   

SET @Counter=1                              
SET @CONDITIONS=''                              

INsert INTO @COLUMNS                              
SELECT  Row_number()Over (Order by ORDINAL_POSITION ) [Count] ,Column_Name FROM INFORMATION_SCHEMA.columns WHERE Table_schema=@Schema_name                              
AND table_name=@Table_name         
AND Column_Name NOT IN ('FTP_PASSWORD','FTP_ENCRYPTED_PASSWORD')                  

SELECT @Total_Rows= Count(1) FROM  @COLUMNS                              

             SELECT @Table_name= '['+@Table_name+']'                      

             SELECT @Schema_name='['+@Schema_name+']'                      

While (@Counter<=@Total_Rows )                              
begIN                               
--PRINT @Counter                              

    SELECT @ComaCol= @ComaCol+'['+Column_Name+'],'            
    FROM @COLUMNS                              
WHERE [Row_number]=@Counter                          

SELECT @CONDITIONS=@CONDITIONS+ ' +Case When ['+Column_Name+'] is null then ''Null'' Else ''''''''+                              

 Replace( Convert(varchar(Max),['+Column_Name+']  ) ,'''''''',''''  )                              

  +'''''''' end+'+''','''                              

FROM @COLUMNS                              
WHERE [Row_number]=@Counter   
AND Column_name NOT IN ('FTP_PASSWORD','FTP_ENCRYPTED_PASSWORD')                           

SET @Counter=@Counter+1                              

End                              

SELECT @CONDITIONS=RIGHT(@CONDITIONS,LEN(@CONDITIONS)-2)                              

SELECT @CONDITIONS=LEFT(@CONDITIONS,LEN(@CONDITIONS)-4)              
SELECT @ComaCol= substrINg (@ComaCol,0,  len(@ComaCol) )                            

SELECT @CONDITIONS= '''INSERT INTO '+@Schema_name+'.'+@Table_name+ '('+@ComaCol+')' +' Values( '+'''' + '+'+@CONDITIONS                              

SELECT @CONDITIONS=@CONDITIONS+'+'+ ''')'''                              


--PrINt(@Condition) 
SELECT @CONDITIONS= 'SELECT  '+@CONDITIONS +'FROM  ' +@Schema_name+'.'+@Table_name+' With(NOLOCK) ' + ' WHERE '+@Condition                              
--prINt(@CONDITIONS)                              
Exec(@CONDITIONS)


/****** Kullanımı  ******/
EXEC [dbo].[INSERT] 'dbo.TABLE WHERE COLUMN_NAME=''TEXT'''
