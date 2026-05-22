-- ============================================================
-- Sales Analytics Database Schema
-- Author: Kadari Eshwar
-- ============================================================

CREATE DATABASE IF NOT EXISTS sales_analytics;
USE sales_analytics;

-- Customers table
CREATE TABLE IF NOT EXISTS customers (
    customer_id   INT PRIMARY KEY AUTO_INCREMENT,
    customer_name VARCHAR(100) NOT NULL,
    segment       VARCHAR(50),   -- Consumer, Corporate, Home Office
    city          VARCHAR(100),
    state         VARCHAR(100),
    region        VARCHAR(50),   -- North, South, East, West
    email         VARCHAR(150),
    created_at    DATE
);

-- Products table
CREATE TABLE IF NOT EXISTS products (
    product_id    INT PRIMARY KEY AUTO_INCREMENT,
    product_name  VARCHAR(150) NOT NULL,
    category      VARCHAR(50),   -- Electronics, Furniture, Office Supplies
    sub_category  VARCHAR(50),
    unit_price    DECIMAL(10,2),
    unit_cost     DECIMAL(10,2)
);

-- Stores table
CREATE TABLE IF NOT EXISTS stores (
    store_id      INT PRIMARY KEY AUTO_INCREMENT,
    store_name    VARCHAR(100),
    city          VARCHAR(100),
    state         VARCHAR(100),
    region        VARCHAR(50),
    manager       VARCHAR(100),
    opened_date   DATE
);

-- Sales (Orders) table
CREATE TABLE IF NOT EXISTS sales (
    sale_id       INT PRIMARY KEY AUTO_INCREMENT,
    order_date    DATE NOT NULL,
    ship_date     DATE,
    customer_id   INT,
    product_id    INT,
    store_id      INT,
    quantity      INT DEFAULT 1,
    unit_price    DECIMAL(10,2),
    discount      DECIMAL(5,2) DEFAULT 0,
    revenue       DECIMAL(10,2),
    profit        DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (product_id)  REFERENCES products(product_id),
    FOREIGN KEY (store_id)    REFERENCES stores(store_id)
);

SELECT 'Tables created successfully!' AS status;
