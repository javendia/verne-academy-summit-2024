DROP VIEW IF EXISTS [dbo].[vw_Orders_Changes]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO













CREATE VIEW [dbo].[vw_Orders_Changes]
AS     
    SELECT
        src.[OrderID]
        ,src.[OrderLineID]
        ,src.[CustomerID]
        ,src.[SalespersonPersonID]
        ,src.[OrderDate]
        ,src.[StockItemID]
        ,src.[Quantity]
        ,src.[UnitPrice]
        ,src.[TaxRate]
        -- Si el identificador existe en el destino, se trata de una actualización
        -- En caso contrario, es una inserción
        ,CASE WHEN tgt.[OrderID] IS NULL THEN 1 ELSE 2 END AS [type_op]
    FROM
    (
            SELECT 
                [OrderID]
                ,[OrderLineID]
                ,[CustomerID]
                ,[SalespersonPersonID]
                ,[OrderDate]
                ,[StockItemID]
                ,[Quantity]
                ,[UnitPrice]
                ,[TaxRate]
            FROM [silver_WWI].[dbo].[vw_Orders] src
            EXCEPT -- Filas no coincidentes en destino
            SELECT 
                [OrderID]
                ,[OrderLineID]
                ,[CustomerID]
                ,[SalespersonPersonID]
                ,[OrderDate]
                ,[StockItemID]
                ,[Quantity]
                ,[UnitPrice]
                ,[TaxRate]
            FROM [gold_WWI].[fact].[Orders] AS tgt
    ) src
    LEFT JOIN [gold_WWI].[fact].[Orders] AS tgt ON tgt.[OrderID] = src.[OrderID] AND tgt.[OrderLineID] = src.[OrderLineID]






GO

