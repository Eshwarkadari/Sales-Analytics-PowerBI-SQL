# Sales Analytics — SQL + Power BI 📊

An **end-to-end Sales Analytics project** that uses **SQL** to store, clean and analyse data, and **Power BI** to build interactive dashboards.

![SQL](https://img.shields.io/badge/SQL-4479A1?style=for-the-badge&logo=mysql&logoColor=white)
![Power BI](https://img.shields.io/badge/Power_BI-F2C811?style=for-the-badge&logo=powerbi&logoColor=black)
![Python](https://img.shields.io/badge/Python-3776AB?style=for-the-badge&logo=python&logoColor=white)

---

## 📌 Project Overview

This project simulates a **real-world retail sales scenario** with:
- 🏪 Multiple stores across cities
- 📦 Product categories and sub-categories
- 👥 Customer segments
- 📅 2 years of sales data (2023–2024)

---

## 🗂️ Project Structure

```
Sales-Analytics-PowerBI-SQL/
│
├── sql/
│   ├── 01_create_tables.sql       # Database schema
│   ├── 02_insert_data.sql         # Sample data (500+ rows)
│   ├── 03_basic_queries.sql       # Basic SELECT queries
│   ├── 04_sales_analysis.sql      # KPI queries
│   ├── 05_advanced_queries.sql    # Window functions, CTEs
│   └── 06_views.sql               # Power BI ready views
│
├── data/
│   └── sales_data.csv             # Export-ready CSV for Power BI
│
├── powerbi/
│   └── dashboard_guide.md         # Step-by-step Power BI setup
│
├── python/
│   └── generate_data.py           # Script to generate more sample data
│
└── README.md
```

---

## 🚀 Getting Started

### Step 1 — Set Up the Database

Use any SQL tool: **MySQL Workbench**, **pgAdmin**, **SQL Server**, or **DB Browser for SQLite**.

```sql
-- Run in order:
source sql/01_create_tables.sql
source sql/02_insert_data.sql
```

### Step 2 — Run Analysis Queries

```sql
source sql/04_sales_analysis.sql
```

### Step 3 — Connect Power BI

1. Open Power BI Desktop
2. Click **Get Data → MySQL / SQL Server / CSV**
3. Connect to your database OR import `data/sales_data.csv`
4. Follow `powerbi/dashboard_guide.md`

---

## 📊 Key KPIs Tracked

| KPI | SQL Query File |
|-----|---------------|
| Total Revenue | `04_sales_analysis.sql` |
| Monthly Sales Trend | `04_sales_analysis.sql` |
| Top 10 Products | `04_sales_analysis.sql` |
| Sales by Region | `04_sales_analysis.sql` |
| Customer Segments | `05_advanced_queries.sql` |
| Year-over-Year Growth | `05_advanced_queries.sql` |
| Profit Margin by Category | `05_advanced_queries.sql` |

---

## 📈 Power BI Dashboard Pages

1. **Executive Summary** — Total revenue, profit, orders at a glance
2. **Sales Trends** — Monthly and yearly line charts
3. **Product Performance** — Top products, category breakdown
4. **Regional Analysis** — Sales by city and store
5. **Customer Insights** — Segment analysis

---

## 🛠️ Tech Stack

| Tool | Purpose |
|------|---------|
| SQL (MySQL/SQLite) | Data storage and analysis |
| Power BI Desktop | Interactive dashboards |
| Python | Sample data generation |
| CSV | Data export / import |

---

## 👨‍💻 Author

**Kadari Eshwar** — [github.com/Eshwarkadari](https://github.com/Eshwarkadari)
