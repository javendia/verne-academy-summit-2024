DROP TABLE IF EXISTS [dim].[People]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dim].[People]
(
	[PersonID] [int]  NOT NULL,
	[FullName] [varchar](500)  NULL,
	[PreferredName] [varchar](500)  NULL,
	[LogonName] [varchar](500)  NULL,
	[IsEmployee] [bit]  NULL,
	[IsSalesperson] [bit]  NULL,
	[PhoneNumber] [varchar](500)  NULL,
	[FaxNumber] [varchar](500)  NULL,
	[lastupdate] [datetime2](6) NOT NULL
)
GO

ALTER TABLE [dim].[People] ADD CONSTRAINT [PK_People] PRIMARY KEY NONCLUSTERED (PersonID) NOT ENFORCED
GO