DROP VIEW IF EXISTS [dbo].[vw_Invoices]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE VIEW [dbo].[vw_Invoices]
AS SELECT
    [InvoiceID]
    ,[InvoiceLineID]
    ,[CustomerID]
    ,[SalespersonPersonID]
    ,[InvoiceDate]
    ,[StockItemID]
    ,[Quantity]
    ,[UnitPrice]
    ,[TaxRate]
    ,[TaxAmount]
    ,[LineProfit]
    ,[ExtendedPrice]
FROM [silver_WWI].[dbo].[invoices]



GO

