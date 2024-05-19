DROP VIEW IF EXISTS [dbo].[vw_StockItem]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE VIEW [dbo].[vw_StockItem]
AS SELECT
    [StockItemID]
    ,[StockItemName]
    ,ISNULL(c.[ColorName], 'N/A') AS [ColorName]
    ,[Brand]
    ,[Size]
    ,[Barcode]
    ,[TaxRate]
FROM [silver_WWI].[dbo].[stock_items] si
LEFT JOIN [silver_WWI].[dbo].[colors] c ON c.[ColorID] = si.[ColorID]

GO

