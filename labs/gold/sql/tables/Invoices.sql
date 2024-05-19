DROP TABLE IF EXISTS [fact].[Invoices]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [fact].[Invoices]
(
	[InvoiceID] [int]  NOT NULL,
	[InvoiceLineID] [int]  NOT NULL,
	[CustomerID] [int]  NULL,
	[SalespersonPersonID] [int]  NULL,
	[InvoiceDate] [date]  NULL,
	[StockItemID] [int]  NULL,
	[Quantity] [int]  NULL,
	[UnitPrice] [decimal](18,2)  NULL,
	[TaxRate] [decimal](18,3)  NULL,
	[TaxAmount] [decimal](18,2)  NULL,
	[LineProfit] [decimal](18,2)  NULL,
	[ExtendedPrice] [decimal](18,2)  NULL,
	[lastupdate] [datetime2](6) NOT NULL
)
GO

ALTER TABLE [fact].[Invoices] ADD CONSTRAINT [PK_Invoices] PRIMARY KEY NONCLUSTERED (InvoiceID,InvoiceLineID) NOT ENFORCED
GO