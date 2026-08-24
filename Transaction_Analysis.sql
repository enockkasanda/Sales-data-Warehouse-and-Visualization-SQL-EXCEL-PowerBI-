SELECT * FROM transactions;

--- tables join
SELECT *
FROM transactions t
JOIN customers c ON c.customer_id = t.customer_id
JOIN products p ON p.product_category = t.product_category;

--- total sales
SELECT SUM(total_amount) AS Revenue
FROM transactions;

--- average sales
SELECT AVG(total_amount) AS Average_Sale
FROM transactions;

--- maximum and minimum sale
SELECT MAX(total_amount) AS Maximum_Sale,
MIN(total_amount) AS Minimum_Sale
FROM transactions;

-- total sales per month
SELECT
MONTH(transaction_date) AS sales_month,
SUM(total_amount) AS total_sales
FROM transactions
GROUP BY MONTH(transaction_date)
ORDER BY sales_month;

--- daily Sales
SELECT transaction_date,
SUM(total_amount) as Daily_Sales
FROM transactions
GROUP BY transaction_date
ORDER BY transaction_date;