USE AdventureWorks2022;
GO

-- ###### PERSON.ADDRESS ANALYSIS ######

-- Drop index if it exists
IF EXISTS (
  SELECT name FROM sys.indexes 
  WHERE name = 'IX_Address_City' AND object_id = OBJECT_ID('Person.Address')
)
DROP INDEX IX_Address_City ON Person.Address;
GO

-- Inefficient query (no index)
SELECT pa.*
FROM Person.Address AS pa
WHERE pa.City = 'Bothell'
OPTION (TABLE HINT(pa, INDEX(0)));
GO

-- Create recommended index
CREATE NONCLUSTERED INDEX IX_Address_City
ON Person.Address (City);
GO

-- Optimized query
SELECT pa.*
FROM Person.Address AS pa
WHERE pa.City = 'Bothell';
GO

-- ###### PERSON.PERSON ANALYSIS ######

-- Drop index if it exists
IF EXISTS (
  SELECT name FROM sys.indexes 
  WHERE name = 'IX_Title_Person' AND object_id = OBJECT_ID('Person.Person')
)
DROP INDEX IX_Title_Person ON Person.Person;
GO

-- Inefficient query (no index)
SELECT *
FROM Person.Person
WHERE Title = 'Mr.'
OPTION (TABLE HINT(Person.Person, INDEX(0)));
GO

-- Create recommended index
CREATE NONCLUSTERED INDEX IX_Title_Person
ON Person.Person (Title);
GO

-- Optimized query
SELECT *
FROM Person.Person
WHERE Title = 'Mr.';
GO
