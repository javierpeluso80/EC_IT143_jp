-- EC_IT143_W4.2_museums_s3_jp.sql
-- Step 3: Ad hoc SQL query
SELECT m.Village_Town_or_City, m.Name_of_museum, m.Year_opened
FROM Museums_UK m
JOIN (
    SELECT Village_Town_or_City, MIN(Year_opened) AS OldestYear
    FROM Museums_UK
    WHERE Year_opened IS NOT NULL
    GROUP BY Village_Town_or_City
) oldest ON m.Village_Town_or_City = oldest.Village_Town_or_City
         AND m.Year_opened = oldest.OldestYear;
