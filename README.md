# Sales-data-Warehouse-and-Visualization-SQL-EXCEL-PowerBI-
# 📊 Sales Data Warehouse & Analytics System

A complete **Sales Data Warehouse and Business Intelligence project** built to transform raw retail sales data into structured, reliable, and actionable business insights.

The project demonstrates practical skills in **SQL Server, Data Warehousing, Data Cleaning, ETL, Data Analysis, Excel, and Power BI**.

---

## 🎯 Project Overview

The objective of this project was to build an analytical solution that takes raw retail sales data and transforms it into meaningful business intelligence.

The project follows a simplified data analytics pipeline:

**Raw Data → Data Cleaning → SQL Data Warehouse → Data Analysis → Power BI Dashboard → Business Insights**

The final solution allows users to analyze sales performance across products, customers, locations, and time.

---

## 🛠️ Technologies Used

| Technology               | Purpose                                 |
| ------------------------ | --------------------------------------- |
| **Microsoft SQL Server** | Database & Data Warehouse               |
| **SQL**                  | Data transformation and analysis        |
| **Excel**                | Initial data inspection and validation  |
| **Power BI**             | Data visualization & dashboard          |
| **GitHub**               | Version control & project documentation |

---

## 🏗️ Data Warehouse Architecture

The project uses a structured analytical database designed around a **Star Schema**.

### Fact Table

**FactSales**

Contains measurable business transactions such as:

* Sales quantity
* Unit price
* Total sales
* Transaction date
* Product
* Customer
* Store/location

### Dimension Tables

**DimProduct**

* Product ID
* Product Name
* Category
* Price

**DimCustomer**

* Customer ID
* Customer Name
* Customer demographics

**DimDate**

* Date
* Day
* Month
* Quarter
* Year

**DimLocation**

* Location ID
* Store/Region
* City/Area

---

## 🔄 ETL Process

### 1. Extract

Raw retail sales data was collected and loaded into the SQL Server environment.

### 2. Transform

SQL was used to:

* Identify missing values
* Remove duplicate records
* Standardize data types
* Clean inconsistent values
* Validate relationships
* Create calculated fields
* Prepare data for analytical queries

### 3. Load

The transformed data was loaded into the warehouse using a structured dimensional model.

---

## 📈 Analysis Performed

The project explores several business questions, including:

### Sales Performance

* What is the total revenue?
* What are the highest-performing products?
* Which categories generate the most revenue?
* How does revenue change over time?

### Customer Analysis

* Which customers generate the most revenue?
* What purchasing patterns can be identified?
* Which customer segments contribute most to sales?

### Product Analysis

* Which products sell the most units?
* Which products generate the highest revenue?
* Which categories are underperforming?

### Geographic Analysis

* Which locations generate the highest sales?
* How does sales performance differ between regions?

---

## 📊 Power BI Dashboard

The Power BI dashboard provides an interactive overview of the sales data.

### Key KPIs

* 💰 Total Revenue
* 🛒 Total Orders
* 📦 Units Sold
* 👥 Customers
* 📈 Average Order Value

### Dashboard Features

* Sales trend analysis
* Product performance
* Category performance
* Customer analysis
* Geographic analysis
* Interactive filtering
* KPI cards
* Drill-down analysis

---

## 🧠 Key Business Insights

The analysis was used to identify:

* Top-performing products and categories
* Revenue trends over time
* High-value customers
* Strong and weak-performing locations
* Sales patterns that could support business decision-making

The project demonstrates how raw transactional data can be transformed into **decision-ready business intelligence**.

---

## 📂 Project Structure

```text
Sales-Data-Warehouse/
│
├── README.md
│
├── data/
│   └── retail_sales.csv
│
├── sql/
│   ├── database_creation.sql
│   ├── table_creation.sql
│   ├── data_cleaning.sql
│   ├── etl.sql
│   └── analysis_queries.sql
│
├── powerbi/
│   └── sales_dashboard.pbix
│
├── excel/
│   └── data_validation.xlsx
│
└── screenshots/
    └── dashboard.png
```

---

## 🔍 Example SQL Analysis

```sql
SELECT
    ProductCategory,
    SUM(TotalSales) AS TotalRevenue
FROM FactSales
GROUP BY ProductCategory
ORDER BY TotalRevenue DESC;
```

This query identifies the highest-revenue product categories.

---

## 📌 Project Outcomes

Through this project, I demonstrated practical experience with:

* SQL querying
* Relational databases
* Data warehousing
* Star schema design
* ETL concepts
* Data cleaning
* Data validation
* Business analysis
* KPI development
* Power BI visualization
* Translating data into business insights

---

## 🚀 Future Improvements

Potential improvements include:

* Implementing automated ETL pipelines
* Adding incremental data loading
* Creating more advanced customer segmentation
* Adding forecasting models
* Integrating Python for statistical analysis
* Implementing scheduled Power BI refreshes
* Expanding the warehouse with additional business dimensions

---

## 👨‍💻 About the Project

This project was developed as part of my **Data Analytics portfolio** to demonstrate the practical application of SQL, data warehousing, business intelligence, and data visualization.

**Focus:** Data Analytics • SQL • Data Warehousing • Business Intelligence • Power BI

---

⭐ If you found this project useful, feel free to explore the repository and review the SQL scripts, data model, and dashboard.
