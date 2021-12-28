USE [SQL2]
GO

--create a table and use the SQL Data Generator to insert 1 million rows

--CREATE TABLE [dbo].[People2](
--	[Fname] [varchar](20) NULL,
--	[Lname] [varchar](20) NULL,
--	[Phone] [varchar](20) NULL
--) ON [PRIMARY]

--GO

--Use SQL Data Generator to poulate 10 million rows
--select count (*) from people2
--15,000,000 rows

--When to create/use and not to use an index.  Find the phone number for lname Lambert   --<< don't use

SELECT TOP 10 [Fname]
      ,[Lname]
      ,[Phone]
  FROM [SQL2].[dbo].[People2]


--When to create/use and not to use an index.  Find the phone number for lname Conrad --<< don't use

  SELECT TOP 100 [Fname]
      ,[Lname]
      ,[Phone]
  FROM [SQL2].[dbo].[People2]

 --When to create/use and not to use an index.  Find the phone number for lname Sanders  --<< don't use


SELECT TOP 1000 [Fname]
      ,[Lname]
      ,[Phone]
  FROM [SQL2].[dbo].[People2]

   --When to create/use and not to use an index.  Find the phone number for lname Robertson  --<<  use

  SELECT  [Fname] 
      ,[Lname]
      ,[Phone]
  FROM [SQL2].[dbo].[People2]
  Where lname = 'Robertson'


  -- So when should we create an index?  The first answer to this is when there is large amount of data (but other considrations)

  --If we create an indexm how does the clustered index help us retrieve last name data faster?  bu sorting the lname column
  --you alphabatize the lname and as such, if you encounter two SAME lname, they will be next to each other.


  --Create a clustered index on lname to sort the data.  This wil improve retrival of lname data

USE [SQL2]
GO

CREATE CLUSTERED INDEX [Ind_People2_Lname] 
ON [People2]([Lname] ASC)



  SELECT   [Fname] 
      ,[Lname]
      ,[Phone]
  FROM [SQL2].[dbo].[People2]
  Where lname = 'Robertson'

