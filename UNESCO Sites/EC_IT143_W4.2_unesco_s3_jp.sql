-- EC_IT143_W4.2_unesco_s3_jp.sql
-- Step 3: Ad hoc SQL query
SELECT Country_name, COUNT(*) AS Total_Sites
FROM UNESCO_SITES
GROUP BY Country_name
ORDER BY Total_Sites DESC;

