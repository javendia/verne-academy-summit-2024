DROP VIEW IF EXISTS [dbo].[vw_People]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE VIEW [dbo].[vw_People]
AS SELECT
    [PersonID]
    ,[FullName]
    ,[PreferredName]
    ,[LogonName]
    ,[IsEmployee]
    ,[IsSalesperson]
    ,[PhoneNumber]
    ,[FaxNumber]
FROM [silver_WWI].[dbo].[people]


GO

