# Walmart_Sales_Analysis
![](image0.png.jpg)

## INTRODUCTION
In this project, we will explore the **Walmart Sales data** to gain insights into top-performing branches and products, sales trends of different products, and customer behavior. Our ultimate goal is to study how sales strategies can be improved and optimized.

## Dataset Description
The dataset used for this project is obtained from the Kaggle Walmart Sales Forecasting Competition. It contains historical sales data for 45 Walmart stores located in different regions. Each store has multiple departments, and participants must predict the sales for each department in each store. Additionally, selected holiday markdown events are included in the dataset, which can impact sales but are challenging to predict. The data contains 17 columns and 1000 rows.

| Column                  | Description                             | Data Type      |
| :---------------------- | :-------------------------------------- | :------------- |
| invoice_id              | Invoice of the sales made               | VARCHAR(30)    |
| branch                  | Branch at which sales were made         | VARCHAR(5)     |
| city                    | The location of the branch              | VARCHAR(30)    |
| customer_type           | The type of the customer                | VARCHAR(30)    |
| gender                  | Gender of the customer making purchase  | VARCHAR(10)    |
| product_line            | Product line of the product solf        | VARCHAR(100)   |
| unit_price              | The price of each product               | DECIMAL(10, 2) |
| quantity                | The amount of the product sold          | INT            |
| VAT                 | The amount of tax on the purchase       | FLOAT(6, 4)    |
| total                   | The total cost of the purchase          | DECIMAL(10, 2) |
| date                    | The date on which the purchase was made | DATE           |
| time                    | The time at which the purchase was made | TIMESTAMP      |
| payment_method                 | The total amount paid                   | DECIMAL(10, 2) |
| cogs                    | Cost Of Goods sold                      | DECIMAL(10, 2) |
| gross_margin_percentage | Gross margin percentage                 | FLOAT(11, 9)   |
| gross_income            | Gross Income                            | DECIMAL(10, 2) |
| rating                  | Rating                                  | FLOAT(2, 1)    |

## Analysis List

## Product Analysis
Analyze product lines to identify top performers and areas for improvement.
Examine product categories to understand customer preferences and purchasing habits.
Evaluate product pricing and inventory management strategies to optimize sales and profitability.

## Sales Analysis
Analyze sales trends to measure the effectiveness of current sales strategies.
Identify areas of improvement in the sales process to increase revenue and customer engagement.
Evaluate the impact of promotions, discounts, and other marketing initiatives on sales.

## Customer Analysis
Segment customers based on purchasing behavior, demographics, and other relevant factors.
Analyze customer purchase trends to identify opportunities for cross-selling and upselling.
Evaluate customer profitability to identify high-value customers and optimize marketing efforts.

## Approach Used

## Data Wrangling
This initial step involves inspecting the data to ensure that there are no NULL values or missing values, and using data replacement methods to fill in any gaps. Since we have set NOT NULL for each field in our database, we can be confident that there are no NULL values present. Therefore, we can skip this step and proceed directly to building the database and creating tables to store our data.

 ## Feature Engineering
 Add a new column named "time_of_date" to give insights into sales during different parts of the day. This column will be created by extracting the time of day from the existing "transaction_time" column and grouping it into three categories: morning (6:00 AM - 12:00 PM), afternoon (12:00 PM - 6:00 PM), and evening (6:00 PM - 12:00 AM).

Add a new column named "day_name" that contains the extracted days of the week on which the given transaction took place. This column will be created by using a date_format function to extract the day of the week from the "transaction_date" column, and then grouping the data into six categories: Monday, Tuesday, Wednesday, Thursday, Friday, and Saturday.

Add a new column named "month_name" that contains the extracted months of the year on which the given transaction took place. This column will be created by using a date_format function to extract the month of the year from the "transaction_date" column, and then grouping the data into 12 categories: January, February, March, April, May, June, July, August, September, October, and November. 

## Business questions to answer

1.How many unique cities does the data have?

2.In which city is each branch?

3.How many unique product lines does the data have?

4.What is the most common payment method?

5.What is the most selling product line?

6.What is the total revenue by month?

7.What month had the largest COGS?

8.What product line had the largest revenue?

9.What is the city with the largest revenue?

10.What product line had the largest VAT?

11.Which branch sold more products than average product sold?

12.What is the most common product line by gender?

13.What is the average rating of each product line?

14.Number of sales made in each time of the day per weekday

15.Which of the customer types brings the most revenue?

16.Which city has the largest tax percent/ VAT (Value Added Tax)?

17.Which customer type pays the most in VAT?

18.How many unique customer types does the data have?

19.How many unique payment methods does the data have?

20.What is the most common customer type?

21.Which customer type buys the most?

22.What is the gender of most of the customers?

23.Which time of the day do customers give most ratings per branch?

24.Which day fo the week has the best avg ratings?

25.Which day of the week has the best average ratings per branch?

## Revenue and Profit Calculations

$ COGS = unitsPrice * quantity $

$ VAT = 5\% * COGS $

$VAT$ is added to the $COGS$ and this is what is billed to the customer.

$ total(gross_sales) = VAT + COGS $

$ grossProfit(grossIncome) = total(gross_sales) - COGS $

**Gross Margin** is gross profit expressed in percentage of the total(gross profit/revenue)

$ \text{Gross Margin} = \frac{\text{gross income}}{\text{total revenue}} $

<u>**Example with the first row in our DB:**</u>

**Data given:**

- $ \text{Unite Price} = 45.79 $
- $ \text{Quantity} = 7 $

$ COGS = 45.79 * 7 = 320.53 $

$ \text{VAT} = 5\% * COGS\\= 5\%  320.53 = 16.0265 $

$ total = VAT + COGS\\= 16.0265 + 320.53 = $336.5565$

$ \text{Gross Margin Percentage} = \frac{\text{gross income}}{\text{total revenue}}\\=\frac{16.0265}{336.5565} = 0.047619\\\approx 4.7619\% $

## Code

https://github.com/Bessdatahub/Walmart_Sales_Analysis/blob/main/Walmart_sales.sql

![](thanks.jpg)
