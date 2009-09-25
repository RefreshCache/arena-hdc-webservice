USE [ArenaDB]
GO
/****** Object:  StoredProcedure [dbo].[cust_hdc_webservice_sp_get_authorizationByApiKey]    Script Date: 09/17/2009 10:52:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE Proc [dbo].[cust_hdc_webservice_sp_get_authorizationByApiKey]
	@ApiKey uniqueidentifier
AS

	SELECT [wa].*
		FROM cust_hdc_webservice_authorization AS wa
		WHERE [wa].apikey = @ApiKey
		  AND [wa].expires > GETDATE()
