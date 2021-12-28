
 --WHEN USING TSQL TO CREATE AN EXTENDED EVENT, THESE ARE THE 'STEPS' TO FOLLOW:

 --1:  EXECUTE THE SCRIPT TO DROP ANY EXISTING SESSIONS

IF EXISTS(SELECT * FROM sys.server_event_sessions 
WHERE name='FindProblemQueries')
DROP EVENT SESSION FindProblemQueries ON SERVER
GO

--2: CREATE AN EVENT SESSION

CREATE EVENT SESSION FindProblemQueries
ON SERVER

--3: SELECT THE EVENTS YOU WANT TO CAPUTRE WITH THE ACTIONS (GLOBAL FIELDS) AND PREDICATES (FILTERS)

ADD EVENT sqlserver.sql_statement_completed
(ACTION (sqlserver.sql_text, sqlserver.tsql_stack, sqlserver.client_app_name,
sqlserver.username, sqlserver.client_hostname, sqlserver.session_nt_username)
WHERE (duration > 1000
AND sqlserver.client_hostname = 'DESKTOP-QMOOH4U'))

--4 ADD THE TARGET (WHERE YOU WANT TO SAVE THE FILES)

ADD TARGET package0.asynchronous_file_target(
SET filename='C:\New folder\FindProblemQueries.xet', metadatafile='C:\New folder\FindProblemQueries.xem'),

--SAVE IN MEMORY

ADD TARGET package0.ring_buffer
(SET max_memory = 4096)
WITH (max_dispatch_latency = 1 SECONDS, TRACK_CAUSALITY = ON)
GO
 
 --STEPS 1 THROUGH 4 SHOULD BE EXECUTED AT ONCE
 
--5: START THE SESSION

ALTER EVENT SESSION FindProblemQueries ON SERVER
STATE=START
GO
 
 --INSERT DATA

 SELECT TOP 1000 [Fname]
      ,[Lname]
      ,[Phone]
  FROM [SQL2].[dbo].[People2]
 
--7: START THE SESSION

ALTER EVENT SESSION FindProblemQueries ON SERVER
STATE=STOP
GO
 
--8: DROP THE SESSION (DROPPING THE SESSION DOES NOT DELETE THE FILES!!!)

DROP EVENT SESSION FindProblemQueries
ON SERVER
GO

 
--9: CREATE A TEMP TABLE FOR ANALYSIS

if object_id('tempdb..#myxml') is not null
DROP TABLE #myxml
CREATE TABLE #myxml (id INT IDENTITY, actual_xml XML)
INSERT INTO #myxml
SELECT CAST(event_data AS XML)
FROM sys.fn_xe_file_target_read_file
('C:\New folder\FindProblemQueries*.xet',
'C:\New folder\FindProblemQueries*.xem',
NULL, NULL)
 
 
--10: INSERT INTO TEMP TABLE TO VIEW DATA COLLECTED

if object_id('tempdb..#ParsedData') is not null
DROP TABLE #ParsedData
CREATE TABLE #ParsedData (id INT, Actual_Time DATETIME, EventType sysname, ParsedName sysname, NodeValue VARCHAR(MAX))
INSERT INTO #ParsedData 
SELECT id,
DATEADD(MINUTE, DATEPART(TZoffset, SYSDATETIMEOFFSET()), UTC_Time) AS Actual_Time,
EventType,
ParsedName,
NodeValue
FROM (
SELECT id,
A.B.value('@name[1]', 'varchar(128)') AS EventType,
A.B.value('./@timestamp[1]', 'datetime') AS UTC_Time,
X.N.value('local-name(.)', 'varchar(128)') AS NodeName,
X.N.value('../@name[1]', 'varchar(128)') AS ParsedName,
X.N.value('./text()[1]', 'varchar(max)') AS NodeValue
FROM [#myxml]
CROSS APPLY actual_xml.nodes('/*') AS A (B)
CROSS APPLY actual_xml.nodes('//*') AS X (N)
) T
WHERE NodeName = 'value'
DECLARE @SQL AS VARCHAR (MAX)
DECLARE @Columns AS VARCHAR (MAX)
SELECT @Columns=
COALESCE(@Columns + ',','') + QUOTENAME(ParsedName)
FROM
(
SELECT DISTINCT ParsedName
FROM #ParsedData
		
WHERE ParsedName <> 'tsql_stack'
) AS B
SET @SQL='
SELECT Actual_Time, EventType,' + @Columns + ' FROM
(
SELECT id, EventType, Actual_Time, ParsedName, NodeValue FROM
#ParsedData ) AS source
PIVOT
(max(NodeValue) FOR source.ParsedName IN (' + @columns + ')
)AS pvt order by actual_time, attach_activity_id'
EXEC (@sql) 




--Lists all the event session definitions that exist in SQL Server.

SELECT  * FROM sys.server_event_sessions 

--Returns a row for each action on each event of an event session.

SELECT  * FROM sys.server_event_session_actions 

--Returns a row for each event in an event session

SELECT  * FROM sys.server_event_session_events 

--Returns a row for each customizable column that was explicitly set on events and targets

SELECT  * FROM sys.server_event_session_fields 

--Returns a row for each event target for an event session.

SELECT  * FROM sys.server_event_session_targets 



--view the Extended Events equivalents to SQL Trace events using Query Editor

USE MASTER;
GO

SELECT DISTINCT
tb.trace_event_id,
te.name AS 'Event Class',
em.package_name AS 'Package',
em.xe_event_name AS 'XEvent Name',
tb.trace_column_id,
tc.name AS 'SQL Trace Column',
am.xe_action_name as 'Extended Events action'
FROM (sys.trace_events te LEFT OUTER JOIN sys.trace_xe_event_map em
ON te.trace_event_id = em.trace_event_id) LEFT OUTER JOIN sys.trace_event_bindings tb
ON em.trace_event_id = tb.trace_event_id LEFT OUTER JOIN sys.trace_columns tc
ON tb.trace_column_id = tc.trace_column_id LEFT OUTER JOIN sys.trace_xe_action_map am
ON tc.trace_column_id = am.trace_column_id
where tc.name like '%completed%'
ORDER BY te.name, tc.name

select * from sys.trace_Events


--To get the fields for all events 

select p.name package_name, o.name event_name, c.name event_field, 
c.type_name field_type, c.column_type column_type
from sys.dm_xe_objects o
join sys.dm_xe_packages p
on o.package_guid = p.guid
join sys.dm_xe_object_columns c
on o.name = c.object_name
where o.object_type = 'event'
order by package_name, event_name

