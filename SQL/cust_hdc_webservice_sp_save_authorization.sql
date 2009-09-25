USE [ArenaDB]
GO
/****** Object:  StoredProcedure [dbo].[cust_hdc_webservice_sp_save_authorization]    Script Date: 09/17/2009 10:54:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE Proc [dbo].[cust_hdc_webservice_sp_save_authorization]
	@AuthorizationId int,
	@LoginId varchar(50),
	@Temporary bit,
	@Expires datetime,
	@ID int OUTPUT
AS

	IF NOT EXISTS(
		SELECT * FROM cust_hdc_webservice_authorization
		WHERE [authorization_id] = @AuthorizationId
		)
		
	BEGIN
		DECLARE @NewKey uniqueidentifier
		SET @NewKey = NEWID()

		INSERT INTO cust_hdc_webservice_authorization
		(
			 [apikey]
			,[login_id]
			,[temporary]
			,[expires]
		)
		values
		(
			 @NewKey
			,@LoginId
			,@Temporary
			,@Expires
		)

		SET @ID = @@IDENTITY

	END
	ELSE
	BEGIN

		UPDATE cust_hdc_webservice_authorization Set
			 [expires] = @Expires
		WHERE [authorization_id] = @AuthorizationId

		SET @ID = @AuthorizationId

	END

