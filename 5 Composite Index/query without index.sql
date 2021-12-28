
--Find all created indexes (two ways: GUI or sproc)

Use AdventureWorks2014
go

sp_helpindex '[HumanResources].[Department]'  --<< sproc followed by table name


--Create a composite index (two or more columns are specified) on a non clustered index

USE [SQL2]
Go


CREATE NONCLUSTERED INDEX [NC_Ind_People_Lname_Fname] --<< the more columns you chose to index, the longer it will take to create the index!!
ON [dbo].[People]
(Lname ASC,Fname ASC) --<< Note the order of the columns specified is important.  place the column in order of the query's where clause order


--4 mins


USE [SQL2]
Go

sp_helpindex people  --<< sproc followed by table name


USE [SQL2]
Go

DROP INDEX [NC_Ind_People_Lname_Fname] ON [dbo].[People]
GO



--Example: Running a query with out an index looking for the last name 'Franklin600'
--as there is no index on the lname, the query will have to start from the first row and sequentially go through 
--all the 50 million rows until it finds the lname Franklin600!!!  (this is called a table scan and very poor for performance)


USE [SQL2]
GO

SELECT * 
  FROM [dbo].[People]
  where Lname = 'Franklin600'
GO
--that took 35 seconds!!! 12 rows (before  creating of an index on lname)


--Create an index on lname (to create an index on lname column, the data has to be sorted and has pointers to the actual data in a table)
--the creatinon of an index can take along time because it is 'copying' the the column lname seperately with pointers to data!!
--any time you update the table people with and insert, update or delete, the index on that column has to be updated ALSO. 

USE [SQL2]
GO

CREATE NONCLUSTERED INDEX [NC_Ind_People_Lname] 
ON [dbo].[People]([Lname] ASC)
--2:45 mins


--Run select statment after the index creating


USE [SQL2]
GO

SELECT * 
  FROM [dbo].[People]
 --where Lname = 'Franklin600'
 where Lname = 'Everett652'
GO
--that less than a second!!! 12 rows (after the creating of an index on lname)


