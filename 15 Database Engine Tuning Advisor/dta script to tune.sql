
use SQL2
go

--select statements against SQL2 database gor SQL Tuning template

--Create a user profiler template

SELECT TOP 1000 [PeopleID]
,[Fname]
,[Lname]
,[Address1]
,[City]
,[State]
,[Zip]
,[Country]
,[Phone]
FROM [SQL2].[dbo].[People]
WHERE LNAME = 'Garcia'     --<< note that SQL will recommend INCLUDED columns to index when included in the select clause


SELECT TOP 10000 
[Lname]
FROM [SQL2].[dbo].[People]
WHERE LNAME = 'Houston'    --<< note that SQL will NOT recommend INCLUDED columns to index when not included in the select statement

SELECT TOP 10000 *
FROM [SQL2].[dbo].[People]
WHERE Fname = 'gloria'     --<<the query optimizer detects that the where clause refers to the fname

SELECT TOP 1000000 *
FROM [SQL2].[dbo].[People]
WHERE state = 'Utah'       --<<the query optimizer detects that the where clause refers to the state