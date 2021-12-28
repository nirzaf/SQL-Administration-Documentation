
--Count how many rows i have
--Move date from source to destination via wizard and script

select count (*) from people
--3:30 mins

--import the following from source to destination database

select  top 500000 * from people
--6 secs