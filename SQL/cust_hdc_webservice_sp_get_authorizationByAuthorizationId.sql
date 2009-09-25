USE [ArenaDB]
GO
/****** Object:  StoredProcedure [dbo].[cust_hdc_webservice_sp_get_authorizationByAuthorizationId]    Script Date: 09/17/2009 10:53:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE Proc [dbo].[cust_hdc_webservice_sp_get_authorizationByAuthorizationId]
	@AuthorizationId int
AS

	SELECT [wa].*
		FROM cust_hdc_webservice_authorization AS wa
		WHERE [wa].authorization_id = @AuthorizationId
