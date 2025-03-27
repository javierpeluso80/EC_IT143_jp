-- EC_IT143_W4.2_unesco_s6_jp.sql
-- Step 6: Refresh table from view
TRUNCATE TABLE UNESCO_Sites_By_Country;

INSERT INTO UNESCO_Sites_By_Country
SELECT * FROM UNESCO_Sites_By_Country_View;
GO

