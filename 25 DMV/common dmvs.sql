

--view all DMVs

SELECT name, type, type_desc
FROM sys.system_objects
WHERE name LIKE 'dm_%'
ORDER BY 2 desc


SELECT * FROM SYS.dm_os_memory_allocations               --<< Notice that all DMVs starts with SYS.DM
SELECT * FROM SYS.dm_db_xtp_nonclustered_index_stats   
SELECT * FROM SYS.dm_db_mirroring_past_actions
SELECT * FROM SYS.dm_xe_session_object_columns
SELECT * FROM SYS.dm_os_loaded_modules
SELECT * FROM SYS.dm_db_task_space_usage
SELECT * FROM SYS.dm_os_memory_objects
SELECT * FROM SYS.dm_audit_class_type_map
SELECT * FROM SYS.dm_os_schedulers
SELECT * FROM SYS.dm_os_server_diagnostics_log_configurations
SELECT * FROM SYS.dm_hadr_instance_node_map
SELECT * FROM SYS.dm_io_cluster_valid_path_names
SELECT * FROM SYS.dm_os_dispatcher_pools
SELECT * FROM SYS.dm_xtp_transaction_stats
SELECT * FROM SYS.dm_exec_query_profiles
SELECT * FROM SYS.dm_os_threads
SELECT * FROM SYS.dm_repl_tranhash
SELECT * FROM SYS.dm_hadr_cluster
SELECT * FROM SYS.dm_qn_subscriptions
SELECT * FROM SYS.dm_db_session_space_usage
SELECT * FROM SYS.dm_xtp_gc_stats
SELECT * FROM SYS.dm_exec_query_optimizer_info
SELECT * FROM SYS.dm_xe_map_values
SELECT * FROM SYS.dm_db_xtp_index_stats
SELECT * FROM SYS.dm_tran_top_version_generators
SELECT * FROM SYS.dm_fts_fdhosts
SELECT * FROM SYS.dm_xe_sessions
SELECT * FROM SYS.dm_db_log_space_usage
SELECT * FROM SYS.dm_hadr_name_id_map
SELECT * FROM SYS.dm_os_waiting_tasks
SELECT * FROM SYS.dm_exec_background_job_queue
SELECT * FROM SYS.dm_resource_governor_resource_pool_volumes
SELECT * FROM SYS.dm_os_hosts
SELECT * FROM SYS.dm_os_memory_brokers
SELECT * FROM SYS.dm_exec_requests
SELECT * FROM SYS.dm_tran_commit_table
SELECT * FROM SYS.dm_db_missing_index_details
SELECT * FROM SYS.dm_clr_properties
SELECT * FROM SYS.dm_os_sublatches
SELECT * FROM SYS.dm_os_buffer_pool_extension_configuration
SELECT * FROM SYS.dm_exec_query_memory_grants
SELECT * FROM SYS.dm_fts_outstanding_batches
SELECT * FROM SYS.dm_logpool_hashentries
SELECT * FROM SYS.dm_os_wait_stats
SELECT * FROM SYS.dm_os_memory_node_access_stats
SELECT * FROM SYS.dm_os_spinlock_stats
SELECT * FROM SYS.dm_database_encryption_keys
SELECT * FROM SYS.dm_db_xtp_checkpoint_stats
SELECT * FROM SYS.dm_hadr_availability_replica_states
SELECT * FROM SYS.dm_broker_connections
SELECT * FROM SYS.dm_db_mirroring_auto_page_repair
SELECT * FROM SYS.dm_server_registry
SELECT * FROM SYS.dm_tran_current_snapshot
SELECT * FROM SYS.dm_os_dispatchers
SELECT * FROM SYS.dm_os_stacks
SELECT * FROM SYS.dm_db_xtp_object_stats
SELECT * FROM SYS.dm_filestream_non_transacted_handles
SELECT * FROM SYS.dm_xe_session_targets
SELECT * FROM SYS.dm_fts_memory_buffers
SELECT * FROM SYS.dm_fts_index_population
SELECT * FROM SYS.dm_tran_current_transaction
SELECT * FROM SYS.dm_os_cluster_properties
SELECT * FROM SYS.dm_os_child_instances
SELECT * FROM SYS.dm_exec_connections
SELECT * FROM SYS.dm_server_memory_dumps
SELECT * FROM SYS.dm_xtp_threads
SELECT * FROM SYS.dm_exec_background_job_queue_stats
SELECT * FROM SYS.dm_os_memory_broker_clerks
SELECT * FROM SYS.dm_filestream_file_io_handles
SELECT * FROM SYS.dm_xtp_transaction_recent_rows
SELECT * FROM SYS.dm_hadr_availability_replica_cluster_nodes
SELECT * FROM SYS.dm_fts_active_catalogs
SELECT * FROM SYS.dm_tran_database_transactions
SELECT * FROM SYS.dm_filestream_file_io_requests
SELECT * FROM SYS.dm_cdc_log_scan_sessions
SELECT * FROM SYS.dm_os_memory_cache_clock_hands
SELECT * FROM SYS.dm_repl_schemas
SELECT * FROM SYS.dm_db_mirroring_connections
SELECT * FROM SYS.dm_audit_actions
SELECT * FROM SYS.dm_hadr_availability_group_states
SELECT * FROM SYS.dm_os_ring_buffers
SELECT * FROM SYS.dm_db_xtp_table_memory_stats
SELECT * FROM SYS.dm_db_missing_index_groups
SELECT * FROM SYS.dm_hadr_cluster_members
SELECT * FROM SYS.dm_db_uncontained_entities
SELECT * FROM SYS.dm_exec_cached_plans
SELECT * FROM SYS.dm_hadr_availability_replica_cluster_states
SELECT * FROM SYS.dm_exec_sessions
SELECT * FROM SYS.dm_os_memory_clerks
SELECT * FROM SYS.dm_hadr_auto_page_repair
SELECT * FROM SYS.dm_db_xtp_memory_consumers
SELECT * FROM SYS.dm_repl_articles
SELECT * FROM SYS.dm_xe_session_events
SELECT * FROM SYS.dm_broker_forwarded_messages
SELECT * FROM SYS.dm_resource_governor_resource_pools
SELECT * FROM SYS.dm_db_xtp_checkpoint_files
SELECT * FROM SYS.dm_db_partition_stats
SELECT * FROM SYS.dm_io_pending_io_requests
SELECT * FROM SYS.dm_xtp_system_memory_consumers
SELECT * FROM SYS.dm_hadr_cluster_networks
SELECT * FROM SYS.dm_os_nodes
SELECT * FROM SYS.dm_tcp_listener_states
SELECT * FROM SYS.dm_os_memory_cache_entries
SELECT * FROM SYS.dm_os_virtual_address_dump
SELECT * FROM SYS.dm_os_memory_cache_hash_tables
SELECT * FROM SYS.dm_cdc_errors
SELECT * FROM SYS.dm_resource_governor_configuration
SELECT * FROM SYS.dm_exec_query_stats
SELECT * FROM SYS.dm_fts_semantic_similarity_population
SELECT * FROM SYS.dm_clr_tasks
SELECT * FROM SYS.dm_db_xtp_hash_index_stats
SELECT * FROM SYS.dm_os_worker_local_storage
SELECT * FROM SYS.dm_db_persisted_sku_features
SELECT * FROM SYS.dm_os_sys_memory
SELECT * FROM SYS.dm_cryptographic_provider_properties
SELECT * FROM SYS.dm_tran_transactions_snapshot
SELECT * FROM SYS.dm_os_buffer_descriptors
SELECT * FROM SYS.dm_tran_active_snapshot_database_transactions
SELECT * FROM SYS.dm_server_services
SELECT * FROM SYS.dm_tran_active_transactions
SELECT * FROM SYS.dm_db_file_space_usage
SELECT * FROM SYS.dm_broker_activated_tasks
SELECT * FROM SYS.dm_broker_queue_monitors
SELECT * FROM SYS.dm_os_memory_cache_counters
SELECT * FROM SYS.dm_tran_session_transactions
SELECT * FROM SYS.dm_clr_appdomains
SELECT * FROM SYS.dm_db_xtp_gc_cycle_stats
SELECT * FROM SYS.dm_exec_trigger_stats
SELECT * FROM SYS.dm_os_memory_pools
SELECT * FROM SYS.dm_os_latch_stats
SELECT * FROM SYS.dm_io_backup_tapes
SELECT * FROM SYS.dm_db_xtp_merge_requests
SELECT * FROM SYS.dm_resource_governor_workload_groups
SELECT * FROM SYS.dm_hadr_database_replica_states
SELECT * FROM SYS.dm_fts_memory_pools
SELECT * FROM SYS.dm_resource_governor_resource_pool_affinity
SELECT * FROM SYS.dm_os_sys_info
SELECT * FROM SYS.dm_tran_locks
SELECT * FROM SYS.dm_exec_procedure_stats
SELECT * FROM SYS.dm_hadr_database_replica_cluster_states
SELECT * FROM SYS.dm_exec_query_transformation_stats
SELECT * FROM SYS.dm_exec_query_resource_semaphores
SELECT * FROM SYS.dm_repl_traninfo
SELECT * FROM SYS.dm_db_missing_index_group_stats
SELECT * FROM SYS.dm_fts_population_ranges
SELECT * FROM SYS.dm_os_performance_counters
SELECT * FROM SYS.dm_os_workers
SELECT * FROM SYS.dm_xe_session_event_actions
SELECT * FROM SYS.dm_db_script_level
SELECT * FROM SYS.dm_server_audit_status
SELECT * FROM SYS.dm_io_cluster_shared_drives
SELECT * FROM SYS.dm_os_tasks
SELECT * FROM SYS.dm_db_fts_index_physical_stats
SELECT * FROM SYS.dm_xe_packages
SELECT * FROM SYS.dm_logpool_stats
SELECT * FROM SYS.dm_os_memory_nodes
SELECT * FROM SYS.dm_tran_version_store
SELECT * FROM SYS.dm_os_windows_info
SELECT * FROM SYS.dm_os_cluster_nodes
SELECT * FROM SYS.dm_xtp_gc_queue_stats
SELECT * FROM SYS.dm_os_process_memory
SELECT * FROM SYS.dm_xe_objects
SELECT * FROM SYS.dm_xe_object_columns
SELECT * FROM SYS.dm_db_xtp_transactions
SELECT * FROM SYS.dm_clr_loaded_assemblies
SELECT * FROM SYS.dm_db_index_usage_stats


   /* DMV to list all empty tables in your database. */

   Use AdventureWorks2012

   go


   ;WITH Empty AS     
   (
    SELECT 
 OBJECT_NAME(OBJECT_ID) [Table],
 SUM(row_count) [Records]
    FROM 
 sys.dm_db_partition_stats      
    WHERE 
 index_id = 0 OR index_id = 1      
    GROUP BY 
 OBJECT_ID      
   )      

   SELECT [Table],Records 
   FROM [Empty]      
   WHERE [Records] = 0

