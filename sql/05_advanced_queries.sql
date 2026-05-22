-- ============================================================
-- Advanced SQL — Window Functions, CTEs, YoY Growth
-- ============================================================

USE sales_analytics;

-- ── 1. Year-over-Year Revenue Growth ─────────────────────
SELECT
    YEAR(order_date)                  AS year,
    ROUND(SUM(revenue), 2)            AS revenue,
    ROUND(SUM(profit),  2)            AS profit,
    LAG(ROUND(SUM(revenue),2)) OVER (ORDER BY YEAR(order_date)) AS prev_year_revenue,
    ROUND(
        (SUM(revenue) - LAG(SUM(revenue)) OVER (ORDER BY YEAR(order_date)))
        / LAG(SUM(revenue)) OVER (ORDER BY YEAR(order_date)) * 100
    , 2)                              AS yoy_growth_pct
FROM sales
GROUP BY YEAR(order_date);

-- ── 2. Running Total Revenue by Month ─────────────────────
SELECT
    DATE_FORMAT(order_date, '%Y-%m')  AS month,
    ROUND(SUM(revenue), 2)            AS monthly_revenue,
    ROUND(SUM(SUM(revenue)) OVER (
        ORDER BY DATE_FORMAT(order_date, '%Y-%m')
    ), 2)                             AS running_total
FROM sales
GROUP BY DATE_FORMAT(order_date, '%Y-%m')
ORDER BY month;

-- ── 3. Top Customer per Region (CTE) ──────────────────────
WITH customer_revenue AS (
    SELECT
        c.region,
        c.customer_name,
        ROUND(SUM(s.revenue), 2) AS total_revenue,
        RANK() OVER (PARTITION BY c.region ORDER BY SUM(s.revenue) DESC) AS rnk
    FROM sales s
    JOIN customers c ON s.customer_id = c.customer_id
    GROUP BY c.region, c.customer_id, c.customer_name
)
SELECT region, customer_name, total_revenue
FROM customer_revenue
WHERE rnk = 1;

-- ── 4. Profit Margin by Sub-Category ─────────────────────
SELECT
    p.category,
    p.sub_category,
    ROUND(SUM(s.revenue), 2)          AS revenue,
    ROUND(SUM(s.profit),  2)          AS profit,
    ROUND((SUM(s.profit)/SUM(s.revenue))*100, 2) AS margin_pct
FROM sales s
JOIN products p ON s.product_id = p.product_id
GROUP BY p.category, p.sub_category
ORDER BY margin_pct DESC;

-- ── 5. Monthly Rank of Products by Sales ─────────────────
SELECT
    DATE_FORMAT(s.order_date, '%Y-%m') AS month,
    p.product_name,
    ROUND(SUM(s.revenue), 2)           AS revenue,
    RANK() OVER (
        PARTITION BY DATE_FORMAT(s.order_date, '%Y-%m')
        ORDER BY SUM(s.revenue) DESC
    )                                  AS monthly_rank
FROM sales s
JOIN products p ON s.product_id = p.product_id
GROUP BY DATE_FORMAT(s.order_date, '%Y-%m'), p.product_id, p.product_name
ORDER BY month, monthly_rank
LIMIT 30;
