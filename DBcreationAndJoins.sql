--- creating database 
CREATE DATABASE sales_dw;
GO
--- use database 
USE sales_dw
GO
--- verifying database
SELECT DB_NAME() AS Current_db;

--- creating tables 
CREATE TABLE customers (
    customer_id VARCHAR(20) PRIMARY KEY,
    gender VARCHAR(10),
    age INT
);

CREATE TABLE products (
    product_category VARCHAR(100) PRIMARY KEY,
    price_per_unit DECIMAL(10,2)
);

CREATE TABLE transactions (
    transaction_id VARCHAR(20) PRIMARY KEY,
    transaction_date DATE,
    customer_id VARCHAR(20),
    product_category VARCHAR(100),
    quantity INT,
    total_amount DECIMAL(10,2),

    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (product_category) REFERENCES products(product_category)
);

--- selecting tables 
SELECT * FROM customers; 
SELECT * FROM products; 
SELECT * FROM transactions; 

-- Testing relationships between transactions, customers, and products
SELECT * 
FROM transactions t 
JOIN customers c ON c.customer_id = t.customer_id
JOIN products p ON t.product_category = p.product_category;








