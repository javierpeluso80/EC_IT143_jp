-- EC_IT143_6.3_fwf_s6_jp.sql
-- Step 6 – Compare UDF to ad hoc query
USE EC_IT143_DA;
GO

SELECT 
  ContactName,
  dbo.ufn_get_first_name(ContactName) AS FirstName
FROM 
  dbo.t_w3_schools_customers;
