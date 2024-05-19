DROP PROCEDURE IF EXISTS [etl].[load_WWI_fact_orders]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO













CREATE PROC [etl].[load_WWI_fact_orders]
AS
BEGIN



    UPDATE tgt
    SET
        tgt.CustomerID = src.CustomerID
        ,tgt.SalespersonPersonID = src.SalespersonPersonID
        ,tgt.OrderDate = src.OrderDate
        ,tgt.StockItemID = src.StockItemID
        ,tgt.Quantity = src.Quantity
        ,tgt.UnitPrice = src.UnitPrice
        ,tgt.TaxRate = src.TaxRate
        ,tgt.lastupdate = GETDATE()
    FROM [gold_WWI].[fact].[Orders] AS tgt
    INNER JOIN [silver_WWI].[dbo].[vw_Orders_Changes] src ON tgt.[OrderID] = src.[OrderID] AND tgt.[OrderLineID] = src.[OrderLineID]


    PRINT CAST(@@ROWCOUNT AS VARCHAR) + ' filas actualizadas.'

    INSERT INTO [gold_WWI].[fact].[Orders]
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
        ,GETDATE() AS [lastupdate]
    FROM [silver_WWI].[dbo].[vw_Orders_Changes]
    WHERE [type_op] = 1

    PRINT CAST(@@ROWCOUNT AS VARCHAR) + ' filas insertadas.'

END







GO

