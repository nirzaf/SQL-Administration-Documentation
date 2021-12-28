
--Example of creating a clustered index using TSQL 

--CREATE CLUSTERED INDEX index_name
--ON table_name (column_name)


--Insert 1000 records from  RedGate app
  
USE [SQL2]
GO

CREATE TABLE [dbo].[PhoneBook](
	[PhoneBookID] [int] NULL,
	[lname] [varchar](50) NULL,
	[fname] [varchar](50) NULL,
	[phone] [varchar](50) NULL
) ON [PRIMARY]

GO

--Insert 1000 records from RedGate app

--View the 1000 records. Notice that the last name is not in any particular order
 
SELECT * FROM PHONEBOOK

--Insert record into phonebook table and notice the row is inserted after 1000 rows, as there is no index and the Lname is in no particular order

Insert into PHONEBOOK
values (1001,'Abba','Sara','555-1212')

SELECT * FROM PHONEBOOK

--repeat with another record

Insert into PHONEBOOK
values (1002,'Turner','Mike','805-555-1212')

SELECT * FROM PHONEBOOK


--Create a clustered index on table phonebook and column Lname so that the last name is alphabetized (its sorted by the clustered index created)

USE [SQL2]
GO

CREATE CLUSTERED INDEX [Idx_PhoneBook_Lname] --<< Index name with prefix, table name and column name (convention for clarity)
ON PhoneBook(Lname ASC)                      --<< Table and column name
GO


--View the 1000 records. This time notice that the last name IS in order by the last!
 
SELECT * FROM PHONEBOOK

--Now with the clusttered index in place, if we insert a record, it will automatically be inserted in the sorted order.

Insert into PHONEBOOK
values (1003,'Briggham','Johm','777-555-1212')

SELECT * FROM PHONEBOOK

--Exmaple of creating a clusetered index using the GUI

USE [SQL2]
GO
Drop table PHONEBOOK