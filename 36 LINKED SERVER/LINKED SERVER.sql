

--WHAT IS A LINKED SERVER?

--A LINKED SERVER ALLOWS YOU TO ACCESS DATA FROM ANOTHER SQL DATABASE OR ANOTHER DATABASE PLATFORM LIKE ORACLE OR MS ACCESS (YOU WILL NEED ODBC CONNECTIONS)

--EXAMPLE: SELECTING DATA FROM ANOTHER DATABASE USING LINKED SERVER

--IN THIS EXAMPLE, I WANT TO ACCESS DATA FROM SQL SERVER DESKTOP-QMOOH4U, ADVENTUREWORKS2012 DB AND CONTACTTYPE TABLE

--TO RESOLVE THIS ISSUE, WE MUST USE A LINKED SERVER


--SELECT DATA FROM THE DATABASE

SELECT [ContactTypeID]
,[Name]
,[ModifiedDate]
FROM [DESKTOP-QMOOH4U].[AdventureWorks2012].[Person].[ContactType] --<< FULLY QUALIFIED NAME (SERVER.DB.SCHEMA.TABLE)
GO

--INSERT INTO SOURCE ([DESKTOP-QMOOH4U\DEV]) DATABASE DATA FROM DESTINATION ([DESKTOP-QMOOH4U]) DATABASE

--DROP TABLE [PROD].[DBO].[Contacts] 

SELECT * INTO [PROD].[DBO].[Contacts] 
FROM [DESKTOP-QMOOH4U].[AdventureWorks2012].[Person].[ContactType]

--VERIFY

USE [PROD]
GO

SELECT *
FROM [dbo].[Contacts]
GO


--SCRIPT FOR LINKED SERVER:

USE [master]
GO

EXEC master.dbo.sp_dropserver @server=N'DESKTOP-QMOOH4U', @droplogins='droplogins'
GO

EXEC master.dbo.sp_addlinkedserver @server = N'DESKTOP-QMOOH4U', @srvproduct=N'SQL Server'
EXEC master.dbo.sp_addlinkedsrvlogin @rmtsrvname=N'DESKTOP-QMOOH4U',@useself=N'False',@locallogin=NULL,@rmtuser=NULL,@rmtpassword=NULL
EXEC master.dbo.sp_addlinkedsrvlogin @rmtsrvname=N'DESKTOP-QMOOH4U',@useself=N'True',@locallogin=N'DESKTOP-QMOOH4U\RAF',@rmtuser=NULL,@rmtpassword=NULL

GO

EXEC master.dbo.sp_serveroption @server=N'DESKTOP-QMOOH4U', @optname=N'collation compatible', @optvalue=N'false'
GO

EXEC master.dbo.sp_serveroption @server=N'DESKTOP-QMOOH4U', @optname=N'data access', @optvalue=N'true'
GO

EXEC master.dbo.sp_serveroption @server=N'DESKTOP-QMOOH4U', @optname=N'dist', @optvalue=N'false'
GO

EXEC master.dbo.sp_serveroption @server=N'DESKTOP-QMOOH4U', @optname=N'pub', @optvalue=N'false'
GO

EXEC master.dbo.sp_serveroption @server=N'DESKTOP-QMOOH4U', @optname=N'rpc', @optvalue=N'false'
GO

EXEC master.dbo.sp_serveroption @server=N'DESKTOP-QMOOH4U', @optname=N'rpc out', @optvalue=N'false'
GO

EXEC master.dbo.sp_serveroption @server=N'DESKTOP-QMOOH4U', @optname=N'sub', @optvalue=N'false'
GO

EXEC master.dbo.sp_serveroption @server=N'DESKTOP-QMOOH4U', @optname=N'connect timeout', @optvalue=N'0'
GO

EXEC master.dbo.sp_serveroption @server=N'DESKTOP-QMOOH4U', @optname=N'collation name', @optvalue=null
GO

EXEC master.dbo.sp_serveroption @server=N'DESKTOP-QMOOH4U', @optname=N'lazy schema validation', @optvalue=N'false'
GO

EXEC master.dbo.sp_serveroption @server=N'DESKTOP-QMOOH4U', @optname=N'query timeout', @optvalue=N'0'
GO

EXEC master.dbo.sp_serveroption @server=N'DESKTOP-QMOOH4U', @optname=N'use remote collation', @optvalue=N'true'
GO

EXEC master.dbo.sp_serveroption @server=N'DESKTOP-QMOOH4U', @optname=N'remote proc transaction promotion', @optvalue=N'true'
GO


