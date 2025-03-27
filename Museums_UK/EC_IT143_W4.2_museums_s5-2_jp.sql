-- EC_IT143_W4.2_museums_s5.2_jp.sql
-- Step 5.2: Add primary key
ALTER TABLE Oldest_Museums_By_City_Table
ADD CONSTRAINT PK_OldestMuseums PRIMARY KEY (Village_Town_or_City, Name_of_museum);
