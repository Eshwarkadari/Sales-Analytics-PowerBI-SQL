-- ============================================================
-- Views — Ready to Connect to Power BI
-- ============================================================

USE sales_analytics;

-- View 1: Full Sales Detail (main Power BI table)
CREATE OR REPLACE VIEW vw_sales_detail AS
SELECT
    s.sale_id,
    s.order_date,
    s.ship_date,
    DATEDIFF(s.ship_date, s.order_date)   AS days_to_ship,
    YEAR(s.order_date)                    AS year,
    MONTH(s.order_date)                   AS month,
    MONTHNAME(s.order_date)               AS month_name,
    QUARTER(s.order_date)                 AS quarter,
    c.customer_name,
    c.segment,
    c.city                                AS customer_city,
    c.state                               AS customer_state,
    c.region,
    p.product_name,
    p.category,
    p.sub_category,
    st.store_name,
    st.city                               AS store_city,
    s.quantity,
    s.unit_price,
    s.discount,
    s.revenue,
    s.profit,
    ROUND((s.profit / s.revenue) * 100, 2) AS profit_margin_pct
FROM sales s
JOIN customers c  ON s.customer_id = c.customer_id
JOIN products  p  ON s.product_id  = p.product_id
JOIN stores    st ON s.store_id    = st.store_id;

-- View 2: Monthly Summary
CREATE OR REPLACE VIEW vw_monthly_summary AS
SELECT
    YEAR(order_date)                      AS year,
    MONTH(order_date)                     AS month,
    MONTHNAME(order_date)                 AS month_name,
    COUNT(*)                              AS total_orders,
    ROUND(SUM(revenue), 2)                AS total_revenue,
    ROUND(SUM(profit),  2)                AS total_profit,
    ROUND(AVG(revenue), 2)                AS avg_order_value
FROM sales
GROUP BY YEAR(order_date), MONTH(order_date), MONTHNAME(order_date);

-- View 3: Product Performance
CREATE OR REPLACE VIEW vw_product_performance AS
SELECT
    p.product_id,
    p.product_name,
    p.category,
    p.sub_category,
    COUNT(s.sale_id)                      AS times_sold,
    SUM(s.quantity)                       AS units_sold,
    ROUND(SUM(s.revenue), 2)              AS total_revenue,
    ROUND(SUM(s.profit),  2)              AS total_profit,
    ROUND((SUM(s.profit)/SUM(s.revenue))*100, 2) AS margin_pct
FROM sales s
JOIN products p ON s.product_id = p.product_id
GROUP BY p.product_id, p.product_name, p.category, p.sub_category;

SELECT 'Views created successfully!' AS status;
