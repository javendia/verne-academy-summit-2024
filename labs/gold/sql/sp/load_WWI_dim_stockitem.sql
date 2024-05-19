DROP PROCEDURE IF EXISTS [etl].[load_WWI_dim_stockitem]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO











CREATE PROC [etl].[load_WWI_dim_stockitem]
AS
BEGIN



    UPDATE tgt
    SET
        tgt.StockItemName = src.StockItemName
        ,tgt.ColorName = src.ColorName
        ,tgt.Brand = src.Brand
        ,tgt.Size = src.Size   
        ,tgt.Barcode = src.Barcode
        ,tgt.TaxRate = src.TaxRate
        ,tgt.lastupdate = GETDATE()
    FROM [gold_WWI].[dim].[StockItem] AS tgt
    INNER JOIN [silver_WWI].[dbo].[vw_StockItem_Changes] src ON tgt.[StockItemID] = src.[StockItemID]


    PRINT CAST(@@ROWCOUNT AS VARCHAR) + ' filas actualizadas.'

    INSERT INTO [gold_WWI].[dim].[StockItem]
    SELECT                 
        [StockItemID]
        ,[StockItemName]
        ,[ColorName]
        ,[Brand]
        ,[Size]
        ,[Barcode]
        ,[TaxRate]
        ,GETDATE() AS [lastupdate]
    FROM [silver_WWI].[dbo].[vw_StockItem_Changes]
    WHERE [type_op] = 1

    PRINT CAST(@@ROWCOUNT AS VARCHAR) + ' filas insertadas.'

END






GO

