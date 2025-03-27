-- EC_IT143_W4.2_unesco_s4_jp.sql
-- Step 4: Create view
IF OBJECT_ID('UNESCO_Sites_By_Country_View', 'V') IS NOT NULL
    DROP VIEW UNESCO_Sites_By_Country_View;
GO

CREATE VIEW UNESCO_Sites_By_Country_View AS
SELECT Country_name, COUNT(*) AS Total_Sites
FROM UNESCO_SITES
GROUP BY Country_name;
GO

