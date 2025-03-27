-- EC_IT143_W4.2_museums_s7_jp.sql
-- Step 7: Stored Procedure
CREATE PROCEDURE Load_Oldest_Museums_By_City
AS
BEGIN
    TRUNCATE TABLE Oldest_Museums_By_City_Table;
    INSERT INTO Oldest_Museums_By_City_Table
    SELECT * FROM Oldest_Museums_By_City_View;
END;
