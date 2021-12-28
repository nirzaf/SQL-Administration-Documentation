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