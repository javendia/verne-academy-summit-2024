DROP TABLE IF EXISTS [fact].[Orders]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [fact].[Orders]
(
	[OrderID] [int]  NOT NULL,
	[OrderLineID] [int]  NOT NULL,
	[CustomerID] [int]  NULL,
	[SalespersonPersonID] [int]  NULL,
	[OrderDate] [date]  NULL,
	[StockItemID] [int]  NULL,
	[Quantity] [int]  NULL,
	[UnitPrice] [decimal](18,2)  NULL,
	[TaxRate] [int]  NULL,
	[lastupdate] [datetime2](6) NOT NULL
)
GO

ALTER TABLE [fact].[Orders] ADD CONSTRAINT [PK_Orders] PRIMARY KEY NONCLUSTERED (OrderID,OrderLineID) NOT ENFORCED
GO