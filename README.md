**📚 Bookstore Sales Analytics — SQL + Excel Dashboard**

This project is an end-to-end data analytics case study, combining:

PostgreSQL for data analysis

DBeaver for ERD + SQL execution

Excel for dashboard visualization

A perfect project for Data Analyst / BI Analyst portfolios, demonstrating real-world business analysis skills.


**🗂️ Project Structure**

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


**🛠️ Tools Used**

Tool	Purpose
PostgreSQL	SQL queries, joins, aggregations
DBeaver	ERD + SQL execution
Excel	Analytical dashboard
CSV Files	Raw dataset


**🧱 Database Schema**

Books Table

Book_ID · Title · Author · Genre · Published_Year · Price · Stock

Customers Table

Customer_ID · Name · Email · Phone · City · Country

Orders Table

Order_ID · Customer_ID(FK) · Book_ID(FK) · Order_Date · Quantity · Total_Amount


**📌 See the ERD:**

/screenshots/01_ERD.PNG


**📊 Sample Raw Data**

📌 /screenshots/02_Books_sample.png
📌 /screenshots/02_Customers_sample.png
📌 /screenshots/02_Orders_sample.png

Dataset includes 100+ synthetic records for realistic business analysis.


**📝 Key SQL Queries (Used for Dashboard Insights)**

These 4 business-driven queries power the Excel dashboard.

⭐ 1) Total Revenue Generated
SELECT SUM(Total_Amount) AS total_revenue
FROM Orders;

🎯 Purpose: Overall revenue KPI for dashboard.


⭐ 2) Monthly Revenue Trend
SELECT 
    DATE_TRUNC('month', Order_Date) AS month,
    SUM(Total_Amount) AS monthly_revenue
FROM Orders
GROUP BY month
ORDER BY month;

🎯 Purpose: Understand monthly performance & sales seasonality.


⭐ 3) Top 10 Best-Selling Books
SELECT 
    b.Title AS book_title,
    SUM(o.Quantity) AS total_sold
FROM Orders o
JOIN Books b ON b.Book_ID = o.Book_ID
GROUP BY b.Title
ORDER BY total_sold DESC
LIMIT 10;

🎯 Purpose: Identify high-demand products.


⭐ 4) Top 5 Customers by Spending
SELECT 
    c.Name,
    SUM(o.Total_Amount) AS amount_spent
FROM Orders o
JOIN Customers c ON c.Customer_ID = o.Customer_ID
GROUP BY c.Name
ORDER BY amount_spent DESC
LIMIT 5;

🎯 Purpose: Highlight most valuable customers.


📄 Full SQL Script:

All basic + business + analytical queries included:
/online_bookstore_sql_analysis.sql


📈 Excel Dashboard Overview

The Excel dashboard includes:

✔ Total Revenue KPI
✔ Monthly Revenue Trend (Line Chart)
✔ Top Selling Books (Horizontal Bar Chart)
✔ Top Customers (Vertical Bar Chart)


**📌 Dashboard Screenshot Highlights:**

/screenshots/04_dashboard_full_view.png

/screenshots/04_dashboard_kpi_total_revenue.PNG

/screenshots/04_dashboard_monthly_revenue_chart.PNG

/screenshots/04_dashboard_top_selling_books_chart.PNG

/screenshots/04_dashboard_top_customers_chart.PNG

🎨 Design Features

Clean BI-style layout

Consistent theme & typography

Unused rows/columns hidden (but dashboard remains fully editable)

Data linked via cell references (no VBA used)


**🔍 Key Insights Generated**

📌 Sales Insights

Total revenue generated

Monthly sales fluctuations and trend patterns

Best-selling books & strongest genres

📌 Customer Insights

Top spenders driving most revenue

High-value cities

Early indicators of repeat customers

📌 Inventory Insights

Remaining stock by title

Low-stock products identified

Authors contributing most to sales


**🏁 Conclusion**

This project demonstrates:

✔ Real-world SQL analysis
✔ Business-focused insights
✔ Excel dashboard creation
✔ Clean dataset management
✔ Professional documentation

A strong project for Data Analyst, BI Analyst, SQL Analyst portfolios.


**📄 License**

This project uses the MIT License, allowing anyone to:

✔ Use
✔ Modify
✔ Distribute
✔ Integrate

See full text:
/LICENSE


**👤 Author**

Zaman
BS Data Science Student — UCP Lahore
Aspiring Data Analyst

📧 your_email@example.com

🔗 LinkedIn: your_profile_link_here
