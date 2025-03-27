-- EC_IT143_W4.2_museums_s4_jp.sql
-- Step 4: Create view
CREATE VIEW Oldest_Museums_By_City_View AS
SELECT m.Village_Town_or_City, m.Name_of_museum, m.Year_opened
FROM Museums_UK m
JOIN (
    SELECT Village_Town_or_City, MIN(Year_opened) AS OldestYear
    FROM Museums_UK
    WHERE Year_opened IS NOT NULL
    GROUP BY Village_Town_or_City
) oldest ON m.Village_Town_or_City = oldest.Village_Town_or_City
         AND m.Year_opened = oldest.OldestYear;
