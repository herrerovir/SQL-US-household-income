# 💰 U.S. household income: data cleaning and exploratory analysis

This repository contains a data cleaning project and an exploratory analysis of the household income in the United States using SQL. 

## Table of content
 - [Intro](https://github.com/herrerovir/SQL-US-household-income/blob/main/README.md#Introduction)
 - [Goal](https://github.com/herrerovir/SQL-US-household-income/blob/main/README.md#Goal)
 - [Project Overview](https://github.com/herrerovir/SQL-US-household-income/blob/main/README.md#Project-Overview)
 - [Dependencies](https://github.com/herrerovir/SQL-US-household-income/blob/main/README.md#Dependencies)
 - [Technical skills](https://github.com/herrerovir/SQL-US-household-income/blob/main/README.md#Technical-skills)
 - [Datasets](https://github.com/herrerovir/SQL-US-household-income/blob/main/README.md#Data-set)
 - [Data Cleaning](https://github.com/herrerovir/SQL-US-household-income/blob/main/README.md#Data-cleaning)
 - [Data Exploration](https://github.com/herrerovir/SQL-US-household-income/blob/main/README.md#Data-exploration)
 - [Insights](https://github.com/herrerovir/SQL-US-household-income/blob/main/README.md#Insights)

## Introduction
Household income is the total gross income before taxes, received within a 12-month period by all members of a household, whether related or not, above a specified age. 
The household income is the sum of all salaries, wages, profits and other forms of income before subtracting any taxes or deductions. 
Household income provides a picture of the standard of living of individual households. It is also a good barometer of the local and national economy. 

This project is focused on analyzing household income in different areas of the United States and comparing living conditions across geographic regions.

## Goal
The main objective of this project is to clean and preprocess two different datasets to perform an exploratory data analysis in order to obtain all insightful information, patterns or trends of U.S. household income and its distribution across different regions.

The workflow of this analysis includes the following steps: database creation, loading the data into MySQL Workbench, data cleaning and data exploration using MySQL's powerful queries.

Through data exploration, it is expected to find answers to the following points:

* Lowest and highest household income
* Average household income
* Median household income
* Location type with the highest household income
* Top 5 states with the highest household income
* Top 5 states with the lowest household income 
* Top 5 cities with the highest household income
* Top 5 cities with the lowest household income
* Income distribution per geographical region:
    - Northeast region: average household income and top 3 cities with highest income
    - Midwest region: average household income and top 3 cities with the highest income
    - West region: average household income and top 3 cities with the highest income
    - South region: average household income and top 3 cities with the highest income 

## Project overview
   1. Data loading
   2. Data cleaning
   3. Data exploration
   4. Insights

## Dependencies
The following software is required to carry out this project:

* MySQL Workbench 8.0 CE

## Technical skills
The following skills were used throughout the implementation of this project:

* Database creation
* Data definition
* Data manipulation
* Data querying

## Datasets
Two datasets have been used in this project. 

The first dataset contains geographic information for the United States and consists of 32292 rows and 16 columns. 

The second dataset contains statistical information on income in the United States and consists of 32526 rows and 6 columns.

The datasets for this analysis can be found uploaded in this repository as US-geographic-location.cvs and US-income-statistics.

## Data cleaning
The first step of the project was to create the schema in MySQL Workbench. This was followed by loading the cvs data files into the database using the data import wizard. After successfully loading the data, it had to be cleaned to ensure its integrity and reliability. Due to MySQL's powerful query functions, the raw datasets were transformed into clean, structured and reliable datasets suitable for further analysis.

## Data exploration
To obtain useful information from the datasets, an in-depth exploratory analysis was carried out. 

A univariate analysis was carried out to find relevant information for each of the variables. Subsequently, a bivariate analysis was performed to find insightful information about the U.S. household income across different geographical regions.

## Insights
During this project, a large amount of U.S. household income data was successfully analyzed. As expected, valuable and insightful information was obtained from this analysis. The results retrieved through SQL queries are well documented in the sql file named SQL-household-income-exploratory-analysis.sql. These findings and results are presented below.

### **States**
This analysis is performed in the 50 states of the United States, Washington D.C. and Puerto Rico. 

### **Lowest household income in the U.S.**

The lowest average income of U.S. households is $5000.

### **Highest household income in the U.S**

The highest average income of U.S households is $242857.

### **Average household income in the U.S**

The average income of U.S households is $67356. 

### **Median household income in the U.S**

The median income of U.S households is $86289.

The median household income in the United States is higher than the mean income. This indicates that the income distribution is skewed to the left, with lower incomes being greater in number than higher incomes.

### **Location type with the highest household income in the U.S.** 

The location type with the highest income in the U.S is the borough, and the lowest is town.

<small> Table 1. Location type with the highest household income in the U.S. </small>

| Location type   | Household Income  $ |
| --------------- | ------------------- |
| Borough         | 68594.4             |
| Track           | 68145.1             |
| CDP             | 64623.3             |
| Village         | 61548.6             |
| City            | 58220.8             |
| Town            | 55194.1             |

### **Top 5 states with highest the household income**

Listed below are the 5 states with the highest household income in the United States.

<small> Table 2. States with the highest household income in the U.S. </small>

| U.S. State           | Household Income  $ |
| -------------------- | ------------------- |
| District of Columbia | 90668.4             |
| Connecticut          | 89732.8             |
| New Jersey           | 89565.4             |
| Maryland             | 88444.2             |
| Massachusetts        | 85645.7             |

### **Top 5 states with lowest the household income**

The 5 states with the lowest household income in the U.S. are listed below.

<small> Table 3. States with the lowest household income in the U.S. </small>

| U.S. State           | Household Income  $ |
| -------------------- | ------------------- |
| Puerto Rico          | 27841.7             |
| Mississippi          | 49385.6             |
| Arkansas             | 52213.9             |
| West Virginia        | 52292.0             |
| Alabama              | 54023.8             |

### **Top 5 cities with highest the household income**

Listed below are the top 5 cities with the highest household income in the United States.

<small> Table 4. Cities with the highest household income in the U.S. </small>

| U.S. State           | City                | Household Income  $ |
| -------------------- | ------------------- | ------------------- |
| Alaska               | Delta Junction      | 242857.0            |
| New Jersey           | Short Hills         | 216503.0            |
| Pennsylvania         | Narberth            | 194426.0            |
| Maryland             | Chevy Chase         | 194157.5            |
| Connecticut          | Darien              | 192882.0            |

### **Top 5 cities with lowest the household income**

Listed below are the 5 cities with the lowest U.S. household incomes.

<small> Table 5. Cities with the lowest household income in the U.S. </small>

| U.S. State           | City                | Household Income $  |
| -------------------- | ------------------- | ------------------- |
| Colorado             | Center              | 10946.0             |
| New Mexico           | Estancia            | 11375.0             |
| South Dakota         | Corsica             | 13534.0             |
| Kentucky             | Mount Olivet        | 13882.0             |
| North Dakota         | Fordvi              | 13982.0             |

### **Household income per U.S. geographical region**

* **Northeast region**

The average household income in the Northeast region of the U.S. is **$76541.2**. 

Listed below are the 5 states with the highest rents in the Northeast region of the U.S.

<small> Table 6. States in the Northeast region of the U.S. with the highest household income </small>

| U.S. State           | Household Income  $ |
| -------------------- | ------------------- |
| Connecticut          | 89732.8             |
| New Jersey           | 89565.4             |
| Maryland             | 88444.2             |

* **Midwest region**

The average household income in the Midwest region of the U.S. is **$62776.1**. 

The following are the top 5 states with the highest incomes in the Midwest region of the U.S.

<small> Table 7. States in the Midwest region of the U.S. with the highest household income </small>

| U.S. State           | Household Income  $ |
| -------------------- | ------------------- |
| Minnesota            | 71665.6             |
| Illinois             | 69358.2             |
| North Dakota         | 64748.7             |

#### **West region**

The average household income in the West region of the U.S. is **$69394.0**. 

Listed below are the 5 states with the highest rents in the West U.S. region.

<small> Table 8. States in the West region of the U.S. with the highest household income </small>

| U.S. State           | Household Income  $ |
| -------------------- | ------------------- |
| Hawaii               | 82992.1             |
| Alaska               | 81311.8             |
| California           | 78742.0             |

#### **South region**

The average household income in the South region of the U.S. is **$60408.0**. 

The following are the top 5 states with the highest incomes in the South region of the U.S.

<small> Table 9. States in the South region of the U.S. with the highest household income </small>

| U.S. State           | Household Income  $ |
| -------------------- | ------------------- |
| District of Columbia | 90668.4             |
| Virginia             | 80426.3             |
| Texas                | 66446.7             |


From these results it can be concluded that the region with the highest average household income in the U.S. is the Northeast region, while the South is the region with the lowest average income. It should be noted that although the South is the region with the lowest average income, it is home to one of the wealthiest districts, Washington D.C., the nation's capital.

Looking ahead, there are several areas that merit further exploration:
* Expand the data set: Increase the robustness of the analysis by incorporating a larger and more diverse data set.
* Visualization: this data analysis project can be more comprehensive with proper visualization of the queries employed during this study using a suitable BI tool. 
