DROP TABLE IF EXISTS [dim].[Customer]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dim].[Customer]
(
	[CustomerID] [int]  NOT NULL,
	[CustomerName] [varchar](500)  NULL,
	[CustomerCategoryName] [varchar](500)  NULL,
	[DeliveryMethodName] [varchar](500)  NULL,
	[CreditLimit] [varchar](500)  NULL,
	[PaymentDays] [int]  NULL,
	[PhoneNumber] [varchar](500)  NULL,
	[FaxNumber] [varchar](500)  NULL,
	[DeliveryAddressLine] [varchar](500)  NULL,
	[DeliveryPostalCode] [int]  NULL,
	[PostalAddressLine] [varchar](500)  NULL,
	[PostalPostalCode] [int]  NULL,
	[lastupdate] [datetime2](6) NOT NULL
)
GO

ALTER TABLE [dim].[Customer] ADD CONSTRAINT [PK_Customer] PRIMARY KEY NONCLUSTERED (CustomerID) NOT ENFORCED
GO