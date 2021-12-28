-- Create the Event Session --
------------------------------
 
IF EXISTS(SELECT * FROM sys.server_event_sessions WHERE name='LongRunningQuery')
DROP EVENT SESSION LongRunningQuery ON SERVER
GO
-- Create Event
CREATE EVENT SESSION LongRunningQuery
ON SERVER
-- Add event to capture event
ADD EVENT sqlserver.rpc_completed
(
-- Add action - event property ; can't add query_hash in R2
ACTION (sqlserver.sql_text, sqlserver.tsql_stack, sqlserver.client_app_name,
sqlserver.username, sqlserver.client_hostname, sqlserver.session_nt_username)
-- Predicate - time 1000 milisecond
WHERE (
duration > 1000 --by leaving off the event name, you can easily change to capture diff events
AND sqlserver.client_hostname <> 'A' --cant use NOT LIKE prior to 2012
)
--by leaving off the event name, you can easily change to capture diff events
),
ADD EVENT sqlserver.sql_statement_completed
-- or do sqlserver.rpc_completed, though getting the actual SP name seems overly difficult
(
-- Add action - event property ; can't add query_hash in R2
ACTION (sqlserver.sql_text, sqlserver.tsql_stack, sqlserver.client_app_name,
sqlserver.username, sqlserver.client_hostname, sqlserver.session_nt_username)
-- Predicate - time 1000 milisecond
WHERE (
duration > 1000
AND sqlserver.client_hostname <> 'A'
)
),
--adding Module_End. Gives us the various SPs called.
ADD EVENT sqlserver.module_end
(
ACTION (sqlserver.sql_text, sqlserver.tsql_stack, sqlserver.client_app_name,
sqlserver.username, sqlserver.client_hostname, sqlserver.session_nt_username)
WHERE (
duration > 1000000
--note that 1 second duration is 1million, and we still need to match it up via the causality
AND sqlserver.client_hostname <> 'A'
)
)
-- Add target for capturing the data - XML File
-- You don't need this (pull the ring buffer into temp table),
-- but allows us to capture more events (without allocating more memory to the buffer)
--!!! Remember the files will be left there when done!!!
ADD TARGET package0.asynchronous_file_target(
SET filename='C:\New folder\LongRunningQuery.xet', metadatafile='C:\New folder\LongRunningQuery.xem'),
-- Add target for capturing the data - Ring Buffer. Can query while live, or just see how chatty it is
ADD TARGET package0.ring_buffer
(SET max_memory = 4096)
WITH (max_dispatch_latency = 1 SECONDS, TRACK_CAUSALITY = ON)
GO
 
 
 
-- Enable Event, aka Turn It On
ALTER EVENT SESSION LongRunningQuery ON SERVER
STATE=START
GO
 