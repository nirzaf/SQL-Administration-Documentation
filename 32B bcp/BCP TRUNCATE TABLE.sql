--CREATE TABLE FIRST TO RECIVE BCP DATA
USE [SQL2]
GO

CREATE TABLE [dbo].[PEOPLE4](
	[PeopleID] [int] NOT NULL,
	[Fname] [varchar](20) NULL,
	[Lname] [varchar](20) NULL,
	[Address1] [varchar](100) NULL,
	[City] [varchar](50) NULL,
	[State] [varchar](50) NULL,
	[Zip] [varchar](10) NULL,
	[Country] [varchar](50) NULL,
	[Phone] [varchar](20) NULL
) ON [PRIMARY]

GO


--TRUNCATE TABLE PEOPLE4

--USE [SQL2]
--GO

--SELECT [PeopleID]
--      ,[Fname]
--      ,[Lname]
--      ,[Address1]
--      ,[City]
--      ,[State]
--      ,[Zip]
--      ,[Country]
--      ,[Phone]
--  FROM [dbo].[PEOPLE4]
--GO


