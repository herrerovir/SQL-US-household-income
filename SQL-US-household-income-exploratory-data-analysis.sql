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

-- INCOME PER REGION
-- Northeast Region Average Income
-- This CTE query selects the average income in the northeast region
WITH Northeast_Region AS 
(
	SELECT g.`State_Name`, ROUND(AVG(`Mean`), 1) AS Avg_Income
	FROM us_geographic_location_staging AS g
	INNER JOIN us_income_statistics_staging AS i 
		ON g.Id = i.Id
	WHERE g.`State_Name` = "Connecticut" OR g.`State_Name` = "Maine" OR g.`State_Name` = "Massachusetts" OR g.`State_Name` = "New Hampshire" 
		OR g.`State_Name` = "Rhode Island" OR g.`State_Name` = "Vermont" OR g.`State_Name` = "New Jersey" OR g.`State_Name` = "New York" 
		OR g.`State_Name` = "Pennsylvania" OR g.`State_Name` = "Maryland" OR g.`State_Name` = "Delaware"
	GROUP BY g.`State_Name`
	ORDER BY 2
)
SELECT ROUND(AVG(Avg_Income), 1) AS Northeast_Average_Income
FROM Northeast_Region;

-- Highest income states in the northeast region
-- This query retrieves the top 3 states with highest income in the northeast area
WITH Northeast_Region AS 
(
	SELECT g.`State_Name`, ROUND(AVG(`Mean`), 1) AS Avg_Income
	FROM us_geographic_location_staging AS g
	INNER JOIN us_income_statistics_staging AS i 
		ON g.Id = i.Id
	WHERE g.`State_Name` = "Connecticut" OR g.`State_Name` = "Maine" OR g.`State_Name` = "Massachusetts" OR g.`State_Name` = "New Hampshire" 
		OR g.`State_Name` = "Rhode Island" OR g.`State_Name` = "Vermont" OR g.`State_Name` = "New Jersey" OR g.`State_Name` = "New York" 
		OR g.`State_Name` = "Pennsylvania" OR g.`State_Name` = "Maryland" OR g.`State_Name` = "Delaware"
	GROUP BY g.`State_Name`
	ORDER BY 2
)
SELECT `State_Name`, Avg_Income
FROM Northeast_Region
GROUP BY Avg_Income, `State_Name`
ORDER BY Avg_Income DESC
LIMIT 3;

-- Midwest Region Average Income
-- This query retrieves the top 3 states with highest income in the midwest area
WITH Midwest_Region AS 
(
	SELECT g.`State_Name`, ROUND(AVG(`Mean`), 1) AS Avg_Income
	FROM us_geographic_location_staging AS g
	INNER JOIN us_income_statistics_staging AS i 
		ON g.Id = i.Id
	WHERE g.`State_Name` = "Illinois" OR g.`State_Name` = "Indiana" OR g.`State_Name` = "Michigan" OR g.`State_Name` = "Ohio" 
		OR g.`State_Name` = "Wisconsin" OR g.`State_Name` = "Iowa" OR g.`State_Name` = "Kansas" OR g.`State_Name` = "Minnesota" 
		OR g.`State_Name` = "Missouri" OR g.`State_Name` = "Nebraska" OR g.`State_Name` = "North Dakota" OR g.`State_Name` = "South Dakota"
	GROUP BY g.`State_Name`
	ORDER BY 2
)
SELECT ROUND(AVG(Avg_Income), 1) AS Midwest_Average_Income
FROM Midwest_Region;

-- Highest income states in the midwest region
-- This query selects the top 3 states with highes income in the midwest region
WITH Midwest_Region AS 
(
	SELECT g.`State_Name`, ROUND(AVG(`Mean`), 1) AS Avg_Income
	FROM us_geographic_location_staging AS g
	INNER JOIN us_income_statistics_staging AS i 
		ON g.Id = i.Id
	WHERE g.`State_Name` = "Illinois" OR g.`State_Name` = "Indiana" OR g.`State_Name` = "Michigan" OR g.`State_Name` = "Ohio" 
		OR g.`State_Name` = "Wisconsin" OR g.`State_Name` = "Iowa" OR g.`State_Name` = "Kansas" OR g.`State_Name` = "Minnesota" 
		OR g.`State_Name` = "Missouri" OR g.`State_Name` = "Nebraska" OR g.`State_Name` = "North Dakota" OR g.`State_Name` = "South Dakota"
	GROUP BY g.`State_Name`
	ORDER BY 2
)
SELECT `State_Name`, Avg_Income
FROM Midwest_Region
GROUP BY Avg_Income, `State_Name`
ORDER BY Avg_Income DESC
LIMIT 3;

