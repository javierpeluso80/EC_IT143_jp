-- EC_IT143_6.3_fwf_s7_jp.sql
-- Step 7 – 0 results expected test
USE EC_IT143_DA;
GO

WITH cte_first_names AS (
    SELECT ContactName, dbo.ufn_get_first_name(ContactName) AS FirstName
    FROM dbo.t_w3_schools_customers
)
SELECT * FROM cte_first_names
WHERE FirstName IS NULL;
