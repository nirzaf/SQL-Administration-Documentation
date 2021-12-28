
--all the events that are available

SELECT p.name, c.event, k.keyword, c.channel, c.description FROM
   (
   SELECT event_package = o.package_guid, o.description, 
   event=c.object_name, channel = v.map_value
   FROM sys.dm_xe_objects o
   LEFT JOIN sys.dm_xe_object_columns c ON o.name = c.object_name
   INNER JOIN sys.dm_xe_map_values v ON c.type_name = v.name 
   AND c.column_value = cast(v.map_key AS nvarchar)
   WHERE object_type = 'event' AND (c.name = 'CHANNEL' or c.name IS NULL)
   ) c LEFT JOIN 
   (
   SELECT event_package = c.object_package_guid, event = c.object_name, 
   keyword = v.map_value
   FROM sys.dm_xe_object_columns c INNER JOIN sys.dm_xe_map_values v 
   ON c.type_name = v.name AND c.column_value = v.map_key 
   AND c.type_package_guid = v.object_package_guid
   INNER JOIN sys.dm_xe_objects o ON o.name = c.object_name 
   AND o.package_guid = c.object_package_guid
   WHERE object_type = 'event' AND c.name = 'KEYWORD' 
   ) k
   ON
   k.event_package = c.event_package AND (k.event=c.event or k.event IS NULL)
   INNER JOIN sys.dm_xe_packages p ON p.guid = c.event_package
ORDER BY 
--keyword , channel, event,
c.description

--To view which actions are available, use the following query:

SELECT p.name AS 'package_name', xo.name AS 'action_name', xo.description, xo.object_type
FROM sys.dm_xe_objects AS xo
JOIN sys.dm_xe_packages AS p
   ON xo.package_guid = p.guid
WHERE 
--xo.object_type = 'action'
--AND 
(xo.capabilities & 1 = 0 
OR xo.capabilities IS NULL)
ORDER BY p.name, xo.name



--To view which predicates are available for an event, use the following query, 
--replacing event_name with the name of the event for which you want to add a predicate:

SELECT *
FROM sys.dm_xe_object_columns
--WHERE object_name = 'event_name'
--AND column_type = 'data'

--view which global predicate sources are available, use the following query:

SELECT p.name AS package_name, xo.name AS predicate_name
   , xo.description, xo.object_type
FROM sys.dm_xe_objects AS xo
JOIN sys.dm_xe_packages AS p
   ON xo.package_guid = p.guid
--WHERE xo.object_type = 'pred_source'
--ORDER BY p.name, xo.name


--To view the list of available targets, use the following query:

SELECT p.name AS 'package_name', xo.name AS 'target_name'
   , xo.description, xo.object_type 
FROM sys.dm_xe_objects AS xo
JOIN sys.dm_xe_packages AS p
   ON xo.package_guid = p.guid
--WHERE xo.object_type = 'target'
--AND (xo.capabilities & 1 = 0
--OR xo.capabilities IS NULL)
--ORDER BY p.name, xo.name


--The following example creates an Extended Events session named IOActivity that captures the following information:

--Event data for completed file reads, including the associated Transact-SQL text for file reads where the file ID is equal to 1.

--Event data for completed file writes.

--Event data for when data is written from the log cache to the physical log file.

--The session sends the output to a file target.

CREATE EVENT SESSION IOActivity
ON SERVER

ADD EVENT sqlserver.file_read_completed
   (
   ACTION (sqlserver.sql_text)
   WHERE file_id = 1),
ADD EVENT sqlserver.file_write_completed,
ADD EVENT sqlserver.databases_log_flush

ADD TARGET package0.asynchronous_file_target 
   (SET filename = 'c:\temp\xelog.xel', metadatafile = 'c:\temp\xelog.xem')

