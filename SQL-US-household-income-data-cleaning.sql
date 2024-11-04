/* US household income - Data cleaning project by Virginia Herrero */

/* This project focuses on cleaning and preparing the two datasets for further analysis. 
   The cleaning process consists of removing duplicated data, null values, and standardize the data to ensure the overall integrity of the datasets. 
   The cleaned data will provide more accurate and insightful analysis, leading to a better understanding of the US household income.
*/

-- DATA LOADING
-- Create schema
CREATE SCHEMA us_household_income;

-- Use the newly created schema
USE us_household_income;

-- Load the csv files by means of the data import wizard
-- Dataset 1: geographic location
SELECT *
FROM us_geographic_location;

-- Dataset 2: income statistics
SELECT *
FROM us_income_statistics;

-- DATA STAGING
-- Essential step to ensure that the original data is not modified or deleted
-- Create staging tables
CREATE TABLE us_geographic_location_staging
LIKE us_geographic_location;

CREATE TABLE us_income_statistics_staging
LIKE us_income_statistics;

-- Insert the data from the original tables into the staging tables
INSERT us_geographic_location_staging
SELECT * 
FROM us_geographic_location;

INSERT us_income_statistics_staging
SELECT * 
FROM us_income_statistics;

-- Show all the data from the staging tables
-- Dataset 1: geographic location
SELECT *
FROM us_geographic_location_staging;

-- Dataset 2: income statistics
SELECT *
FROM us_income_statistics_staging;

-- COLUMN NAMES
-- Fix typos in Id column name
ALTER TABLE  us_income_statistics_staging 
RENAME COLUMN `ï»¿id` TO `Id`;

ALTER TABLE us_income_statistics_staging
RENAME COLUMN `sum_w` TO `Sum_W`;

ALTER TABLE  us_geographic_location_staging 
RENAME COLUMN `id` TO `Id`;

-- DUPLICATES: dataset 1 - geographic location
-- Identify duplicate values based on Id for the geographic location staging table
-- This query finds records where Id is repeated in this dataset
SELECT Id, COUNT(Id)
FROM us_geographic_location_staging
GROUP BY Id
HAVING COUNT(Id) > 1;

-- Find the Row ID's for all of the duplicates
-- This query selects the row id of the duplicated values
SELECT *
FROM (
    SELECT row_id, Id,
    ROW_NUMBER() OVER (PARTITION BY Id ORDER BY Id) AS Row_num
    FROM us_geographic_location_staging
     ) AS Duplicates_Geographic_Location
WHERE Row_num > 1;

-- Delete duplicates
-- This query selects the duplicated values retrieved by the previous query and deletes them
DELETE 
FROM us_geographic_location_staging
WHERE row_id IN 
(
    SELECT row_id
    FROM (
        SELECT row_id, Id,
        ROW_NUMBER() OVER(PARTITION BY Id ORDER BY Id) Row_num
        FROM us_geographic_location_staging
         ) AS Duplicates_Geographic_Location
WHERE Row_num > 1
);

-- DUPLICATES: dataset 2 - income statistics
-- Find duplicate values based on Id for the income statistics staging table
-- This query finds records where Id is repeated in this dataset. None are found
SELECT id, COUNT(id)
FROM us_income_statistics_staging
GROUP BY id
HAVING COUNT(id) > 1;

-- DROP UNNECESSARY COLUMNS
-- Through this query, columns that are not useful for this project are deleted
ALTER TABLE us_geographic_location_staging
DROP COLUMN ALand,
DROP COLUMN AWater,
DROP COLUMN Lat,
DROP COLUMN Lon;

-- STANDARZIDE DATA: dataset 1 - geographic location
-- Check State Names
-- This query retrieves all unique values for the column State_Name
SELECT DISTINCT State_Name, COUNT(State_Name)
FROM us_geographic_location_staging
GROUP BY State_Name;

-- Fix wrong spelling of Georgia and Alabama
-- These queries modify and update the spelling of the states
UPDATE us_geographic_location_staging
SET State_Name = 'Georgia'
WHERE State_Name = 'georia';

UPDATE us_geographic_location_staging
SET State_Name = 'Alabama'
WHERE State_Name = 'alabama';

