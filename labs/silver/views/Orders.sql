DROP VIEW IF EXISTS [dbo].[vw_Orders]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE VIEW [dbo].[vw_Orders]
AS SELECT
    [OrderID]
    ,[OrderLineID]
    ,[CustomerID]
    ,[SalespersonPersonID]
    ,[OrderDate]
    ,[StockItemID]
    ,[Quantity]
    ,[UnitPrice]
    ,[TaxRate]
FROM [silver_WWI].[dbo].[orders]


GO

