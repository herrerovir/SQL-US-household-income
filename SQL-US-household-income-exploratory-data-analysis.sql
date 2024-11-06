/* US household income - Exploratory data analysis project by Virginia Herrero */

/* This project focuses on exploring the variables to find insightful information, patterns and trends. */

-- Use the desired schema
USE us_household_income;

-- Select all the data from the previously cleaned datasets
SELECT *
FROM us_geographic_location_staging;

SELECT * 
FROM us_income_statistics_staging;
