/*
Script: EC_IT143_6.3_fwf_s3_jp.sql
Step 3 - Ad hoc SQL test
*/
USE EC_IT143_DA;
GO

SELECT 
  ContactName,
  SUBSTRING(ContactName, 1, CHARINDEX(' ', ContactName + ' ') - 1) AS FirstName
FROM 
  dbo.t_w3_schools_customers
WHERE CHARINDEX(' ', ContactName) > 0;
