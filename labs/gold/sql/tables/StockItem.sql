DROP TABLE IF EXISTS [dim].[StockItem]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dim].[StockItem]
(
	[StockItemID] [int]  NOT NULL,
	[StockItemName] [varchar](500)  NULL,
	[ColorName] [varchar](500)  NULL,
	[Brand] [varchar](500)  NULL,
	[Size] [varchar](500)  NULL,
	[Barcode] [varchar](500)  NULL,
	[TaxRate] [decimal](18,3)  NULL,
	[lastupdate] [datetime2](6) NOT NULL
)
GO

ALTER TABLE [dim].[StockItem] ADD CONSTRAINT [PK_StockItem] PRIMARY KEY NONCLUSTERED (StockItemID) NOT ENFORCED
GO