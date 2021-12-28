
/*

Note: table people in db SQL2 has beeen updated to contain 100,000,000 million rows using SQL Data Generator

Select count (*) from people  --100000000 rows

Use the where clause for lname (single column index would be beneficial
if the table is used frequently, otherwise do not create an index

*/

--Using the WHERE clause without an index (1 min 10 sesc)
--click on icon to display estimated execution plan (shows that a table scan will be executed and missing non clustered index is suggested on lname and others columns)
--the display estimated execution plan dose not execute the query, but shows the plan if executed!!

USE [SQL2]
GO

SELECT [PeopleID]  --<< note while i am using all the columns, in a production server, use only columns that are needed
      ,[Fname]
      ,[Lname]
      ,[Address1]
      ,[City]
      ,[State]
      ,[Zip]
      ,[Country]
      ,[Phone]
  FROM [dbo].[People]
  WHERE Lname = 'Spence'

GO

--Using the WHERE clause without a non clustered index on lname  (1 min 10 sesc)

--Before runnng the script, create the 'suggeted' non clustered index

USE [SQL2]
GO

CREATE NONCLUSTERED INDEX [<Name of Missing Index, sysname,>]
ON [dbo].[People] ([Lname])
--INCLUDE ([PeopleID],[Fname],[Address1],[City],[State],[Zip],[Country],[Phone])--<< INCLUDE MEANS INCLUDE NON KEY COLUMNS. THIS COVERS MORE QUERIES
GO

--5 MIN 30 SEC


--RERUN THE SCRIPT FOR FINDING ALL DATA FOR LNAME SPENCE.  REMEMBER, IN A PRODUCTION SERVER, DONT USE ALL THE FIELDS, ONLY THE ONES THAT ARE NEEDED.

USE [SQL2]
GO

SELECT  [PeopleID]
      ,[Fname]
      ,[Lname]
      ,[Address1]
      ,[City]
      ,[State]
      ,[Zip]
      ,[Country]
      ,[Phone]
  FROM [dbo].[People]
  --WHERE Lname = 'Spence'
  WHERE Lname =  'Zuniga'
GO


--1st run = 2 min 15 sec
--2nd run = 10 sec  (becasue it is cached)


--without all columns

USE [SQL2]
GO

SELECT  [PeopleID]
      ,[Fname]
      ,[Lname]
  FROM [dbo].[People]
  --HERE Lname = 'Spence'
  WHERE Lname =  'Zuniga'
GO

--2 sec

