--sales analytics 
SELECT * FROM customers;
SELECT * FROM products; 
SELECT * FROM transactions;

--- tables join 
SELECT * 
FROM transactions t 
JOIN customers c ON c.customer_id = t.customer_id 
JOIN products p ON p.product_category = t.product_category

--- total sales 
SELECT SUM(total_amount) AS Revenue FROM transactions 

--- average sales 
SELECT AVG(total_amount) AS Average_Sale FROM transactions

--- maximum and minimum sale 
SELECT MAX(total_amount) AS Maximum_Sale, MIN(total_amount)AS Minimum_Sale FROM transactions

-- average customer age 
SELECT AVG(age) AS Average_Age FROM customers

--- different categories 
SELECT DISTINCT(product_category) FROM products;

--- sales per category 
SELECT p.product_category, SUM(t.total_amount) AS Sales_per_category
FROM transactions t 
JOIN products p ON p.product_category = t.product_category
GROUP BY p.product_category
ORDER BY SUM(t.total_amount) ASC;

--- sales per gender
SELECT c.gender, SUM(t.total_amount) AS Sales
FROM customers c
JOIN transactions t ON t.customer_id = c.customer_id
GROUP BY c.gender
ORDER BY Sales DESC;

-- product that sold the most quantity 
SELECT p.product_category , SUM(t.quantity) AS total_quantity_sold 
FROM products p
JOIN transactions t ON p.product_category = t.product_category
GROUP BY p.product_category;

--- average price-per-unit for each product category 
SELECT product_category, AVG(price_per_unit) as Average_PricePerUnit
FROM products
GROUP BY product_category

-- product category with the highest price per unit 
SELECT product_category , price_per_unit 
FROM products
ORDER BY price_per_unit DESC;

--- Number of Customers 
SELECT COUNT(DISTINCT customer_id) AS No_of_Customers
FROM customers;

--- oldest and youngest customers 
SELECT MAX(age) oldest, MIN(age) youngest
FROM customers;

--- Number of customers per gender 
SELECT gender, COUNT(*) AS total_customers 
FROM Customers
GROUP BY gender;

-- total sales per month?
SELECT 
    MONTH(transaction_date) AS sales_month,
    SUM(total_amount) AS total_sales
FROM transactions
GROUP BY MONTH(transaction_date)
ORDER BY sales_month;

--- daily Sales (01 Jan '23 - 01 Jan '24)
SELECT transaction_date, SUM(total_amount) as Daily_Sales 
FROM transactions 
GROUP BY transaction_date
ORDER BY transaction_date;














