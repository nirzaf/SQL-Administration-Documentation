
/*

The system function sys.dm_db_index_physical_stats provides you inforamation about fragmetation

*/

--BACKUP TABLE PEOPLE3

--SELECT * INTO PEOPLE3BACKUP FROM People3

--SCRIPT TO INDICATE PERCENT OF FRAGMENTATION BEFORE INDEX CREATIONS

SELECT a.index_id, name, avg_fragmentation_in_percent
FROM sys.dm_db_index_physical_stats (DB_ID(N'SQL2'), 
OBJECT_ID(N'SQL2'), NULL, NULL, NULL) AS a
JOIN sys.indexes AS b ON a.object_id = b.object_id AND a.index_id = b.index_id; 
GO



--CREATE IN INDEX


USE [SQL2]
GO

CREATE NONCLUSTERED INDEX [NonClusteredIndex-lname] 
ON [dbo].[PEOPLE3]
([Lname] ASC)


SELECT a.index_id, name, avg_fragmentation_in_percent
FROM sys.dm_db_index_physical_stats (DB_ID(N'SQL2'), 
OBJECT_ID(N'PEOPLE3'), NULL, NULL, NULL) AS a
JOIN sys.indexes AS b ON a.object_id = b.object_id AND a.index_id = b.index_id; 
GO


--index_id	name	                  avg_fragmentation_in_percent
--3	        NonClusteredIndex-lname	  0.0101153145862836


--FIND LNAME WITH HANSON WITHOUT INDEX

USE [SQL2]
GO

SELECT [PeopleID]
      ,[Fname]
      ,[Lname]
      ,[Address1]
      ,[City]
      ,[State]
      ,[Zip]
      ,[Country]
      ,[Phone]
  FROM [dbo].[People3]
  WHERE Lname = 'HANSON'
GO


--FIND LNAME AND FNAME WITHOUT COMPOSITE INDEX

USE [SQL2]
GO

SELECT [PeopleID]
      ,[Fname]
      ,[Lname]
      ,[Address1]
      ,[City]
      ,[State]
      ,[Zip]
      ,[Country]
      ,[Phone]
  FROM [dbo].[People3]
  WHERE Lname = 'HANSON' OR Fname = 'EVA'
GO


--INSERT INTO PEOPLE A ROW

INSERT INTO [dbo].[People3]
VALUES (10000001,'Peggy','Villarreal', '777 Fabien Freeway','Lubbock','Alaska','59320','Morocco','959-485-3114')
GO 50000
--20 SEC


SELECT * FROM PEOPLE3 WHERE PeopleID LIKE  '%10000001'

--UPDATE LNAME WHERE LNAME IS BAXTER TO SUPERMAN


UPDATE People3
SET Lname = 'SUPERMAN'
WHERE Lname = 'BAXTER'

UPDATE People3
SET Lname = 'BATMAN'
WHERE Lname = 'Dickson'

UPDATE People3
SET Lname = 'HULK'
WHERE Lname = 'King'

UPDATE People3
SET Lname = 'JOKER'
WHERE  PeopleID BETWEEN '29740284' AND '31630639'
--5002044


DELETE FROM PEOPLE3 WHERE PeopleID BETWEEN '34546957' AND '39549000'
--5002044