-- West Region Average Income
-- This query retrieves the top 3 states with highest income in the west area
WITH West_Region AS 
(
	SELECT g.`State_Name`, ROUND(AVG(`Mean`), 1) AS Avg_Income
	FROM us_geographic_location_staging AS g
	INNER JOIN us_income_statistics_staging AS i 
		ON g.Id = i.Id
	WHERE g.`State_Name` = "Arizona" OR g.`State_Name` = "Colorado" OR g.`State_Name` = "Idaho" OR g.`State_Name` = "Montana" 
		OR g.`State_Name` = "Nevada" OR g.`State_Name` = "New Mexico" OR g.`State_Name` = "Utah" OR g.`State_Name` = "Wyoming" 
		OR g.`State_Name` = "Alaska" OR g.`State_Name` = "California" OR g.`State_Name` = "Hawaii" OR g.`State_Name` = "Oregon"
		OR g.`State_Name` = "Washington"
	GROUP BY g.`State_Name`
	ORDER BY 2
)
SELECT ROUND(AVG(Avg_Income), 1) AS West_Average_Income
FROM West_Region;

-- Highest income states in the west region
-- This query retrieves the top 3 states with highest income in the west area
WITH West_Region AS 
(
	SELECT g.`State_Name`, ROUND(AVG(`Mean`), 1) AS Avg_Income
	FROM us_geographic_location_staging AS g
	INNER JOIN us_income_statistics_staging AS i 
		ON g.Id = i.Id
	WHERE g.`State_Name` = "Arizona" OR g.`State_Name` = "Colorado" OR g.`State_Name` = "Idaho" OR g.`State_Name` = "Montana" 
		OR g.`State_Name` = "Nevada" OR g.`State_Name` = "New Mexico" OR g.`State_Name` = "Utah" OR g.`State_Name` = "Wyoming" 
		OR g.`State_Name` = "Alaska" OR g.`State_Name` = "California" OR g.`State_Name` = "Hawaii" OR g.`State_Name` = "Oregon"
		OR g.`State_Name` = "Washington"
	GROUP BY g.`State_Name`
	ORDER BY 2
)
SELECT `State_Name`, Avg_Income
FROM West_Region
GROUP BY Avg_Income, `State_Name`
ORDER BY Avg_Income DESC
LIMIT 3;

-- South Region Average Income
-- This CTE query selects the average income in the south region
WITH South_Region AS 
(
	SELECT g.`State_Name`, ROUND(AVG(`Mean`), 1) AS Avg_Income
	FROM us_geographic_location_staging AS g
	INNER JOIN us_income_statistics_staging AS i 
		ON g.Id = i.Id
	WHERE g.`State_Name` = "Florida" OR g.`State_Name` = "Georgia" OR g.`State_Name` = "North Carolina" OR g.`State_Name` = "South Carolina" 
		OR g.`State_Name` = "Virginia" OR g.`State_Name` = "District of Columbia" OR g.`State_Name` = "West Virginia" OR g.`State_Name` = "Alabama" 
        	OR g.`State_Name` = "Kentucky" OR g.`State_Name` = "Mississippi" OR g.`State_Name` = "Tennessee" OR g.`State_Name` = "Arkansas" 
        	OR g.`State_Name` = "Louisiana" OR g.`State_Name` = "Oklahoma" OR g.`State_Name` = "Texas"
	GROUP BY g.`State_Name`
	ORDER BY 2
)
SELECT ROUND(AVG(Avg_Income), 1) AS South_Average_Income
FROM South_Region;

-- Highest income states in the northeast region
-- This query retrieves the top 3 states with highest income in the northeast area
WITH South_Region AS 
(
	SELECT g.`State_Name`, ROUND(AVG(`Mean`), 1) AS Avg_Income
	FROM us_geographic_location_staging AS g
	INNER JOIN us_income_statistics_staging AS i 
		ON g.Id = i.Id
	WHERE g.`State_Name` = "Florida" OR g.`State_Name` = "Georgia" OR g.`State_Name` = "North Carolina" OR g.`State_Name` = "South Carolina" 
		OR g.`State_Name` = "Virginia" OR g.`State_Name` = "District of Columbia" OR g.`State_Name` = "West Virginia" OR g.`State_Name` = "Alabama" 
        	OR g.`State_Name` = "Kentucky" OR g.`State_Name` = "Mississippi" OR g.`State_Name` = "Tennessee" OR g.`State_Name` = "Arkansas" 
       		OR g.`State_Name` = "Louisiana" OR g.`State_Name` = "Oklahoma" OR g.`State_Name` = "Texas"
	GROUP BY g.`State_Name`
	ORDER BY 2
)
SELECT `State_Name`, Avg_Income
FROM South_Region
GROUP BY Avg_Income, `State_Name`
ORDER BY Avg_Income DESC
LIMIT 3;

