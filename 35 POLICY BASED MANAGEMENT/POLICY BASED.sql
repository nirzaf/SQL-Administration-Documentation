

--EXAMPLE 1 : CREATE 10 DATABASE, SOME WITH AUTOSHRINK PROPERTY OF THE FACET (DATABASE) SET TO 'ON'

--FIND ALL THE DATABASE WITH THE AUTOSHRINK PROPERTY SET TO 'ON' AND SET THEM TO 'OFF'

--SOLUTIONS:  CREATE A POLICY BASED CONDITION

USE [master]
GO

CREATE DATABASE T1
GO

ALTER DATABASE [T1] 
SET AUTO_SHRINK ON 
WITH NO_WAIT
GO

CREATE DATABASE T2
GO

CREATE DATABASE T3
GO

CREATE DATABASE T4
GO

ALTER DATABASE [T4] 
SET AUTO_SHRINK ON 
WITH NO_WAIT
GO

CREATE DATABASE T5
GO


CREATE DATABASE T6
GO

ALTER DATABASE [T6] 
SET AUTO_SHRINK ON 
WITH NO_WAIT
GO

CREATE DATABASE T7
GO

CREATE DATABASE T8
GO

CREATE DATABASE T9
GO

CREATE DATABASE T10
GO

--1 facet:database
--2 

--USE [master]
--GO
--ALTER DATABASE [T1] 
--SET AUTO_SHRINK OFF 
--WITH NO_WAIT
--GO

--DROP PROCEDURE POLICY_BASED
--------------------------------------------

--EXAMPLE 2:  PREVENT A USER FROM CREATING A STORED PROCEDURE THAT DOES NOT USE A 'USP_' PREFIX

--FACET = MULTIPART NAME

USE SQL2
GO

CREATE PROCEDURE POLICY_BASED  --<< NOTE THAT THE PREFIX 'USP_' HAS NOT BEEN USED, AND AS SUCH SPROC WILL NOT BE CREATED 
AS
SELECT * FROM [dbo].[People2]

--AS SOON AS THE SPROC HAS THE PREFIX 'USP_', IT'S CREATED

USE SQL2
GO

CREATE PROCEDURE USP_POLICY_BASED  --<< NOTE THAT THE PREFIX 'USP_' HAS NOT BEEN USED, AND AS SUCH SPROC WILL NOT BE CREATED 
AS
SELECT * FROM [dbo].[People2]


-------------------------------------------------
















-- Find all databases with AutoShrink turned on. 


declare @DatabaseName sysname

if left(convert(nvarchar, serverproperty('productversion')), 1) <> '8'
begin
    declare cur cursor local fast_forward for
        select name   as 'Database Name'
          from sys.databases
         where is_auto_shrink_on = 1
           and state_desc = 'ONLINE'
           and database_id > 4

    open cur
    fetch next from cur into @DatabaseName

    while @@fetch_status = 0
    begin
        print @DatabaseName
        fetch next from cur into @DatabaseName
    end

    close cur
    deallocate cur
end
else
begin
    declare cur cursor local fast_forward for
        select name   as 'Database Name'
          from master..sysdatabases
         where status & 4194304 = 4194304
           and status & 512 = 0
           and dbid > 4

    open cur
    fetch next from cur into @DatabaseName

    while @@fetch_status = 0
    begin
        print @DatabaseName
        fetch next from cur into @DatabaseName
    end

    close cur
    deallocate cur
end