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
