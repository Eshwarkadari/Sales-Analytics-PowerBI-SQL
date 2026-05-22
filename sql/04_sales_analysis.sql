-- ============================================================
-- Sales KPI Analysis Queries (Power BI Ready)
-- ============================================================

USE sales_analytics;

-- ── KPI 1: Total Revenue, Profit, Orders ──────────────────
SELECT
    COUNT(*)                          AS total_orders,
    ROUND(SUM(revenue), 2)            AS total_revenue,
    ROUND(SUM(profit),  2)            AS total_profit,
    ROUND(AVG(revenue), 2)            AS avg_order_value,
    ROUND((SUM(profit)/SUM(revenue))*100, 2) AS profit_margin_pct
FROM sales;

-- ── KPI 2: Monthly Sales Trend ────────────────────────────
SELECT
    DATE_FORMAT(order_date, '%Y-%m')  AS month,
    COUNT(*)                          AS orders,
    ROUND(SUM(revenue), 2)            AS monthly_revenue,
    ROUND(SUM(profit),  2)            AS monthly_profit
FROM sales
GROUP BY DATE_FORMAT(order_date, '%Y-%m')
ORDER BY month;

-- ── KPI 3: Sales by Category ──────────────────────────────
SELECT
    p.category,
    COUNT(s.sale_id)                  AS orders,
    ROUND(SUM(s.revenue), 2)          AS revenue,
    ROUND(SUM(s.profit),  2)          AS profit,
    ROUND((SUM(s.profit)/SUM(s.revenue))*100, 2) AS margin_pct
FROM sales s
JOIN products p ON s.product_id = p.product_id
GROUP BY p.category
ORDER BY revenue DESC;

-- ── KPI 4: Top 10 Products by Revenue ────────────────────
SELECT
    p.product_name,
    p.category,
    COUNT(s.sale_id)                  AS times_sold,
    ROUND(SUM(s.revenue), 2)          AS total_revenue,
    ROUND(SUM(s.profit),  2)          AS total_profit
FROM sales s
JOIN products p ON s.product_id = p.product_id
GROUP BY p.product_id, p.product_name, p.category
ORDER BY total_revenue DESC
LIMIT 10;

-- ── KPI 5: Sales by Region ────────────────────────────────
SELECT
    c.region,
    COUNT(s.sale_id)                  AS orders,
    ROUND(SUM(s.revenue), 2)          AS revenue,
    ROUND(SUM(s.profit),  2)          AS profit
FROM sales s
JOIN customers c ON s.customer_id = c.customer_id
GROUP BY c.region
ORDER BY revenue DESC;

-- ── KPI 6: Sales by Store ─────────────────────────────────
SELECT
    st.store_name,
    st.city,
    st.region,
    COUNT(s.sale_id)                  AS orders,
    ROUND(SUM(s.revenue), 2)          AS revenue,
    ROUND(SUM(s.profit),  2)          AS profit
FROM sales s
JOIN stores st ON s.store_id = st.store_id
GROUP BY st.store_id, st.store_name, st.city, st.region
ORDER BY revenue DESC;

-- ── KPI 7: Customer Segment Analysis ─────────────────────
SELECT
    c.segment,
    COUNT(DISTINCT c.customer_id)     AS customers,
    COUNT(s.sale_id)                  AS orders,
    ROUND(SUM(s.revenue), 2)          AS revenue
FROM sales s
JOIN customers c ON s.customer_id = c.customer_id
GROUP BY c.segment
ORDER BY revenue DESC;
