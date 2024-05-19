DROP TABLE IF EXISTS [dim].[Calendario]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dim].[Calendario]
(
	[Date] [date]  NOT NULL,
	[Year] [int]  NULL,
	[Month] [int]  NULL,
	[MonthName] [varchar](100)  NULL
)
GO

ALTER TABLE [dim].[Calendario] ADD CONSTRAINT [PK_Calendario] PRIMARY KEY NONCLUSTERED (Date) NOT ENFORCED
GO