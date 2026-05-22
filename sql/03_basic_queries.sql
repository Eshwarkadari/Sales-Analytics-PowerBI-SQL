-- ============================================================
-- Basic SQL Queries — Explore the Data
-- ============================================================

USE sales_analytics;

-- 1. View all customers
SELECT * FROM customers;

-- 2. View all products with category
SELECT product_id, product_name, category, sub_category, unit_price
FROM products
ORDER BY category, unit_price DESC;

-- 3. View all sales with customer and product names
SELECT
    s.sale_id,
    s.order_date,
    c.customer_name,
    c.city,
    p.product_name,
    p.category,
    s.quantity,
    s.revenue,
    s.profit
FROM sales s
JOIN customers c ON s.customer_id = c.customer_id
JOIN products  p ON s.product_id  = p.product_id
ORDER BY s.order_date DESC;

-- 4. Count total orders
SELECT COUNT(*) AS total_orders FROM sales;

-- 5. Total revenue and profit overall
SELECT
    ROUND(SUM(revenue), 2) AS total_revenue,
    ROUND(SUM(profit),  2) AS total_profit,
    ROUND((SUM(profit) / SUM(revenue)) * 100, 2) AS profit_margin_pct
FROM sales;
