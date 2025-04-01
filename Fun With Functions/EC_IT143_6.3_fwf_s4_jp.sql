-- EC_IT143_6.3_fwf_s4_jp.sql
-- Step 4 – Research and test a solution

-- Source: https://stackoverflow.com/a/50700769
-- Testing the logic for extracting first names using CHARINDEX and SUBSTRING
USE EC_IT143_DA;
GO

SELECT 
  ContactName,
  SUBSTRING(ContactName, 1, CHARINDEX(' ', ContactName + ' ') - 1) AS FirstName
FROM 
  dbo.t_w3_schools_customers;
