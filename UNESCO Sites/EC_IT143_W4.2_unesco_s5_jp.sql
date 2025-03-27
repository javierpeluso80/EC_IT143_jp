-- EC_IT143_W4.2_unesco_s5_jp.sql
-- Step 5: Create table from view
IF OBJECT_ID('UNESCO_Sites_By_Country', 'U') IS NOT NULL
    DROP TABLE UNESCO_Sites_By_Country;
GO

SELECT * INTO UNESCO_Sites_By_Country
FROM UNESCO_Sites_By_Country_View;
GO

