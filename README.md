<h2>Tourism Dataset – SQL Exploratory Data Analysis (EDA)</h2>
<h1>Project Overview</h1>
This project performs Exploratory Data Analysis (EDA) using SQL on a tourism dataset.
The goal is to understand tourism patterns, revenue drivers, visitor behavior, and generate business insights using clean, structured SQL queries.

<h1>Objectives</h1>

* Understand dataset structure and quality
* Perform data cleaning and validation using SQL
* Analyze visitors, revenue, ratings, and categories
* Apply CTEs and Window Functions
* Generate business-driven insights

 <h1>Dataset Information</h1>
 
* Source: Tourism_Dataset (CSV)

* Total Records: 5,989
  
* Total Columns: 7

| Column                  | Description                                          |
| ----------------------- | ---------------------------------------------------- |
| Location                | Tourist destination name                             |
| Country                 | Country of the destination                           |
| Category                | Type of destination (Nature / Cultural / Historical) |
| Visitors                | Number of visitors                                   |
| Rating                  | Average tourist rating                               |
| Revenue                 | Revenue generated                                    |
| Accommodation_Available | Availability of accommodation (Yes / No)             |

<h1>Tools & Technologies</h1>

* SQL
* DBeaver MySQL
* CSV Dataset

<h1>Project Structure</h1>

        Tourism-SQL-EDA
        │
        ├── tourism_dataset.csv
        ├── sql_queries.sql
        └── README.md

<h2>SQL EDA Workflow</h2>

1) Data Understanding

* Loaded CSV into SQL database

* Reviewed schema and data types

* Checked record counts

        SELECT COUNT(*) FROM tourism;

2) Data Quality Checks

* Missing values check

* Duplicate record detection

        SELECT
        COUNT(*) - COUNT(Visitors) AS missing_visitors
        FROM tourism;

3️) Univariate Analysis

* Category distribution

* Rating statistics

* Country count

        SELECT Category, COUNT(*)
        FROM tourism_dataset
        GROUP BY Category;

4️) Visitors & Revenue Analysis

* Total visitors and revenue

* Country-wise and category-wise breakdown

        SELECT Country, SUM(Revenue)
        FROM tourism_dataset
        GROUP BY Country;

5️) Advanced EDA using CTEs
Used Common Table Expressions (CTEs) for cleaner and modular analysis.

Country Performance Summary

        WITH country_summary AS (
        SELECT
        Country,
        SUM(Visitors) AS total_visitors,
        SUM(Revenue) AS total_revenue,
        AVG(Rating) AS avg_rating
        FROM tourism_dataset
        GROUP BY Country
        )
        SELECT *
        FROM country_summary
        ORDER BY total_revenue DESC;

6️) Window Functions
* Ranking countries by revenue

* Top locations per country

        ROW_NUMBER() OVER (PARTITION BY Country ORDER BY Revenue DESC)

7) Business Problem Identification
Identified high-visitor but low-rating locations, indicating service quality issues.

        Visitors > AVG(Visitors)
        AND Rating < AVG(Rating)

   <h2>Key Insights</h2>

* A small number of countries contribute to the majority of tourism revenue

* Cultural and Nature destinations generate higher revenue

* Accommodation availability positively impacts revenue

* Some popular destinations have low ratings, indicating service improvement opportunities

 <h2>Key Learnings</h2>

* Writing clean, readable SQL queries

* Using CTEs for complex analysis

* Applying Window Functions

* Translating data into business insights

<h2>Author</h2>

Abdul rahman

Data Analyst,india
