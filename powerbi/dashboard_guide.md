# Power BI Dashboard Setup Guide 📊

Step-by-step guide to build the Sales Analytics dashboard in Power BI Desktop.

---

## Step 1 — Import Data

### Option A: From CSV (easiest)
1. Open Power BI Desktop
2. Click **Home → Get Data → Text/CSV**
3. Select `data/sales_data.csv`
4. Click **Load**

### Option B: From SQL Database
1. Click **Home → Get Data → MySQL Database**
2. Server: `localhost`, Database: `sales_analytics`
3. Select the view `vw_sales_detail`
4. Click **Load**

---

## Step 2 — Create Measures (DAX)

Go to **Modeling → New Measure** and add these:

```dax
Total Revenue = SUM(sales_data[revenue])

Total Profit = SUM(sales_data[profit])

Total Orders = COUNTROWS(sales_data)

Profit Margin % = DIVIDE([Total Profit], [Total Revenue]) * 100

Avg Order Value = DIVIDE([Total Revenue], [Total Orders])

YoY Growth % =
VAR CurrentYear = CALCULATE([Total Revenue], YEAR(sales_data[order_date]) = 2024)
VAR PrevYear    = CALCULATE([Total Revenue], YEAR(sales_data[order_date]) = 2023)
RETURN DIVIDE(CurrentYear - PrevYear, PrevYear) * 100
```

---

## Step 3 — Build Dashboard Pages

### Page 1 — Executive Summary
| Visual | Fields |
|--------|--------|
| Card | Total Revenue |
| Card | Total Profit |
| Card | Total Orders |
| Card | Profit Margin % |
| Bar Chart | Revenue by Category |
| Donut Chart | Orders by Segment |

### Page 2 — Sales Trends
| Visual | Fields |
|--------|--------|
| Line Chart | Monthly Revenue (order_date vs revenue) |
| Clustered Bar | Quarterly Revenue by Year |
| Area Chart | Running Total Revenue |

### Page 3 — Product Performance
| Visual | Fields |
|--------|--------|
| Bar Chart | Top 10 Products by Revenue |
| Matrix | Category → Sub-Category → Revenue, Profit, Margin% |
| Treemap | Revenue by Category |

### Page 4 — Regional Analysis
| Visual | Fields |
|--------|--------|
| Map | Revenue by City (use city + region fields) |
| Bar Chart | Revenue by Region |
| Table | Store Name, City, Revenue, Profit |

### Page 5 — Customer Insights
| Visual | Fields |
|--------|--------|
| Pie Chart | Revenue by Segment |
| Bar Chart | Top Customers by Revenue |
| Scatter Plot | Revenue vs Profit by Customer |

---

## Step 4 — Add Slicers (Filters)

Add these slicers on every page:
- **Year** slicer (2023 / 2024)
- **Region** slicer (North/South/East/West)
- **Category** slicer (Electronics/Furniture/Office Supplies)

---

## Step 5 — Format & Theme

1. Click **View → Themes → Choose a theme** (try "Executive" or "Innovation")
2. Set consistent colors:
   - Electronics: Blue `#0078D4`
   - Furniture: Green `#107C10`
   - Office Supplies: Orange `#D83B01`
3. Add your name and date in the footer text box

---

## Final Dashboard Preview

```
┌─────────────────────────────────────────────────┐
│  SALES ANALYTICS DASHBOARD          2023-2024   │
├──────────┬──────────┬──────────┬────────────────┤
│ Revenue  │  Profit  │  Orders  │  Margin %      │
│ ₹6.8L   │ ₹2.1L   │    50    │   30.8%        │
├──────────┴──────────┴──────────┴────────────────┤
│  Monthly Trend (Line)  │  Revenue by Category   │
│  ~~~~~~~~~~~~~~~~~~~~  │  ████ Electronics 60%  │
│                        │  ███  Furniture   28%  │
│                        │  ██   Office Sup  12%  │
└────────────────────────┴────────────────────────┘
```

---

Built by **Kadari Eshwar** — [github.com/Eshwarkadari](https://github.com/Eshwarkadari)