/*
dmvs for indexes, slow running quieries, missing indexes, statistice, 
counters, cpu, memory, I/), physical disk sessions, users, security, 
database info 
*/


Select * from sys.dm_exec_connections
Select * from sys.dm_exec_sessions
Select * from sys.dm_exec_requests
Select * from sys.dm_db_index_usage_stats
Select * from sys.dm_db_missing_index_group_stats
Select * from sys.dm_os_performance_counters
select * from sys.dm_os_sys_memory



--allow the DBA to identify where the bulk of the connections originat

SELECT dec.client_net_address ,
des.program_name ,
des.host_name ,
--des.login_name  
COUNT(dec.session_id) AS connection_count
FROM sys.dm_exec_sessions AS des
INNER JOIN sys.dm_exec_connections AS dec
ON des.session_id = dec.session_id
-- WHERE LEFT(des.host_name, 2) = 'WK'
GROUP BY dec.client_net_address ,
des.program_name ,
des.host_name
-- des.login_name
-- HAVING COUNT(dec.session_id) > 1
ORDER BY des.program_name,
dec.client_net_address ;


--who are directly connected to the SQL Server instance

SELECT dec.client_net_address ,
des.host_name ,
dest.text
FROM sys.dm_exec_sessions des
INNER JOIN sys.dm_exec_connections dec
ON des.session_id = dec.session_id
CROSS APPLY sys.dm_exec_sql_text(dec.most_recent_sql_handle) dest
WHERE des.program_name LIKE 'Microsoft SQL Server Management Studio%'
ORDER BY des.program_name ,
dec.client_net_address

