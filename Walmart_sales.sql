CREATE DATABASE IF NOT EXISTS walmart_sales;

CREATE TABLE IF NOT EXISTS sales(
	invoice_id VARCHAR(30) NOT NULL PRIMARY KEY,
    branch VARCHAR(5) NOT NULL,
    city VARCHAR(30) NOT NULL,
    customer_type VARCHAR(30) NOT NULL,
    gender VARCHAR(30) NOT NULL,
    product_line VARCHAR(100) NOT NULL,
    unit_price DECIMAL(10, 2) NOT NULL,
    quantity INT NOT NULL,
    VAT FLOAT(6, 4) NOT NULL,
    total DECIMAL(12, 4) NOT NULL,
    date DATETIME NOT NULL,
    time TIME NOT NULL,
    payment_method VARCHAR(15) NOT NULL,
    cogs DECIMAL(10, 2) NOT NULL,
    gross_margin_percentage FLOAT(11, 9),
    gross_income DECIMAL(12, 4) NOT NULL,
    rating FLOAT(2, 1)
    );
    
    ---------------------------------------------------------------------------------------------------------------
    -- insert time_of_the_date
    SELECT
          time,
          (CASE
               WHEN 'time' BETWEEN "00:00:00" AND "12:00:00" THEN "Morning"
               WHEN 'time' BETWEEN "12:01:00" AND "16:00:00" THEN "AFTERNOON"
               ELSE "EVENING"
          END
          ) AS time_of_date
	FROM sales;

ALTER TABLE sales ADD COLUMN time_of_date VARCHAR(20);
SELECT * FROM walmart_sales.sales;

UPDATE sales 
SET time_of_date = (
	CASE
               WHEN 'time' BETWEEN "00:00:00" AND "12:00:00" THEN "Morning"
               WHEN 'time' BETWEEN "12:01:00" AND "16:00:00" THEN "AFTERNOON"
               ELSE "EVENING"
          END
);

-------------------day_name----------------
SELECT
	date,
    DAYNAME(date) AS day_name
FROM sales;
    
ALTER TABLE sales ADD COLUMN day_name VARCHAR(10);


UPDATE sales
SET day_name = DAYNAME(date);
SELECT * FROM walmart_sales.sales

----------------month_name----------
SELECT 
      date,
       MONTHNAME(date) AS month_name
FROM sales;
ALTER TABLE sales ADD COLUMN month_name VARCHAR(10);


UPDATE sales
SET month_name = MONTHNAME(date);

-----------EXPLORATORY_DATA_ANALYSIS------------------------------------------------------------------------------------------------------------
----------how many unique cities does the data have?-----------------------------------------------------------------------
SELECT DISTINCT city
FROM sales; 

----------------------in which city is each branch----------------------------------------------
SELECT 
DISTINCT city, 
         branch
FROM sales;

----------------------how many unique product lines does the data have------------------------------
SELECT 
     COUNT(DISTINCT product_line)
     FROM sales;
----------------------------What is the most common payment method?-------------------------------------------
SELECT 
    payment_method,
    COUNT(payment_method) AS total_count
FROM sales
GROUP BY payment_method
ORDER BY total_count DESC;
------------------------what is the most selling product line----------------------
SELECT 
    product_line,
    COUNT(product_line) AS total
FROM sales
GROUP BY product_line
ORDER BY total DESC;
-------------------------what is the total revenue by month?-------------------------
SELECT 
    month_name AS month,
    SUM(total) AS total_revenue
FROM sales
GROUP BY month_name
ORDER BY total_revenue DESC;
--------------------------what month had the highest cost of goods sold?-----------------------
SELECT
    month_name AS month,
    SUM(cogs) AS total_cogs
FROM sales
GROUP BY month_name
ORDER BY total_cogs DESC;
--------------------------------------------what product line had the highest revenue?-----------
SELECT 
   product_line,
   SUM(total) AS total_revenue
FROM sales
GROUP BY product_line
ORDER BY total_revenue DESC;
----------------------which branch sold more product than average product sold?----------------------------------
SELECT
  branch,
  SUM(quantity) AS qty, AVG(quantity) AS AVGqty
FROM sales
GROUP BY branch
HAVING SUM(quantity) > AVG(quantity);
------------------------what is the most common product_line by gender?-------------------
SELECT
    gender,
    product_line,
    COUNT(gender) AS no_of_gender
FROM sales
GROUP BY gender, product_line
ORDER BY no_of_gender DESC;
--------------------------what is the average raing of each product line?-------------------
SELECT
    product_line,
    ROUND(AVG(rating), 2) AS avg_rating
FROM sales
GROUP BY product_line
ORDER BY avg_rating DESC;
------------------------which of the customer types brings the most revenue?-----------------------------------------
SELECT 
   customer_type,
    SUM(total) AS total_revenue
FROM sales
GROUP BY customer_type
ORDER BY total_revenue DESC;
-----------------------------------------which city has the largest tax percent/VAT (value added tax)------------------------------------------
SELECT
     city,
     AVG(VAT) AS vat
FROM sales
GROUP BY city
ORDER BY vat DESC;
--------------------------------------------which customer pays the most VAT?------------------------------------------
SELECT
     customer_type,
     SUM(VAT) AS vat
FROM sales
GROUP BY customer_type
ORDER BY vat DESC;
----------------------------how many unique cusomer does the data have-------------------
SELECT
     DISTINCT customer_type AS unique_customer
FROM sales;
-------------------------------------How man unique payments method does the data have--------------------------------------------------
SELECT
     DISTINCT payment_method 
FROM sales;
-----------------Which customer type buys the most?--------------------------------------------
SELECT 
    customer_type,
    COUNT(*) AS customer_count
FROM sales
GROUP BY customer_type
ORDER BY customer_count DESC
---------------------------------what is the gender of most of the customers----------------------
SELECT
   gender,
   COUNT(*) AS gender_count
FROM sales
GROUP BY gender
ORDER BY gender_count;
---------------------------what is the gender distribution of each branch-----------------------------------------
SELECT
   gender,
   COUNT(*) AS gender_count
FROM sales
WHERE branch = 'A'
GROUP BY gender
ORDER BY gender_count;
SELECT
   gender,
   COUNT(*) AS gender_count
FROM sales
WHERE branch ='B'
GROUP BY gender
ORDER BY gender_count;
SELECT
   gender,
   COUNT(*) AS gender_count
FROM sales
WHERE branch = 'C'
GROUP BY gender
ORDER BY gender_count;
------------------------------Which day of the week has the best avg rating------------------------------------
SELECT
     day_name,
     AVG(rating) AS avg_rating
FROM sales
GROUP BY day_name
ORDER BY avg_rating DESC;

----------------------------Which day of the week has the highest rating per branch------------------------
SELECT
     day_name,
     AVG(rating) AS avg_rating
FROM sales
WHERE branch = 'A'
GROUP BY day_name
ORDER BY avg_rating DESC;

SELECT
     day_name,
     AVG(rating) AS avg_rating
FROM sales
WHERE branch = 'B'
GROUP BY day_name
ORDER BY avg_rating DESC;

SELECT
     day_name,
     AVG(rating) AS avg_rating
FROM sales
WHERE branch = 'C'
GROUP BY day_name
ORDER BY avg_rating DESC;

