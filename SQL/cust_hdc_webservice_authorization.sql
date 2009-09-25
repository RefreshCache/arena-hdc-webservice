USE [ArenaDB]
GO
/****** Object:  Table [dbo].[cust_hdc_webservice_authorization]    Script Date: 09/17/2009 10:55:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cust_hdc_webservice_authorization](
	[authorization_id] [int] IDENTITY(1,1) NOT NULL,
	[apikey] [uniqueidentifier] NOT NULL,
	[login_id] [varchar](50) NOT NULL,
	[temporary] [bit] NOT NULL CONSTRAINT [DF_cust_hdc_webservice_authorization_temporary]  DEFAULT ((1)),
	[expires] [datetime] NULL,
 CONSTRAINT [PK_cust_hdc_webservice_authorization] PRIMARY KEY CLUSTERED 
(
	[authorization_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[cust_hdc_webservice_authorization]  WITH CHECK ADD  CONSTRAINT [FK_cust_hdc_webservice_authorization_cust_hdc_webservice_authorization] FOREIGN KEY([authorization_id])
REFERENCES [dbo].[cust_hdc_webservice_authorization] ([authorization_id])
GO
ALTER TABLE [dbo].[cust_hdc_webservice_authorization] CHECK CONSTRAINT [FK_cust_hdc_webservice_authorization_cust_hdc_webservice_authorization]