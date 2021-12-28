
-- find the properties of the trace

SELECT * FROM sys.traces

Exec sp_trace_setstatus 2, 0 -- 0 = stop trace with id 1 
 
Exec sp_trace_setstatus 2, 2 -- 2 = delete trace with id

---generate activity:
use master
go

create database test123

use test123
go

create table names
(col int)

drop table names

use master
go

drop database test123



