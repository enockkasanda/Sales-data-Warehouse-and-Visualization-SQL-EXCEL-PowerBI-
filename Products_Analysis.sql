
SELECT * FROM products;

--- different categories
SELECT DISTINCT(product_category)
FROM products;

--- sales per category
SELECT p.product_category, SUM(t.total_amount) AS Sales_per_category
FROM transactions t
JOIN products p ON p.product_category = t.product_category
GROUP BY p.product_category
ORDER BY SUM(t.total_amount) ASC;

-- product that sold the most quantity
SELECT p.product_category , SUM(t.quantity) AS total_quantity_sold
FROM products p
JOIN transactions t ON p.product_category = t.product_category
GROUP BY p.product_category;

--- average price-per-unit for each product category
SELECT product_category, AVG(price_per_unit) as Average_PricePerUnit
FROM products
GROUP BY product_category;

-- product category with the highest price per unit
SELECT product_category , price_per_unit
FROM products
ORDER BY price_per_unit DESC;