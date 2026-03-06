#Total sales and average sales per item for each Item_Type

SELECT
  `Item Type`,
  SUM(`Total Sales`) AS total_sales,
  AVG(`Total Sales`) AS avg_sales_per_item
FROM smart_bazaar
GROUP BY `Item Type`
ORDER BY Total_Sales DESC;

#Total number of items sold per Outlet_Location_Type

SELECT
    `Outlet Location Type`,
    SUM(`Item Weight`) AS total_weight
FROM smart_bazaar
GROUP BY `Outlet Location Type`
ORDER BY total_weight DESC;

#Max, min, avg Item_Outlet_Sales for each Outlet_Type

SELECT 
    `Outlet Type`,
    MIN(`Total Sales`) AS min_sale,
    MAX(`Total Sales`) AS max_sale,
    AVG(`Total Sales`) AS avg_sale
FROM smart_bazaar
GROUP BY `Outlet Type`
ORDER BY AVG(`Total Sales`) DESC;


#Top 5 outlets with highest total revenue

SELECT
  `Outlet Identifier`,      
  SUM(`total Sales`) AS total_revenue
FROM smart_bazaar
GROUP BY `Outlet Identifier`
ORDER BY total_revenue DESC
LIMIT 5;


#Percentage contribution of each Item_Type to total sales

SELECT 
    `Item Type`,
    SUM(`total Sales`) AS total_sales,
    ROUND(100 * SUM(`total Sales`) / SUM(SUM(`total Sales`)) OVER (), 2) AS per_of_sale
FROM smart_bazaar
GROUP BY `Item Type`
ORDER BY total_sales DESC;

#Records where Item_Visibility > average visibility

SELECT *
FROM smart_bazaar
WHERE `Item Visibility` > (SELECT AVG(`Item Visibility`) FROM smart_bazaar);


#Items sold in multiple item types

select `item identifier` , `item type` , count(`item type`) as `outlet type`
from smart_bazaar
group by `item identifier` , `item type`
HAVING COUNT(DISTINCT `Outlet Type`) > 1
order by `outlet type` desc
limit 10 ;


select `item identifier` , 	`item type` , count(`item type`) as `outlet type`
from smart_bazaar
group by `item identifier` , `item type`
HAVING COUNT(DISTINCT `outlet type`) > 1
order by `outlet type` desc
limit 10 ;

#For each Outlet_Type, rank items by total sales (highest first)

SELECT
  `Outlet Type`,`Item identifier`,`Item type`,`Total Sales`,
  RANK() OVER (PARTITION BY `Outlet Type` ORDER BY `Total Sales` DESC) AS sales_rank
FROM (
  SELECT `Outlet Type`, `Item identifier`, `Item type`, SUM(`Total Sales`) AS `Total Sales`
  FROM smart_bazaar
  GROUP BY `Outlet Type`, `Item identifier`, `Item type`) s
ORDER BY `Outlet Type`, sales_rank;

#For each Item_fat_contain, find avg sales and compare each item’s sale to the average

SELECT 
    `Item Fat Content`,`Item Type`,
    CAST(SUM(`Total Sales`) AS DECIMAL(10,2)) AS total_sales,
    CAST(AVG(`Total Sales`) AS DECIMAL(10,1)) AS avg_total_sales,
    COUNT(*) AS no_of_item,
    CAST(AVG(`Rating`) AS DECIMAL(10,2)) AS avg_rating
FROM smart_bazaar
WHERE `Outlet Establishment Year` = 2000
GROUP BY `Item Fat Content`,`Item Type`
ORDER BY total_sales DESC;


#Item_Types that contribute > 10% of total sales

WITH type_sales AS (
    SELECT `Item Type`,
	SUM(`Total Sales`) AS sales,SUM(`Total Sales`) * 100.0 
	/ SUM(SUM(`Total Sales`)) OVER () AS pct_of_total
    FROM smart_bazaar
    GROUP BY `Item Type`
)
SELECT * FROM type_sales
WHERE pct_of_total > 10
ORDER BY pct_of_total DESC;


#Top 2 performing items in each outlet using

SELECT `Outlet Identifier`,`Outlet Size`,`Outlet Type`,`Item Type`,`Item Fat Content`,`Item Weight`
FROM (
    SELECT
        `Outlet Identifier`,`Outlet Size`,`Outlet Type`,`Item Type`,`Item Fat Content`,`Item Weight`,
        SUM(`Total Sales`) AS sales,
        DENSE_RANK() OVER (PARTITION BY `Outlet Identifier` ORDER BY SUM(`Total Sales`) DESC) AS sale_rank
    FROM smart_bazaar
    GROUP BY
        `Outlet Identifier`,`Outlet Size`,`Outlet Type`,`Item Type`,`Item Fat Content`,`Item Weight`
) t
WHERE sale_rank <= 2
ORDER BY `Outlet Identifier`, sale_rank;
