"""
generate_data.py
Generates additional random sales data and exports to CSV.
Usage: python generate_data.py
"""

import csv
import random
from datetime import date, timedelta

CUSTOMERS = [
    ("Ravi Kumar",    "Consumer",    "Hyderabad",  "South"),
    ("Priya Sharma",  "Corporate",   "Mumbai",     "West"),
    ("Amit Patel",    "Consumer",    "Ahmedabad",  "West"),
    ("Sneha Reddy",   "Home Office", "Bangalore",  "South"),
    ("Vikram Singh",  "Corporate",   "Delhi",      "North"),
    ("Anita Joshi",   "Consumer",    "Pune",       "West"),
    ("Rahul Nair",    "Corporate",   "Chennai",    "South"),
    ("Deepika Rao",   "Consumer",    "Kolkata",    "East"),
    ("Suresh Menon",  "Home Office", "Kochi",      "South"),
    ("Kavya Iyer",    "Consumer",    "Hyderabad",  "South"),
]

PRODUCTS = [
    ("Laptop Pro 15",       "Electronics",     "Laptops",      55000, 40000),
    ("Wireless Mouse",      "Electronics",     "Accessories",   1200,   600),
    ("Office Chair Deluxe", "Furniture",       "Chairs",       12000,  7000),
    ("Standing Desk",       "Furniture",       "Desks",        25000, 15000),
    ("A4 Paper Ream",       "Office Supplies", "Paper",          350,   180),
    ("Whiteboard Markers",  "Office Supplies", "Stationery",     250,   100),
    ("USB-C Hub",           "Electronics",     "Accessories",   3500,  1800),
    ("Ergonomic Keyboard",  "Electronics",     "Accessories",   4500,  2500),
    ("Monitor 24 inch",     "Electronics",     "Monitors",     18000, 12000),
    ("Desk Lamp LED",       "Electronics",     "Lighting",      2200,  1100),
]

def random_date(start, end):
    delta = end - start
    return start + timedelta(days=random.randint(0, delta.days))

def generate(n=200, output="sales_data_extended.csv"):
    start = date(2023, 1, 1)
    end   = date(2024, 12, 31)
    rows  = []
    for i in range(1, n + 1):
        c    = random.choice(CUSTOMERS)
        p    = random.choice(PRODUCTS)
        qty  = random.randint(1, 5)
        disc = random.choice([0, 0.05, 0.10])
        rev  = round(p[3] * qty * (1 - disc), 2)
        prof = round((p[3] - p[4]) * qty * (1 - disc), 2)
        od   = random_date(start, end)
        sd   = od + timedelta(days=random.randint(2, 7))
        rows.append([i, od, sd, c[0], c[1], c[3], c[2],
                     p[0], p[1], p[2], qty, p[3], disc, rev, prof])

    headers = ["sale_id","order_date","ship_date","customer_name","segment",
               "region","city","product_name","category","sub_category",
               "quantity","unit_price","discount","revenue","profit"]

    with open(output, "w", newline="") as f:
        w = csv.writer(f)
        w.writerow(headers)
        w.writerows(rows)
    print(f"Generated {n} rows → {output}")

if __name__ == "__main__":
    generate(200)
