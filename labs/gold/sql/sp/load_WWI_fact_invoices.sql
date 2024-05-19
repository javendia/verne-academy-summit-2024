DROP PROCEDURE IF EXISTS [etl].[load_WWI_fact_invoices]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO













CREATE PROC [etl].[load_WWI_fact_invoices]
AS
BEGIN



    UPDATE tgt
    SET
        tgt.CustomerID = src.CustomerID
        ,tgt.SalespersonPersonID = src.SalespersonPersonID
        ,tgt.InvoiceDate = src.InvoiceDate
        ,tgt.StockItemID = src.StockItemID
        ,tgt.Quantity = src.Quantity
        ,tgt.UnitPrice = src.UnitPrice
        ,tgt.TaxRate = src.TaxRate
        ,tgt.TaxAmount = src.TaxAmount
        ,tgt.LineProfit = src.LineProfit
        ,tgt.ExtendedPrice = src.ExtendedPrice
        ,tgt.lastupdate = GETDATE()
    FROM [gold_WWI].[fact].[Invoices] AS tgt
    INNER JOIN [silver_WWI].[dbo].[vw_Invoices_Changes] src ON tgt.[InvoiceID] = src.[InvoiceID] AND tgt.[InvoiceLineID] = src.[InvoiceLineID]


    PRINT CAST(@@ROWCOUNT AS VARCHAR) + ' filas actualizadas.'

    INSERT INTO [gold_WWI].[fact].[Invoices]
    SELECT                 
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
        ,GETDATE() AS [lastupdate]
    FROM [silver_WWI].[dbo].[vw_Invoices_Changes]
    WHERE [type_op] = 1

    PRINT CAST(@@ROWCOUNT AS VARCHAR) + ' filas insertadas.'

END







GO

