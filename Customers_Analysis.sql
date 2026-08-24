SELECT * FROM customers;

-- average customer age
SELECT AVG(age) AS Average_Age
FROM customers;

-- Number of Customers
SELECT COUNT(DISTINCT customer_id) AS No_of_Customers
FROM customers;

-- oldest and youngest customers
SELECT MAX(age) oldest, MIN(age) youngest
FROM customers;

-- Number of customers per gender
SELECT gender, COUNT(*) AS total_customers
FROM Customers
GROUP BY gender;

-- sales per gender
SELECT c.gender, SUM(t.total_amount) AS Sales
FROM customers c
JOIN transactions t ON t.customer_id = c.customer_id
GROUP BY c.gender
ORDER BY Sales DESC;