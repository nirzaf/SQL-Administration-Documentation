/*
SQL Server error log offers good way to obtain information when troubleshooting SQL Server related problem. 
*/

--find the path for SQL Error Log

USE master
GO
xp_readerrorlog 0, 1, N'Logging SQL Server messages in file', NULL, NULL,NULL
GO

--sproc to view SQL Error Log.  Requires 4 parameters


--1: This parameter is to specify which error log to read from the 6 default logs (0 - 5)
--2: This parameter to query the SQL Server Error Log or the SQL Server Agent Error Log. 1 or null = SQL Server Error Log. 2 = SQL Server Error Log. 
--3: Specify word or phrase that we are looking within the text/message on the SQL Server error log or SQL Server Agent error log.
--4: Same as 3 


EXEC sp_readerrorlog NULL, NULL, NULL, NULL --<< 4 parameters

EXEC sp_readerrorlog 0, 1, NULL, NULL  --<< 1 = SQL Server Error Log

EXEC sp_readerrorlog 0, 2, NULL, NULL  --<< 2 = SQL Agent Error Log

EXEC sp_readerrorlog 0, 1, 'starting', 'MSDB'
