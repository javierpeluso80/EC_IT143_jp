-- EC_IT143_W4.2_hello_world_s6_jp.sql
-- Step 6: Truncate and insert from view
TRUNCATE TABLE HelloWorld_Table;

INSERT INTO HelloWorld_Table
SELECT * FROM HelloWorld_View;