--Find indexes for database

use AdventureWorks2012
go

SELECT DB_NAME(ddius.[database_id]) AS database_name ,
OBJECT_NAME(ddius.[object_id], DB_ID('AdventureWorks2012')) --<< replace db name
AS [object_name] ,
asi.[name] AS index_name ,
ddius.user_seeks + ddius.user_scans + ddius.user_lookups AS user_reads
FROM sys.dm_db_index_usage_stats ddius
INNER JOIN AdventureWorks2012.sys.indexes asi
ON ddius.[object_id] = asi.[object_id]
AND ddius.index_id = asi.index_id ;

--userful DMV for determining usage of index

SELECT OBJECT_NAME(ddius.[object_id], ddius.database_id) AS [object_name] ,
ddius.index_id ,
ddius.user_seeks ,
ddius.user_scans ,
ddius.user_lookups ,
ddius.user_seeks + ddius.user_scans + ddius.user_lookups
AS user_reads ,
ddius.user_updates AS user_writes ,
ddius.last_user_scan ,
ddius.last_user_update
FROM sys.dm_db_index_usage_stats ddius
WHERE ddius.database_id > 4 -- filter out system tables
AND OBJECTPROPERTY(ddius.object_id, 'IsUserTable') = 1
AND ddius.index_id > 0 -- filter out heaps
ORDER BY ddius.user_scans DESC

-- List unused indexes

SELECT OBJECT_NAME(i.[object_id]) AS [Table Name] ,
i.name
FROM sys.indexes AS i
INNER JOIN sys.objects AS o ON i.[object_id] = o.[object_id]
WHERE i.index_id NOT IN ( SELECT ddius.index_id
FROM sys.dm_db_index_usage_stats AS ddius
WHERE ddius.[object_id] = i.[object_id]
AND i.index_id = ddius.index_id
AND database_id = DB_ID() )
AND o.[type] = 'U'
ORDER BY OBJECT_NAME(i.[object_id]) ASC ;