DROP PROCEDURE IF EXISTS [etl].[load_WWI_dim_customer]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO











CREATE PROC [etl].[load_WWI_dim_customer]
AS
BEGIN



    UPDATE tgt
    SET
        tgt.[CustomerName] = src.[CustomerName]
        ,tgt.[CustomerCategoryName] = src.[CustomerCategoryName]
        ,tgt.[DeliveryMethodName] = src.[DeliveryMethodName]
        ,tgt.[CreditLimit] = src.[CreditLimit]
        ,tgt.[PaymentDays] = src.[PaymentDays]
        ,tgt.[PhoneNumber] = src.[PhoneNumber]
        ,tgt.[FaxNumber] = src.[FaxNumber]
        ,tgt.[DeliveryAddressLine] = src.[DeliveryAddressLine]
        ,tgt.[DeliveryPostalCode] = src.[DeliveryPostalCode]
        ,tgt.[PostalAddressLine] = src.[PostalAddressLine]
        ,tgt.[PostalPostalCode] = src.[PostalPostalCode]
        ,tgt.[lastupdate] = GETDATE()
    FROM [gold_WWI].[dim].[Customer] AS tgt
    INNER JOIN [silver_WWI].[dbo].[vw_Customer_Changes] src ON tgt.[CustomerID] = src.[CustomerID]


    PRINT CAST(@@ROWCOUNT AS VARCHAR) + ' filas actualizadas.'

    INSERT INTO [gold_WWI].[dim].[Customer]
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
        ,GETDATE() AS [lastupdate]
    FROM [silver_WWI].[dbo].[vw_Customer_Changes]
    WHERE [type_op] = 1

    PRINT CAST(@@ROWCOUNT AS VARCHAR) + ' filas insertadas.'

END






GO

