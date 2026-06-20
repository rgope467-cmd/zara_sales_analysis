--1. Dataset Overview
--Total Products
SELECT COUNT(*)
 FROM `ancient-bond-498614-p0.zara_sales.zara_sales_cleaned`
  LIMIT 1000;

  --Total Sales Volume
  SELECT SUM(sales_volume) AS total_sales
  FROM `ancient-bond-498614-p0.zara_sales.zara_sales_cleaned`;

  --Average Sales Volume
    SELECT AVG(sales_volume) AS avg_sales
    FROM `ancient-bond-498614-p0.zara_sales.zara_sales_cleaned`;

    --2. Top-Selling Products
    --Top 10 Products by Sales
    SELECT name,
           sales_volume
    FROM  `ancient-bond-498614-p0.zara_sales.zara_sales_cleaned`
    ORDER BY sales_volume DESC 
    LIMIT 10;  

    --Bottom 10 Products by Sales
    SELECT name,
           sales_volume
    FROM  `ancient-bond-498614-p0.zara_sales.zara_sales_cleaned`
    ORDER BY sales_volume ASC
    LIMIT 10; 

--3. Promotion Effectiveness
--Sales by Promotion Status
SELECT promotion,
       COUNT(*) AS products,
       AVG(sales_volume) AS avg_sales,
       SUM(sales_volume) AS total_sales
 FROM  `ancient-bond-498614-p0.zara_sales.zara_sales_cleaned`
 GROUP BY promotion;

 --4. Product Position Analysis
--Sales by Product Position
SELECT product_position,
       COUNT(*) AS products,
       AVG(sales_volume) AS avg_sales,
       SUM(sales_volume) AS total_sales
FROM `ancient-bond-498614-p0.zara_sales.zara_sales_cleaned`
GROUP BY product_position
ORDER BY total_sales DESC;

--5. Seasonal Analysis
--Seasonal vs Non-Seasonal
 SELECT seasonal,
       COUNT(*) AS products,
       AVG(sales_volume) AS avg_sales,
       SUM(sales_volume) AS total_sales
FROM `ancient-bond-498614-p0.zara_sales.zara_sales_cleaned`
GROUP BY seasonal;

--6. Product Category Analysis
--Best-Selling Categories
SELECT terms,
       SUM(sales_volume) AS total_sales
FROM `ancient-bond-498614-p0.zara_sales.zara_sales_cleaned`
GROUP BY terms
ORDER BY total_sales DESC;

--7. Section Analysis
--Sales by Section
SELECT section,
       COUNT(*) AS products,
       AVG(sales_volume) AS avg_sales,
       SUM(sales_volume) AS total_sales
FROM `ancient-bond-498614-p0.zara_sales.zara_sales_cleaned`
GROUP BY section
ORDER BY total_sales DESC;

--8. Promotion + Position Analysis
--Does Promotion Work Better in Certain Positions?
SELECT product_position,
       promotion,
       AVG(sales_volume) AS avg_sales,
       SUM(sales_volume) AS total_sales
FROM `ancient-bond-498614-p0.zara_sales.zara_sales_cleaned`
GROUP BY product_position, promotion
ORDER BY product_position;

--9. Seasonal + Promotion Analysis
--Seasonal Products Under Promotion
SELECT seasonal,
       promotion,
       AVG(sales_volume) AS avg_sales,
       SUM(sales_volume) AS total_sales
FROM `ancient-bond-498614-p0.zara_sales.zara_sales_cleaned`
GROUP BY seasonal, promotion;

--10. Top Products Within Each Position
SELECT product_position,
       name,
       sales_volume
FROM `ancient-bond-498614-p0.zara_sales.zara_sales_cleaned`
QUALIFY ROW_NUMBER() OVER (
    PARTITION BY product_position
    ORDER BY sales_volume DESC
) <= 5;

--11. Sales Distribution by Brand
--dataset only contains Zara:
SELECT brand,
       COUNT(*) AS products,
       SUM(sales_volume) AS total_sales
FROM `ancient-bond-498614-p0.zara_sales.zara_sales_cleaned`
GROUP BY brand;

--12. Key Performance Indicators (KPIs) Query for Power BI
SELECT
    COUNT(*) AS total_products,
    SUM(sales_volume) AS total_sales,
    AVG(sales_volume) AS avg_sales,
    MAX(sales_volume) AS highest_sales
FROM `ancient-bond-498614-p0.zara_sales.zara_sales_cleaned`;