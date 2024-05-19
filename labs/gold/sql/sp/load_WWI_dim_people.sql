DROP PROCEDURE IF EXISTS [etl].[load_WWI_dim_people]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO











CREATE PROC [etl].[load_WWI_dim_people]
AS
BEGIN



    UPDATE tgt
    SET
        tgt.FullName = src.FullName
        ,tgt.PreferredName = src.PreferredName
        ,tgt.LogonName = src.LogonName
        ,tgt.IsEmployee = src.IsEmployee
        ,tgt.IsSalesperson = src.IsSalesperson
        ,tgt.PhoneNumber = src.PhoneNumber
        ,tgt.FaxNumber = src.FaxNumber
        ,tgt.lastupdate = GETDATE()
    FROM [gold_WWI].[dim].[People] AS tgt
    INNER JOIN [silver_WWI].[dbo].[vw_People_Changes] src ON tgt.[PersonID] = src.[PersonID]


    PRINT CAST(@@ROWCOUNT AS VARCHAR) + ' filas actualizadas.'

    INSERT INTO [gold_WWI].[dim].[People]
    SELECT                 
        [PersonID]
        ,[FullName]
        ,[PreferredName]
        ,[LogonName]
        ,[IsEmployee]
        ,[IsSalesperson]
        ,[PhoneNumber]
        ,[FaxNumber]
        ,GETDATE() AS [lastupdate]
    FROM [silver_WWI].[dbo].[vw_People_Changes]
    WHERE [type_op] = 1

    PRINT CAST(@@ROWCOUNT AS VARCHAR) + ' filas insertadas.'

END






GO

