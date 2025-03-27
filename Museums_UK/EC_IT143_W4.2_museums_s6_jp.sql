-- EC_IT143_W4.2_museums_s6_jp.sql
-- Step 6: Refresh table data
TRUNCATE TABLE Oldest_Museums_By_City_Table;

INSERT INTO Oldest_Museums_By_City_Table
SELECT * FROM Oldest_Museums_By_City_View;
