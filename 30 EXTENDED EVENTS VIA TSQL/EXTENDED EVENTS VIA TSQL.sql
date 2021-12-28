

--The following example shows how to drop an event session.

DROP EVENT SESSION evt_spin_lock_diagnosis
ON SERVER

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

select p.name package_name, o.name event_name, c.name event_field, c.type_name field_type, c.column_type column_type
from sys.dm_xe_objects o
join sys.dm_xe_packages p
on o.package_guid = p.guid
join sys.dm_xe_object_columns c
on o.name = c.object_name
where o.object_type = 'event'
order by package_name, event_name

