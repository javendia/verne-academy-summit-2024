DROP VIEW IF EXISTS [dbo].[vw_Customer_Changes]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO













CREATE VIEW [dbo].[vw_Customer_Changes]
AS     
    SELECT
        src.[CustomerID]
        ,src.[CustomerName]
        ,src.[CustomerCategoryName]
        ,src.[DeliveryMethodName]
        ,src.[CreditLimit]
        ,src.[PaymentDays]
        ,src.[PhoneNumber]
        ,src.[FaxNumber]
        ,src.[DeliveryAddressLine]
        ,src.[DeliveryPostalCode]
        ,src.[PostalAddressLine]
        ,src.[PostalPostalCode]
        -- Si el identificador existe en el destino, se trata de una actualización
        -- En caso contrario, es una inserción
        ,CASE WHEN tgt.[CustomerID] IS NULL THEN 1 ELSE 2 END AS [type_op]
    FROM
    (
            SELECT 
                [CustomerID]
                ,[CustomerName]
                ,[CustomerCategoryName]
                ,[DeliveryMethodName]
                ,[CreditLimit]
                ,[PaymentDays]
                ,[PhoneNumber]
                ,[FaxNumber]
                ,[DeliveryAddressLine]
                ,[DeliveryPostalCode]
                ,[PostalAddressLine]
                ,[PostalPostalCode]
            FROM [silver_WWI].[dbo].[vw_Customer] src
            EXCEPT -- Filas no coincidentes en destino
            SELECT 
                [CustomerID]
                ,[CustomerName]
                ,[CustomerCategoryName]
                ,[DeliveryMethodName]
                ,[CreditLimit]
                ,[PaymentDays]
                ,[PhoneNumber]
                ,[FaxNumber]
                ,[DeliveryAddressLine]
                ,[DeliveryPostalCode]
                ,[PostalAddressLine]
                ,[PostalPostalCode]
            FROM [gold_WWI].[dim].[Customer] AS tgt
    ) src
    LEFT JOIN [gold_WWI].[dim].[Customer] AS tgt ON tgt.[CustomerID] = src.[CustomerID]






GO

