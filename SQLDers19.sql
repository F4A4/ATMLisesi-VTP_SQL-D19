SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE TRIGGER trgSilineniYedekle
   ON  tblUrunSatis
   AFTER DELETE
AS 
BEGIN
     DECLARE @ID int
	 DECLARE @Ad nvarchar(50)
	 DECLARE @Adet int
	 DECLARE @Fiyat money
	 DECLARE @KDVoran tinyint
	 DECLARE @KDVliFiyat money 
	 DECLARE @Tutar money
	 
	 SELECT  @ID=ID,
	         @Ad=Ad,
			 @Adet=Adet,
			 @Fiyat=Fiyat,
			 @KDVoran=KDVoran,
			 @KDVliFiyat=KDVliFiyat*Fiyat+Fiyat,
			 @Tutar=@KDVliFiyat*Adet
			 from deleted
	 SET NOCOUNT ON;
	 insert into tblSilineniYedekle values (@ID,@Ad,@Adet,@Fiyat,@KDVoran,@KDVliFiyat,@Tutar)

END
GO
