# Sales Data Warehouse and Analytics

A retail sales data warehouse and analytics project built using **Microsoft SQL Server, SQL, Excel, and Power BI**.

The project takes raw retail sales data and turns it into a structured database that can be used for analysis and reporting. The project covers data preparation, relational database design, dimensional modelling, SQL analysis, and Power BI visualisation.

---

## Project Overview

The main goal of this project was to build a small sales data warehouse and use it to analyse retail sales performance.

The project follows this process:

**Raw Data → Excel → SQL Server → Data Warehouse → SQL Analysis → Power BI Dashboard**

The analysis focuses on sales, customers, product categories, transaction activity, and sales trends over time.

---

## Dataset

The project uses a retail sales dataset containing **1,000+ sales transactions**.

The main fields in the original dataset are:

| Column | Description |
|---|---|
| Transaction ID | Unique identifier for each transaction |
| Date | Date on which the transaction took place |
| Customer ID | Identifier for the customer |
| Gender | Customer gender |
| Age | Customer age |
| Product Category | Category of the product purchased |
| Quantity | Number of units purchased |
| Price per Unit | Price of one unit |
| Total Amount | Total value of the transaction |

The dataset was first inspected and validated using Excel before being loaded into SQL Server.

---

## Technologies Used

| Technology | Purpose |
|---|---|
| **Microsoft SQL Server** | Database and data warehouse |
| **SQL** | Data transformation, joins, validation, and analysis |
| **Excel** | Initial data inspection and validation |
| **Power BI** | Dashboard and data visualisation |
| **GitHub** | Project documentation and version control |

---

## Database Structure

The project first uses a relational database containing three source tables:

```text
Customers
Products
Transactions
