
--Create database 4MB in size

CREATE DATABASE [SQLSize]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SQLSize', 
FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\SQLSize.mdf' , 
SIZE = 4096KB ,        --<< original size 4MB
FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'SQLSize_log', 
FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\SQLSize_log.ldf' , 
SIZE = 1024KB , 
FILEGROWTH = 10%)
GO


--Alter the size of the database

USE [master]
GO

ALTER DATABASE [SQLSize] 
MODIFY FILE ( NAME = N'SQLSize', SIZE = 20480KB )
GO

ALTER DATABASE [SQLSize] 
MODIFY FILE ( NAME = N'SQLSize_log', SIZE = 5120KB )
GO

--scripted out session

CREATE EVENT SESSION [Altered Database Size] ON SERVER 
ADD EVENT sqlserver.database_file_size_change(
ACTION(sqlserver.database_id,sqlserver.database_name,sqlserver.nt_username,sqlserver.sql_text,sqlserver.username)
WHERE ([sqlserver].[database_name]=N'SQLSize')) 
ADD TARGET package0.event_file(SET filename=N'SQLSize')
WITH (STARTUP_STATE=OFF)
GO






--Extended Event Packages

SELECT pkg.name, pkg.description, mod.* 
FROM sys.dm_os_loaded_modules mod 
INNER JOIN sys.dm_xe_packages pkg 
ON mod.base_address = pkg.module_address 


--Package events

select pkg.name as PackageName, obj.name as EventName 
from sys.dm_xe_packages pkg 
inner join sys.dm_xe_objects obj on pkg.guid = obj.package_guid 
where obj.object_type = 'event' 
order by 1, 2 


--Package wise actions

select pkg.name as PackageName, obj.name as ActionName 
from sys.dm_xe_packages pkg 
inner join sys.dm_xe_objects obj on pkg.guid = obj.package_guid 
where obj.object_type = 'action' 
order by 1, 2 

--Package wise targets

select pkg.name as PackageName, obj.name as TargetName 
from sys.dm_xe_packages pkg 
inner join sys.dm_xe_objects obj on pkg.guid = obj.package_guid 
---where obj.object_type = 'target' 
order by 1, 2 


--Package wise predicates

select pkg.name as PackageName, obj.name as PredicateName 
from sys.dm_xe_packages pkg 
inner join sys.dm_xe_objects obj on pkg.guid = obj.package_guid 
where obj.object_type = 'pred_source' 
order by 1, 2 


--Event session with its events, actions and targets

SELECT sessions.name AS SessionName, sevents.package as PackageName, 
sevents.name AS EventName, 
sevents.predicate, sactions.name AS ActionName, stargets.name AS TargetName 
FROM sys.server_event_sessions sessions 
INNER JOIN sys.server_event_session_events sevents 
ON sessions.event_session_id = sevents.event_session_id 
INNER JOIN sys.server_event_session_actions sactions 
ON sessions.event_session_id = sactions.event_session_id 
INNER JOIN sys.server_event_session_targets stargets 
ON sessions.event_session_id = stargets.event_session_id 
WHERE sessions.name = 'database size' 
GO 
