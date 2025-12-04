📚 Bookstore Sales Analytics — SQL + Excel Dashboard

This project is a complete end-to-end data analytics case study, combining
PostgreSQL (SQL Analysis) + Excel (Dashboard Visualization) to generate real business insights.

It demonstrates real-world skills required for Data Analyst / BI Analyst roles:

✔ Database design
✔ SQL data analysis
✔ Business intelligence insights
✔ Interactive Excel dashboard
✔ Professional documentation

📁 Project Structure
online-bookstore-sql-project/
│
├── data/
│   ├── Books.csv
│   ├── Customers.csv
│   └── Orders.csv
│
├── screenshots/
│   ├── 01_ERD.PNG
│   ├── 02_Books_sample.png
│   ├── 02_Customers_sample.png
│   ├── 02_Orders_sample.png
│   ├── 03_sql_total_revenue_output.PNG
│   ├── 03_sql_monthly_revenue_output.png
│   ├── 03_sql_top_selling_books_output.PNG
│   ├── 03_sql_top_customers_output.PNG
│   ├── 04_dashboard_full_view.png
│   ├── 04_dashboard_kpi_total_revenue.PNG
│   ├── 04_dashboard_monthly_revenue_chart.PNG
│   ├── 04_dashboard_top_selling_books_chart.PNG
│   └── 04_dashboard_top_customers_chart.PNG
│
├── SQL_Bookstore_Dashboard.xlsx
├── online_bookstore_sql_analysis.sql
└── LICENSE

🛠️ Tools Used
🔧 Tool	📌 Purpose
PostgreSQL	SQL queries, joins, aggregations
DBeaver	ERD design + SQL execution
Excel	Dashboard creation & visualization
CSV Files	Raw dataset
🧱 Database Schema
📘 Books Table

Book_ID · Title · Author · Genre · Published_Year · Price · Stock

👥 Customers Table

Customer_ID · Name · Email · Phone · City · Country

🛒 Orders Table

Order_ID · Customer_ID(FK) · Book_ID(FK) · Order_Date · Quantity · Total_Amount

📌 ERD Screenshot:
/screenshots/01_ERD.PNG

📊 Raw Dataset Samples

📌 02_Books_sample.png
📌 02_Customers_sample.png
📌 02_Orders_sample.png

Dataset contains 100+ synthetic book, customer & order records.

📝 Key SQL Queries (Used in Dashboard)

Below are the 4 core business queries powering the Excel dashboard.

⭐ 1) Total Revenue Generated
SELECT SUM(Total_Amount) AS total_revenue
FROM Orders;


🎯 Purpose: Calculate overall revenue (Dashboard KPI)

⭐ 2) Monthly Revenue Trend
SELECT 
    DATE_TRUNC('month', Order_Date) AS month,
    SUM(Total_Amount) AS monthly_revenue
FROM Orders
GROUP BY month
ORDER BY month;


🎯 Purpose: Analyze monthly performance (Line chart)

⭐ 3) Top 10 Best-Selling Books
SELECT 
    b.Title AS book_title,
    SUM(o.Quantity) AS total_sold
FROM Orders o
JOIN Books b ON b.Book_ID = o.Book_ID
GROUP BY b.Title
ORDER BY total_sold DESC
LIMIT 10;


🎯 Purpose: Identify high-demand products

⭐ 4) Top 5 Customers by Spending
SELECT 
    c.Name,
    SUM(o.Total_Amount) AS amount_spent
FROM Orders o
JOIN Customers c ON c.Customer_ID = o.Customer_ID
GROUP BY c.Name
ORDER BY amount_spent DESC
LIMIT 5;


🎯 Purpose: Identify high-value customers

📄 Full SQL Script:
/online_bookstore_sql_analysis.sql

📈 Excel Dashboard Overview

Contains four major visuals:

✔ Total Revenue KPI
✔ Monthly Revenue Trend
✔ Top Selling Books
✔ Top Customers

📸 Dashboard Screenshots:

/screenshots/04_dashboard_full_view.png

/screenshots/04_dashboard_kpi_total_revenue.PNG

/screenshots/04_dashboard_monthly_revenue_chart.PNG

/screenshots/04_dashboard_top_selling_books_chart.PNG

/screenshots/04_dashboard_top_customers_chart.PNG

🎨 Dashboard Design Features

✨ Clean BI-style layout
✨ Consistent theme & typography
✨ All extra rows/columns hidden (but fully editable)
✨ No VBA used — pure Excel
✨ All visuals driven by SQL-linked data

🔍 Key Insights Generated
📌 Sales Insights

Total revenue generated

Monthly revenue trend

Best-selling books & genres

📌 Customer Insights

Top spenders

High-value locations

Signals of repeat customers

📌 Inventory Insights

Remaining stock

Low-stock books

Authors generating highest sales

🧾 License

✔ MIT License (free to use, modify, share)
Full text: /LICENSE

👤 Author

Zaman
BS Data Science — UCP Lahore
Aspiring Data Analyst

📧 your_email@example.com

🔗 LinkedIn: your_profile_link_here