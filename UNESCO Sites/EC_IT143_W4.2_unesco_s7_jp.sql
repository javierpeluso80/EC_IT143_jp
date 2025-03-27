-- EC_IT143_W4.2_unesco_s7_jp.sql
-- Step 7: Create stored procedure
IF OBJECT_ID('Load_UNESCO_Sites_By_Country', 'P') IS NOT NULL
    DROP PROCEDURE Load_UNESCO_Sites_By_Country;
GO

CREATE PROCEDURE Load_UNESCO_Sites_By_Country
AS
BEGIN
    TRUNCATE TABLE UNESCO_Sites_By_Country;
    INSERT INTO UNESCO_Sites_By_Country
    SELECT * FROM UNESCO_Sites_By_Country_View;
END;
GO

