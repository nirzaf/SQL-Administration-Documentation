
-- Create an index.  When creating an index, the statistics are created automatically

USE [AdventureWorks2014]
GO

CREATE NONCLUSTERED INDEX [NonClusteredIndex-20160203-192425] 
ON [dbo].[People2]
([Fname] ASC,[Lname] ASC)

--view statistics via GUI

--alternative way to view statistcs with DBCC command - distribution of data

DBCC SHOW_STATISTICS ('people2','NonClusteredIndex-20160203-192425')
WITH HISTOGRAM

--list all of the statistics being maintained on a table

use AdventureWorks2014
go
EXEC sp_helpstats 
@objname = '[dbo].[People2]',
@results = 'ALL';