-- EC_IT143_W4.2_hello_world_s7_jp.sql
-- Step 7: Stored Procedure
CREATE PROCEDURE Load_HelloWorld
AS
BEGIN
    TRUNCATE TABLE HelloWorld_Table;
    INSERT INTO HelloWorld_Table
    SELECT * FROM HelloWorld_View;
END;
