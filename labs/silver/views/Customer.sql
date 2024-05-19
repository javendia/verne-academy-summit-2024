DROP VIEW IF EXISTS [dbo].[vw_Customer]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO







CREATE VIEW [dbo].[vw_Customer]
AS SELECT
    [CustomerID]
    ,[CustomerName]
    ,ISNULL(cc.[CustomerCategoryName], 'N/A') AS [CustomerCategoryName]
    ,ISNULL(dm.[DeliveryMethodName], 'N/A') AS [DeliveryMethodName]
    ,[CreditLimit]
    ,[PaymentDays]
    ,[PhoneNumber]
    ,[FaxNumber]
    ,CONCAT([DeliveryAddressLine1],[DeliveryAddressLine2]) AS [DeliveryAddressLine]
    ,[DeliveryPostalCode]
    ,CONCAT([PostalAddressLine1],[PostalAddressLine2]) AS [PostalAddressLine]
    ,[PostalPostalCode]
FROM [silver_WWI].[dbo].[customers] c
LEFT JOIN [silver_WWI].[dbo].[customer_categories] cc ON cc.[CustomerCategoryID] = c.[CustomerCategoryID]
LEFT JOIN [silver_WWI].[dbo].[delivery_methods] dm ON dm.[DeliveryMethodID] = c.[DeliveryMethodID]


GO

