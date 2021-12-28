USE [SQL2]
GO

SELECT TOP 100000 *
FROM [dbo].[People]
GO


-- 1 SEC

SELECT TOP 200000 *
FROM [dbo].[People]
GO


--2 SEC

SELECT TOP 300000 *
FROM [dbo].[People]
GO

--4 SEC

SELECT TOP 700000 *
FROM [dbo].[People]
GO

--9 SEC

SELECT TOP 800000 *
FROM [dbo].[People]
GO

--10

SELECT TOP 900000 *
FROM [dbo].[People]
GO

--12

SELECT TOP 1000000 *
FROM [dbo].[People]
GO
--14 SECS

USE [SQL2]
GO

SELECT TOP 2000000 *
FROM [dbo].[People]
GO
--26 SECS

SELECT TOP 3000000 *
FROM [dbo].[People]
GO

--40 SEC


  --the duration column i shown in millionth of a second, even though the filter was in 1000!!!

  select Duration/1000000 as DurationsInSeconds,* --<< divide by 1 million to get seconds
  from Duration
  where Textdata like '%select%'


