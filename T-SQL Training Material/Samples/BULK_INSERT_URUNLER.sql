USE [MyCompany]
GO


CREATE TABLE [dbo].[URUNLER_2019](
	[URUN_KODU] [nvarchar](18) NOT NULL,
	[MAGAZA] [nvarchar](4) NOT NULL,
	[DEPO] [nvarchar](4) NOT NULL,
	[ISLEM_TIPI] [nvarchar](3) NOT NULL,
	[MLZ_BELGE] [nvarchar](max) NULL,
	[ISLEM_TARIHI] [nvarchar](max) NOT NULL,
	[MIKTAR] [nvarchar](max) NOT NULL,
	[BIRIM] [nvarchar](2) NULL,
	[MAGAZA_ADI] [nvarchar](max) NOT NULL,
	[IRSALIYE] [nvarchar](max) NULL,
	[URUN_TANIMI] [nvarchar](max) NOT NULL,
	[TUTAR] [nvarchar](max) NOT NULL,
	[SAS_NO] [nvarchar](max) NULL,
	[SATICI_KODU] [nvarchar](10) NOT NULL,
	[GIRIS_SAATI] [time](7) NOT NULL,
	[BOLGE] [nvarchar](4) NOT NULL,
	[BOLGE_ADI] [nvarchar](max) NOT NULL,
	[GIRIS_TARIHI] [nvarchar](10) NULL,
	[KDVLI_TUTAR] [nvarchar](max) NOT NULL,
	[column20] [nvarchar](1) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO


	BULK INSERT [dbo].[URUNLER_2019]
	FROM 'C:\FAVORIYE_GIDEN_URUNLER_2019.csv'
	WITH (
		FIRSTROW = 2,
		FIELDTERMINATOR = ';',
		ROWTERMINATOR='\n' ,
		BATCHSIZE = 100000
		);
