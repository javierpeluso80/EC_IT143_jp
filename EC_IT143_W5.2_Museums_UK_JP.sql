/***********************************************************************************************
NAME: EC_IT143_W5.2_Museums_UK_JP
PURPOSE: Script to answer 4 questions based on the Museums_UK dataset.
MODIFICATION LOG:
Ver   Date        Author   Description
----- ----------  -------  ------------------------------------------------------------
1.0   03/31/2025  JP       Created script to fulfill assignment 5.2 for IT 143.

RUNTIME:
Xm Xs

NOTES:
This script provides insights based on the UK museums dataset. It uses TRY_CAST to safely
convert year values, since some entries like '2012:2012' are not valid integers.
***********************************************************************************************/

-- Q1: Which is the oldest museum with a valid opening year?
-- A1: Shows the museum with the earliest known year of opening (only valid numeric years are considered).
SELECT TOP 1
    Name_of_museum,
    Year_opened
FROM dbo.Museums_UK
WHERE ISNUMERIC(LEFT(Year_opened, 4)) = 1
ORDER BY CONVERT(INT, LEFT(Year_opened, 4)) ASC;




-- Q2: Which is the most recently opened museum with a valid year?
-- A2: Shows the most recent museum based on valid numeric year in Year_opened field.
SELECT TOP 1
    Name_of_museum,
    Year_opened
FROM dbo.Museums_UK
WHERE ISNUMERIC(LEFT(Year_opened, 4)) = 1
ORDER BY CONVERT(INT, LEFT(Year_opened, 4)) DESC;



-- Q3: How many museums are accredited?
-- A3: Counts non-empty values in Accreditation column.
-- Author: Me

SELECT 
    COUNT(*) AS [Accredited_Museums]
FROM 
    [dbo].[Museums_UK]
WHERE 
    [Accreditation] IS NOT NULL AND [Accreditation] <> '';


-- Q4: What is the museum in the UK that is visited the most or the least? 
-- A4: Since visits are not provided, we list the city with the most museums instead.
-- Author: Hunter Charles Bock

SELECT 
    TOP 1 [Village_Town_or_City], COUNT(*) AS [Museum_Count]
FROM 
    [dbo].[Museums_UK]
GROUP BY 
    [Village_Town_or_City]
ORDER BY 
    [Museum_Count] DESC;
