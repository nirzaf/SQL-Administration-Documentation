

--View data with clustered index (lname column is still sorted)

SELECT*
FROM [SQL2].[dbo].[PhoneBook]

-- Create another clustered index causes an issue (on fname) because you can only have one clustered index

USE [SQL2]
GO

CREATE CLUSTERED INDEX [Idx_PhoneBook_phonebookid]
ON PhoneBook(phonebookid ASC)


Drop index [PhoneBook].[Idx_PhoneBook_lname]

--Can create an single clustered index that has multiple columns

CREATE CLUSTERED INDEX [Idx_PhoneBook_Fname_Lname]
ON [dbo].[PhoneBook](lname ASC,fname ASC) --<< multiple columns


SELECT*
FROM [SQL2].[dbo].[PhoneBook]


--Example of non clustered index

USE [SQL2]
GO

CREATE NONCLUSTERED INDEX [NC_Ind_PhoneBook_ fname]  --<< notice that after creation of a non clustered index, the data is not sorted
ON PhoneBook(fname ASC)


SELECT*
FROM [SQL2].[dbo].[PhoneBook]


--Can create multiple non clustered index (On lname)

USE [SQL2]
GO

CREATE NONCLUSTERED INDEX [NC_Ind_PhoneBook_phone] --<< second creation of an index and phone
ON PhoneBook(phone ASC)

SELECT*
FROM [SQL2].[dbo].[PhoneBook]