/***********************************************************************************
NAME: EC_IT143_W5.2_UNESCO_JEP
PURPOSE: Answer questions related to UNESCO sites dataset
MODIFICATION LOG:
Ver   Date       Author      Description
1.0   03/31/2025 Javier      Created for assignment 5.2
***********************************************************************************/

-- Q1: What are the top 5 most recently inscribed UNESCO sites?
-- A1: We want to know which sites were added most recently.

SELECT TOP 5 
    Name,
    Country_name,
    date_inscribed
FROM dbo.UNESCO_SITES
ORDER BY date_inscribed DESC;

-- Q2: How many UNESCO sites are there in each category (Cultural or Natural)?
-- A2: We want to count how many sites fall under each category type.

SELECT 
    category_long,
    COUNT(*) AS total_sites
FROM dbo.UNESCO_SITES
GROUP BY category_long
ORDER BY total_sites DESC;

-- Q3: Which countries have more than 5 UNESCO sites?
-- A3: This query shows which countries have a large number of sites.

SELECT 
    Country_name,
    COUNT(*) AS site_count
FROM dbo.UNESCO_SITES
GROUP BY Country_name
HAVING COUNT(*) > 5
ORDER BY site_count DESC;

-- Q4: What is the average area (in hectares) of Natural vs Cultural sites?
-- A4: This gives insight into how large the sites are depending on their category.

SELECT 
    category_long,
    AVG(CAST(area_hectares AS FLOAT)) AS avg_area_hectares
FROM dbo.UNESCO_SITES
WHERE area_hectares IS NOT NULL
GROUP BY category_long;
