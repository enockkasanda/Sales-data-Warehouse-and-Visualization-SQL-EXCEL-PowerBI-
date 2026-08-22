# Sales Data Warehouse and Analytics

A retail sales data warehouse and analytics project built using Microsoft SQL Server, SQL, Excel, and Power BI.

The project takes raw retail sales data, structures it in SQL Server, develops a Star Schema data warehouse, performs SQL-based analysis, and presents the results through a Power BI dashboard.

The purpose of the project is to demonstrate practical skills in SQL, database design, data warehousing, data analysis, Excel, and business intelligence.

---

# Project Overview

The goal of this project was to take raw retail sales data and turn it into a structured analytical solution.

The project follows this process:

**Raw Sales Data → Excel → SQL Server → Data Warehouse → SQL Analysis → Power BI Dashboard**

The project covers:

- Data inspection and validation
- Relational database design
- SQL data analysis
- Data warehouse development
- Dimensional modelling
- Star Schema design
- Fact and dimension tables
- Business analysis
- Power BI visualisation

The final warehouse allows sales data to be analysed across customers, product categories, and time.

---

# Dataset

The project uses a retail sales dataset containing over 1,000 sales transactions.

The original dataset contains the following fields:

| Column | Description |
|---|---|
| Transaction ID | Unique identifier for each transaction |
| Date | Date of the transaction |
| Customer ID | Identifier for the customer |
| Gender | Customer gender |
| Age | Customer age |
| Product Category | Category of the product purchased |
| Quantity | Number of units purchased |
| Price per Unit | Price of one unit |
| Total Amount | Total value of the transaction |

Excel was used to initially inspect and validate the dataset before working with the data in SQL Server.

---

# Technologies Used

| Technology | Purpose |
|---|---|
| Microsoft SQL Server | Database and data warehouse |
| SQL | Database creation, transformation, joins, validation, and analysis |
| Excel | Initial data inspection and validation |
| Power BI | Data visualisation and dashboard development |
| GitHub | Version control and project documentation |

---

# Database Design

The project begins with a relational SQL Server database containing three source tables:

```text
Customers
Products
Transactions
```

## Customers

The `Customers` table stores customer information.

| Column | Description |
|---|---|
| Customer ID | Unique customer identifier |
| Gender | Customer gender |
| Age | Customer age |

## Products

The `Products` table stores product category and pricing information.

| Column | Description |
|---|---|
| Product Category | Product category |
| Price per Unit | Price of one unit |

## Transactions

The `Transactions` table stores the individual sales transactions.

| Column | Description |
|---|---|
| Transaction ID | Unique transaction identifier |
| Transaction Date | Date of the transaction |
| Customer ID | Customer identifier |
| Product Category | Product category |
| Quantity | Number of units purchased |
| Total Amount | Total transaction value |

Primary keys and foreign keys are used to maintain relationships between the source tables.

---

# Data Warehouse

The relational source data was transformed into a dimensional data warehouse using a **Star Schema**.

The completed warehouse consists of:

```text
DimCustomer
DimProductCategory
DimDate
FactSales
```

The `FactSales` table is the central fact table and connects the sales transactions to the dimension tables.

## Star Schema

```text
                    DimCustomer
                         |
                         |
                         v
                    FactSales
                   /                           /                            v             v
             DimDate    DimProductCategory
```

This structure allows sales measures to be analysed using customer, product category, and date information.

---

# Dimension Tables

## DimCustomer

`DimCustomer` contains descriptive information about customers.

| Column | Description |
|---|---|
| Customer_Key | Surrogate key generated for the warehouse |
| Customer_ID | Original customer identifier |
| Gender | Customer gender |
| Age | Customer age |

The `Customer_Key` is used to connect customer information to the `FactSales` table.

---

## DimProductCategory

`DimProductCategory` contains product category information.

| Column | Description |
|---|---|
| Product_Category_Key | Surrogate key generated for the warehouse |
| Product_Category | Product category |

The product category key is used to connect product category information to the `FactSales` table.

---

## DimDate

`DimDate` provides date attributes for time-based analysis.

| Column | Description |
|---|---|
| Date_Key | Unique warehouse key for the date |
| Full_Date | Full transaction date |
| Day | Day of the month |
| Month | Month number |
| Month_Name | Name of the month |
| Quarter | Quarter of the year |
| Year | Year |

The date dimension makes it easier to analyse sales by month, quarter, and year.

---

# Fact Table

## FactSales

`FactSales` is the central table in the Star Schema.

It contains the sales transactions and foreign keys connecting each transaction to the appropriate dimension records.

| Column | Description |
|---|---|
| Sales_Key | Unique warehouse key |
| Transaction_ID | Original transaction identifier |
| Date_Key | Foreign key to `DimDate` |
| Customer_Key | Foreign key to `DimCustomer` |
| Product_Category_Key | Foreign key to `DimProductCategory` |
| Quantity | Number of units sold |
| Price_Per_Unit | Price of one unit |
| Total_Amount | Total value of the transaction |

The fact table contains the main numerical values used for sales analysis.

---

# Data Processing and ETL

The project follows a simple ETL process.

## 1. Extract

The original retail sales dataset was collected and initially inspected using Excel.

The dataset was reviewed to understand its structure and identify the fields required for analysis.

## 2. Transform

SQL Server was used to create and structure the source database.

The transformation process included:

- Creating relational tables
- Defining primary keys
- Defining foreign key relationships
- Validating the source data
- Creating dimension tables
- Creating the fact table
- Generating surrogate keys
- Connecting fact records to dimension records
- Preparing the warehouse for analysis

## 3. Load

The prepared data was loaded into the dimensional warehouse.

The final warehouse contains:

```text
DimCustomer
DimProductCategory
DimDate
FactSales
```

The fact table uses foreign keys to connect sales transactions to the appropriate dimension records.

---

# SQL Analysis

SQL was used to analyse the sales data and answer business questions.

The analysis was divided into customer, product category, and transaction analysis.

## Customer Analysis

Customer analysis focuses on:

- Customer purchasing activity
- Customer contribution to revenue
- Customer demographics
- Sales by gender
- Sales across different age groups

## Product Category Analysis

Product category analysis focuses on:

- Revenue by product category
- Quantity sold by category
- Highest-performing categories
- Comparison between product categories

## Transaction Analysis

Transaction analysis focuses on:

- Total revenue
- Number of transactions
- Units sold
- Transaction values
- Sales trends over time

---

# Example SQL Analysis

The warehouse can be used to analyse revenue by product category:

```sql
SELECT
    p.Product_Category,
    SUM(f.Total_Amount) AS Total_Revenue
FROM FactSales f
JOIN DimProductCategory p
    ON f.Product_Category_Key = p.Product_Category_Key
GROUP BY
    p.Product_Category
ORDER BY
    Total_Revenue DESC;
```

This query uses the `FactSales` table and `DimProductCategory` dimension to identify the product categories generating the highest revenue.

---

# Power BI Dashboard

A Power BI dashboard was developed using the sales data to provide an interactive view of the results.

The dashboard presents key sales metrics and allows the data to be explored using different filters and visualisations.

## Key Metrics

The dashboard includes metrics such as:

- Total Revenue
- Total Transactions
- Units Sold
- Number of Customers
- Average Transaction Value

## Dashboard Features

The dashboard provides analysis of:

- Sales performance
- Sales trends over time
- Product category performance
- Customer activity
- Transaction activity
- Key sales KPIs
- Interactive filtering

---

# Business Questions

The project was designed to answer practical business questions.

## Sales Performance

- What is the total revenue?
- How many transactions were recorded?
- How many units were sold?
- How does sales performance change over time?

## Customer Analysis

- Which customers contribute the most to revenue?
- What purchasing patterns can be identified?
- How does purchasing behaviour differ across customer demographics?

## Product Category Analysis

- Which product categories generate the most revenue?
- Which categories have the highest sales volume?
- How do product categories compare in terms of performance?

---

# Project Outcomes

This project provided practical experience with:

- SQL Server
- SQL querying
- Relational database design
- Primary and foreign keys
- SQL joins
- Data validation
- Data cleaning
- Data warehousing
- Dimensional modelling
- Star Schema design
- Fact and dimension tables
- Surrogate keys
- Business analysis
- Excel
- Power BI
- Data visualisation

The project demonstrates the process of taking raw transactional data and turning it into a structured analytical solution.

---

# Project Structure

```text
Sales-data-Warehouse-and-Visualization-SQL-EXCEL-PowerBI/
│
├── README.md
│
├── SQL/
│   ├── DBcreationAndJoins.sql
│   ├── Customers_Analysis.sql
│   ├── Products_Analysis.sql
│   ├── Transaction_Analysis.sql
│   └── RandomVariousQueries.sql
│
├── PowerBI/
│   └── Sales Dashboard 1.pbix
│
├── Data/
│   └── retail_sales.csv
│
└── Screenshots/
    └── dashboard.png
```

---

# SQL Files

## DBcreationAndJoins.sql

Contains SQL used to:

- Create the `sales_dw` database
- Create the source tables
- Define primary keys
- Define foreign key relationships
- Test relationships using SQL joins
- Create the warehouse dimension tables
- Create the `FactSales` table
- Load data into the warehouse

## Customers_Analysis.sql

Contains SQL queries used to analyse customer-related sales information.

## Products_Analysis.sql

Contains SQL queries used to analyse product category performance.

## Transaction_Analysis.sql

Contains SQL queries used to analyse transactions and overall sales performance.

## RandomVariousQueries.sql

Contains additional SQL queries used for data exploration, testing, and analysis.

---

# Data Warehouse Workflow

The complete project workflow can be summarised as:

```text
                 Raw Retail Sales Data
                          |
                          v
                       Excel
                 Data Inspection
                          |
                          v
                    SQL Server
                          |
              +-----------+-----------+
              |           |           |
              v           v           v
          Customers    Products   Transactions
              |           |           |
              +-----------+-----------+
                          |
                          v
                  Data Warehouse
                          |
        +-----------------+-----------------+
        |                 |                 |
        v                 v                 v
  DimCustomer    DimProductCategory     DimDate
        \                 |                 /
         \                |                /
          +---------------+---------------+
                          |
                          v
                      FactSales
                          |
                          v
                    SQL Analysis
                          |
                          v
                     Power BI
                          |
                          v
                   Sales Dashboard
```

---

# Future Improvements

The current project focuses on building the database, warehouse, SQL analysis, and Power BI dashboard.

Possible future improvements include:

- Automating the ETL process
- Adding incremental data loading
- Developing more advanced customer segmentation
- Adding sales forecasting
- Using Python for statistical analysis
- Adding more advanced Power BI measures
- Automating Power BI data refreshes

These improvements are outside the current scope of the project.

---

# Conclusion

This project demonstrates how SQL Server, SQL, Excel, and Power BI can be used together to build a sales analytics solution.

Starting with raw retail sales data, the project creates a relational database, develops a Star Schema data warehouse, performs SQL analysis, and presents the results through a Power BI dashboard.

The project forms part of my Data Analytics portfolio and demonstrates practical skills in:

**SQL | Data Warehousing | Data Analysis | Excel | Power BI | Business Intelligence**

---

# Author

**Enock Kasanda**

Data Analytics Portfolio Project
