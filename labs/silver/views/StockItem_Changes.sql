DROP VIEW IF EXISTS [dbo].[vw_StockItem_Changes]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO













CREATE VIEW [dbo].[vw_StockItem_Changes]
AS     
    SELECT
        src.[StockItemID]
        ,src.[StockItemName]
        ,src.[ColorName]
        ,src.[Brand]
        ,src.[Size]
        ,src.[Barcode]
        ,src.[TaxRate]
        -- Si el identificador existe en el destino, se trata de una actualización
        -- En caso contrario, es una inserción
        ,CASE WHEN tgt.[StockItemID] IS NULL THEN 1 ELSE 2 END AS [type_op]
    FROM
    (
            SELECT 
                [StockItemID]
                ,[StockItemName]
                ,[ColorName]
                ,[Brand]
                ,[Size]
                ,[Barcode]
                ,[TaxRate]
            FROM [silver_WWI].[dbo].[vw_StockItem] src
            EXCEPT -- Filas no coincidentes en destino
            SELECT 
                [StockItemID]
                ,[StockItemName]
                ,[ColorName]
                ,[Brand]
                ,[Size]
                ,[Barcode]
                ,[TaxRate]
            FROM [gold_WWI].[dim].[StockItem] AS tgt
    ) src
    LEFT JOIN [gold_WWI].[dim].[StockItem] AS tgt ON tgt.[StockItemID] = src.[StockItemID]






GO

