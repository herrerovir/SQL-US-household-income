/* US household income - Exploratory data analysis project by Virginia Herrero */

/* This project focuses on exploring the variables to find insightful information, patterns and trends. */

-- Use the desired schema
USE us_household_income;

-- Select all the data from the previously cleaned datasets
SELECT *
FROM us_geographic_location_staging;

SELECT * 
FROM us_income_statistics_staging;

/* UNIVARIATE EXPLORATION : This analysis consist of analyzing every variable individually. */

-- STATES EXPLORATION
-- Number of unique state names 
-- This query calculates the count of distinct states
SELECT COUNT(DISTINCT (State_Name)) AS `Total Amount of States`
FROM us_geographic_location_staging;

-- List of all the state names
-- This query shows the whole list of the different states
SELECT DISTINCT State_Name
FROM us_geographic_location_staging;

-- LOCATION TYPE EXPLORATION
-- Number of unique location types
-- This query calculates the count of distinct types of location
SELECT COUNT(DISTINCT (`Type`)) AS `Total Amount of Locations Types`
FROM us_geographic_location_staging;

-- List of all the location types
-- This query shows all the location types
SELECT DISTINCT `Type`
FROM us_geographic_location_staging;

-- MEAN INCOME EXPLORATION
-- Lowest income in the US
-- This query retrieves the lowest mean income 
SELECT MIN(`Mean`) AS Lowest_Income
FROM us_income_statistics_staging;

-- Highest income in the US
-- This query retrieves the highest mean income 
SELECT MAX(`Mean`) AS Highest_Income
FROM us_income_statistics_staging;

-- Average income in the US
-- This query retrieves the average income
SELECT ROUND(AVG(`Mean`), 0) AS Average_Income
FROM us_income_statistics_staging;

-- Median income in the US
-- This query retrieves the median income
SELECT ROUND(AVG(`Median`), 0) AS Median_Income
FROM us_income_statistics_staging;

/* BIVARIATE ANALYSIS: This analysis consist in finding relations between two variables */

-- Join both tables to collect useful data
SELECT *
FROM us_geographic_location_staging AS g
INNER JOIN us_income_statistics_staging AS i 
    ON g.Id = i.Id;
    
-- INCOME PER STATE
-- Income distribution per state
-- This query selects the average mean income per state ordered by lowest income
SELECT g.`State_Name`, ROUND(AVG(`Mean`), 1) AS Avg_Income
FROM us_geographic_location_staging AS g
INNER JOIN us_income_statistics_staging AS i 
    ON g.Id = i.Id
GROUP BY g.`State_Name`
ORDER BY 2;

-- Top 5 states with lowest income
-- This query fetches the 5 states with the lowest average income
SELECT g.`State_Name`, ROUND(AVG(`Mean`), 1) AS Avg_Income
FROM us_geographic_location_staging AS g
INNER JOIN us_income_statistics_staging AS i 
    ON g.Id = i.Id
GROUP BY g.`State_Name`
ORDER BY Avg_Income
LIMIT 5;

-- Top 5 states with highest average income
-- This query selects the average mean income per state ordered by highest income
SELECT g.`State_Name`, ROUND(AVG(`Mean`), 1) AS Avg_Income
FROM us_geographic_location_staging AS g
INNER JOIN us_income_statistics_staging AS i 
    ON g.Id = i.Id
GROUP BY g.`State_Name`
ORDER BY Avg_Income DESC
LIMIT 5;

-- INCOME PER LOCATION TYPE
-- Highest average income per Type of location
SELECT `Type`, COUNT(`Type`) AS Count_Type, ROUND(AVG(`Mean`), 1) Avg_Income
FROM us_geographic_location_staging AS g
INNER JOIN us_income_statistics_staging AS i 
    ON g.Id = i.Id
GROUP BY `Type`
ORDER BY Avg_Income DESC;

-- Filter data with higher count of location type
SELECT `Type`, COUNT(`Type`) AS Count_Type, ROUND(AVG(`Mean`), 1) Avg_Income
FROM us_geographic_location_staging AS g
INNER JOIN us_income_statistics_staging AS i 
    ON g.Id = i.Id
GROUP BY `Type`
HAVING COUNT(`Type`) > 100
ORDER BY Avg_Income DESC;

-- INCOME PER CITY
-- Income distribution per city
-- This query selects the average mean income per city ordered by highest income
SELECT g.`State_Name`, `City`, ROUND(AVG(`Mean`), 1) AS Avg_Income
FROM us_geographic_location_staging AS g
INNER JOIN us_income_statistics_staging AS i 
    ON g.Id = i.Id
GROUP BY g.`State_Name`, `City`
ORDER BY Avg_Income DESC;

-- Top 5 cities with highest average income
-- This query select the 5 cities with the highest average income
SELECT g.`State_Name`, `City`, ROUND(AVG(`Mean`), 1) AS Avg_Income
FROM us_geographic_location_staging AS g
INNER JOIN us_income_statistics_staging AS i 
    ON g.Id = i.Id
GROUP BY g.`State_Name`, `City`
ORDER BY Avg_Income DESC
LIMIT 5;

-- Top 5 city with lowest average income
-- This query select the 5 cities with the lowest average income
SELECT g.`State_Name`, `City`, ROUND(AVG(`Mean`), 1) AS Avg_Income
FROM us_geographic_location_staging AS g
INNER JOIN us_income_statistics_staging AS i 
    ON g.Id = i.Id
GROUP BY g.`State_Name`, `City`
ORDER BY Avg_Income
LIMIT 5;
