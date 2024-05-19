DROP VIEW IF EXISTS [dbo].[vw_Invoices_Changes]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO













CREATE VIEW [dbo].[vw_Invoices_Changes]
AS     
    SELECT
        src.[InvoiceID]
            ,src.[InvoiceLineID]
            ,src.[CustomerID]
            ,src.[SalespersonPersonID]
            ,src.[InvoiceDate]
            ,src.[StockItemID]
            ,src.[Quantity]
            ,src.[UnitPrice]
            ,src.[TaxRate]
            ,src.[TaxAmount]
            ,src.[LineProfit]
            ,src.[ExtendedPrice]
        -- Si el identificador existe en el destino, se trata de una actualización
        -- En caso contrario, es una inserción
        ,CASE WHEN tgt.[InvoiceID] IS NULL THEN 1 ELSE 2 END AS [type_op]
    FROM
    (
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
            FROM [silver_WWI].[dbo].[vw_Invoices] src
            EXCEPT -- Filas no coincidentes en destino
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
            FROM [gold_WWI].[fact].[Invoices] AS tgt
    ) src
    LEFT JOIN [gold_WWI].[fact].[Invoices] AS tgt ON tgt.[InvoiceID] = src.[InvoiceID] AND tgt.[InvoiceLineID] = src.[InvoiceLineID]






GO