-- Check State Abreviations
-- This query selects all unique values for the column State_ab
SELECT DISTINCT State_ab, COUNT(State_ab)
FROM us_geographic_location_staging
GROUP BY State_ab;

-- Check County
-- This query fetches all unique values for the column County
SELECT DISTINCT County
FROM us_geographic_location_staging
GROUP BY County;

-- Check City
-- This query retrieves all unique values for the column City
SELECT DISTINCT City
FROM us_geographic_location_staging
GROUP BY City;

-- Check Place
-- This query selects all unique values for the column Place
SELECT DISTINCT Place
FROM us_geographic_location_staging
GROUP BY Place;

-- This query finds all blank values for the column Place
SELECT *
FROM us_geographic_location_staging
WHERE Place = '';

-- This query populates the blank value previously queried with the corresponding values
UPDATE us_geographic_location_staging
SET Place = 'Autaugaville'
WHERE County = 'Autauga County' 
AND City = 'Vinemont'; 

-- Check Type
-- This query selects all unique values for the column Type
SELECT DISTINCT `Type`
FROM us_geographic_location_staging
GROUP BY `Type`;

-- This query fixes spelling and standardizes the column Type
UPDATE us_geographic_location_staging
SET `Type` = 'Borough'
WHERE `Type` = 'Boroughs';

-- Check Primary
-- This query selects all unique values for the column Primary
SELECT DISTINCT `Primary`
FROM us_geographic_location_staging
GROUP BY `Primary`;

-- This query fixes different spelling of Place
UPDATE us_geographic_location_staging
SET `Primary` = 'Place'
WHERE `Primary` = 'place';

-- Check Zip Code
-- This query selects all unique values for the column Zipe_Code
SELECT DISTINCT Zip_Code
FROM us_geographic_location_staging
GROUP BY Zip_Code;

-- Check Area Code
-- This query selects all unique values for the column Area_Code
SELECT DISTINCT Area_Code
FROM us_geographic_location_staging
GROUP BY Area_Code;

-- STANDARZIDE DATA: dataset 2 - income statistics
-- Check State Names
SELECT DISTINCT State_Name, COUNT(State_Name)
FROM us_income_statistics_staging
GROUP BY State_Name;

-- NULL VALUES: dataset 1 - geographic location
-- The following queries retrieve all zero, blank or null values for the different columns
-- No null values were found
SELECT State_Code
FROM us_geographic_location_staging
WHERE State_Code = 0 OR State_Code = '' OR State_Code IS NULL;

SELECT State_Name
FROM us_geographic_location_staging
WHERE State_Name = '' OR State_Name IS NULL;

SELECT State_ab
FROM us_geographic_location_staging
WHERE State_ab = '' OR State_ab IS NULL;

SELECT County
FROM us_geographic_location_staging
WHERE County = '' OR County IS NULL;

SELECT City
FROM us_geographic_location_staging
WHERE City = '' OR City IS NULL;

SELECT `Type`
FROM us_geographic_location_staging
WHERE `Type` = '' OR `Type` IS NULL;

SELECT `Primary`
FROM us_geographic_location_staging
WHERE `Primary` = '' OR `Primary` IS NULL;

SELECT Zip_Code
FROM us_geographic_location_staging
WHERE Zip_Code = 0 OR Zip_Code = '' OR Zip_Code IS NULL;

SELECT Area_Code
FROM us_geographic_location_staging
WHERE Area_Code = 0 OR Area_Code = '' OR Area_Code IS NULL;

-- NULL VALUES: dataset 2 - income statistics
-- The following query retrieves all values where mean is zero, blank or null
SELECT *
FROM us_income_statistics_staging
WHERE Mean = 0 OR Mean = '' OR Mean IS NULL;

/* All the elements with mean value zero also have median and standard deviation zero.
   The amount of zero values is 315 which is a small percentage of the whole dataset.
   For this reason, I decide to drop all the zero values to keep integrity of the data.
*/

-- Delete zero values
-- This query deletes all the value from the dataset where the mean is zero
DELETE
FROM us_income_statistics_staging
WHERE Mean = 0 OR Mean = '' OR Mean IS NULL; 

-- CLEAN DATASETS
-- Dataset 1: geographic location
SELECT *
FROM us_geographic_location_staging;

-- Dataset 2: income statistics
SELECT *
FROM us_income_statistics_staging;