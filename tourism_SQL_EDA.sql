select * from tourism_dataset;
select * from tourism_dataset limit 20;

-- COUNT TOTAL RECORDS
select count(*) as total_rows
from tourism_dataset;

-- CHECK COLUMN NAMES 
describe tourism_dataset;

-- MISSING VALUES CHECK
SELECT 
COUNT(*) - COUNT(Location) AS missing_location,
COUNT(*) - COUNT(Country) AS missing_country,
COUNT(*) - COUNT(Category) AS missing_category,
COUNT(*) - COUNT(Visitors) AS missing_visitors,
COUNT(*) - COUNT(Rating) AS missing_rating,
COUNT(*) - COUNT(Revenue) AS missing_revenue,
COUNT(*) - COUNT(Accommodation_Available) AS missing_accommodation
FROM tourism_dataset;

-- DUPLICATE CHECK
select Location,Country
from tourism_dataset
group by Location,Country
having count(*)>1;

-- UNIVARIATE ANALYSIS
---- UNIQUE COUNTRIES

select COUNT(distinct Country) as total_countries
from tourism_dataset;

-- CATEGORY DISTRIBUTION
select category,count(*) as total_places
from tourism_dataset
group by Category
order by total_places desc;

--- CALCULATE TOTAL LOCATION BY COUNTRY
select Country,count(distinct Location) as total_locations
from tourism_dataset
group by Country
order by total_locations desc;

-- Countries ranked by Average Rating
SELECT Country,
ROUND(AVG(Rating), 2) AS avg_rating
FROM tourism_dataset
GROUP BY Country
ORDER BY avg_rating DESC;

--- VISITORS & REVENUE ANALYSIS
-- TOTAL VISITORS
select SUM(Visitors) as total_visitors
FROM tourism_dataset;

--- TOTAL REVENUE
select ROUND(SUM(Revenue),2) as total_revenue
FROM tourism_dataset;

--- COUNTRY LEVEL ANALYSIS
select * from tourism_dataset;

-- Visitors by country
select Country,
sum(Visitors) as total_visitors
from tourism_dataset
group by Country
order by total_visitors desc;

-- Revenue by country
select Country, 
round(sum(Revenue),2) as total_revenue
from tourism_dataset
group by Country
order by total_revenue desc;

--- CATEGORY INSIGHTS
--- Revenue by category
select Category,
Round(sum(Revenue),2) as total_revenue
from tourism_dataset
group by Category
order by total_revenue desc;

-- Average rating by category
select Category,
round(avg(Rating),2) as avg_rating
from tourism_dataset
group by Category;

--- ACCOMMODATION ANALYSIS
select * from tourism_dataset;

-- Accommodation availability split
select Accommodation_Available,
count(*) as total_locations
from tourism_dataset
group by Accommodation_Available;

-- Revenue VS accommodation
select Accommodation_Available,
round(sum(Revenue),2) as  total_revenue
from tourism_dataset
group by Accommodation_Available;

--- TOP 10 REVENUE LOCATIONS
select Location,Country,Revenue
from tourism_dataset
order by Revenue desc limit 10;

--- MOST VISITED LOCATIONS
select Location,Country,Visitors
from tourism_dataset
order by Visitors desc limit 10;