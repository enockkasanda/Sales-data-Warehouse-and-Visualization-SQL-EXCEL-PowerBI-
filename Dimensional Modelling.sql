--- Creating Dimension Product table for Warehouse
CREATE TABLE DimProductCategory (
    Product_Category_Key INT IDENTITY(1,1) PRIMARY KEY,
    Product_Category VARCHAR(100) NOT NULL);

-- populating the table using data from transactions table
    INSERT INTO DimProductCategory (Product_Category)
SELECT DISTINCT Product_Category
FROM transactions
WHERE Product_Category IS NOT NULL;

-- Creating Dimension Customer table for Warehouse
CREATE TABLE DimCustomer (
    Customer_Key INT IDENTITY(1,1) PRIMARY KEY,
    Customer_ID VARCHAR(20) NOT NULL,
    Gender VARCHAR(10),
    Age INT
);

--- populating Dimension Customer table --- 
INSERT INTO DimCustomer (
    Customer_ID,
    Gender,
    Age
)
SELECT
    customer_id,
    gender,
    age
FROM customers;

-- Verify
SELECT *
FROM DimCustomer;

-- Creating Dimension Date table for Warehouse
CREATE TABLE DimDate (
    Date_Key INT PRIMARY KEY,
    Full_Date DATE NOT NULL,
    Day INT,
    Month INT,
    Month_Name VARCHAR(20),
    Quarter INT,
    Year INT
);

-- Populating Dimension Date
INSERT INTO DimDate (
    Date_Key,
    Full_Date,
    Day,
    Month,
    Month_Name,
    Quarter,
    Year
)
SELECT DISTINCT
    CONVERT(INT, CONVERT(VARCHAR(8), transaction_date, 112)) AS Date_Key,
    transaction_date AS Full_Date,
    DAY(transaction_date) AS Day,
    MONTH(transaction_date) AS Month,
    DATENAME(MONTH, transaction_date) AS Month_Name,
    DATEPART(QUARTER, transaction_date) AS Quarter,
    YEAR(transaction_date) AS Year
FROM transactions
WHERE transaction_date IS NOT NULL;

--- verifying 
SELECT *
FROM DimDate
ORDER BY Full_Date;

-- Creating Fact Sales table for Warehouse
CREATE TABLE FactSales (
    Sales_Key INT IDENTITY(1,1) PRIMARY KEY,
    Transaction_ID VARCHAR(20) NOT NULL,
    Date_Key INT NOT NULL,
    Customer_Key INT NOT NULL,
    Product_Category_Key INT NOT NULL,
    Quantity INT,
    Price_Per_Unit DECIMAL(10,2),
    Total_Amount DECIMAL(10,2),

    FOREIGN KEY (Date_Key)
        REFERENCES DimDate(Date_Key),

    FOREIGN KEY (Customer_Key)
        REFERENCES DimCustomer(Customer_Key),

    FOREIGN KEY (Product_Category_Key)
        REFERENCES DimProductCategory(Product_Category_Key)
);

--- populating the FactSales Table

INSERT INTO FactSales (
    Transaction_ID,
    Date_Key,
    Customer_Key,
    Product_Category_Key,
    Quantity,
    Price_Per_Unit,
    Total_Amount
)
SELECT
    t.transaction_id,
    d.Date_Key,
    c.Customer_Key,
    p.Product_Category_Key,
    t.quantity,
    pr.price_per_unit,
    t.total_amount
FROM transactions t

JOIN DimDate d
    ON t.transaction_date = d.Full_Date

JOIN DimCustomer c
    ON t.customer_id = c.Customer_ID

JOIN DimProductCategory p
    ON t.product_category = p.Product_Category

JOIN products pr
    ON t.product_category = pr.product_category;

--- checking the fact table
SELECT * FROM FactSales;

--- Verifying the entire star schema
SELECT
    f.Transaction_ID,
    d.Full_Date,
    c.Customer_ID,
    c.Gender,
    c.Age,
    p.Product_Category,
    f.Quantity,
    f.Price_Per_Unit,
    f.Total_Amount
FROM FactSales f
JOIN DimDate d
    ON f.Date_Key = d.Date_Key
JOIN DimCustomer c
    ON f.Customer_Key = c.Customer_Key
JOIN DimProductCategory p
    ON f.Product_Category_Key = p.Product_Category_Key
ORDER BY d.Full_Date;

-- comparison of transaction counts (original vs warehouse)
SELECT COUNT(*) AS Original_Transactions
FROM transactions;

SELECT COUNT(*) AS Warehouse_Sales
FROM FactSales;

-- comparison of total revenue
SELECT
    SUM(total_amount) AS Original_Revenue
FROM transactions;

SELECT
    SUM(Total_Amount) AS Warehouse_Revenue
FROM FactSales;

-- comparison of total quantity 
SELECT
    SUM(quantity) AS Original_Quantity
FROM transactions;

SELECT
    SUM(Quantity) AS Warehouse_Quantity
FROM FactSales;

-- Testing warehouse through dimensions
SELECT
    d.Year,
    d.Month_Name,
    p.Product_Category,
    SUM(f.Quantity) AS Units_Sold,
    SUM(f.Total_Amount) AS Revenue
FROM FactSales f
JOIN DimDate d
    ON f.Date_Key = d.Date_Key
JOIN DimProductCategory p
    ON f.Product_Category_Key = p.Product_Category_Key
GROUP BY
    d.Year,
    d.Month,
    d.Month_Name,
    p.Product_Category
ORDER BY
    d.Year,
    d.Month,
    Revenue DESC;