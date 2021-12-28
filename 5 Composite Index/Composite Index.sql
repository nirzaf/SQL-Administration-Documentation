--Find all created indexes

Use AdventureWorks2014
go

sp_helpindex '[HumanResources].[Department]'  --<< sproc followed by table name


--Create a composite index (two or more columns are specified) on a non clustered index

USE [SQL2]
Go


CREATE NONCLUSTERED INDEX [NC_Ind_People_Lname_Fname] 
ON [dbo].[People]
(Lname ASC,Fname ASC) --<< Note the order of the columns specified is important.  place the column in order of the query's where clause order


sp_helpindex people  --<< sproc followed by table name

