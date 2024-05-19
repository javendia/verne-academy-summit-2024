DROP VIEW IF EXISTS [dbo].[vw_People_Changes]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO













CREATE VIEW [dbo].[vw_People_Changes]
AS     
    SELECT
        src.[PersonID]
        ,src.[FullName]
        ,src.[PreferredName]
        ,src.[LogonName]
        ,src.[IsEmployee]
        ,src.[IsSalesperson]
        ,src.[PhoneNumber]
        ,src.[FaxNumber]
        -- Si el identificador existe en el destino, se trata de una actualización
        -- En caso contrario, es una inserción
        ,CASE WHEN tgt.[PersonID] IS NULL THEN 1 ELSE 2 END AS [type_op]
    FROM
    (
            SELECT 
                [PersonID]
                ,[FullName]
                ,[PreferredName]
                ,[LogonName]
                ,[IsEmployee]
                ,[IsSalesperson]
                ,[PhoneNumber]
                ,[FaxNumber]
            FROM [silver_WWI].[dbo].[vw_People] src
            EXCEPT -- Filas no coincidentes en destino
            SELECT 
                [PersonID]
                ,[FullName]
                ,[PreferredName]
                ,[LogonName]
                ,[IsEmployee]
                ,[IsSalesperson]
                ,[PhoneNumber]
                ,[FaxNumber]
            FROM [gold_WWI].[dim].[People] AS tgt
    ) src
    LEFT JOIN [gold_WWI].[dim].[People] AS tgt ON tgt.[PersonID] = src.[PersonID]






GO

