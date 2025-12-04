# 📚 **Bookstore Sales Analytics — SQL + Excel Dashboard**

Yeh project aik end-to-end **Data Analytics Case Study** hai jisme:

- **PostgreSQL** → SQL analysis & business queries  
- **DBeaver** → ERD + SQL execution  
- **Excel** → Dashboard visualization  

Is README ko **professional mix-style** me design kiya gaya hai:  
➡️ Key visuals embed  
➡️ Saari files & screenshots clickable links  
Taake project **clean + professional + recruiter-friendly** rahe.

---

# 🧱 **Database ERD (Main Visual)**

![ERD](screenshots/01_ERD.PNG)

---

# 📈 **Dashboard — Full View**

![Dashboard](screenshots/04_dashboard_full_view.png)

---

# ⭐ **Key KPI Chart**

![KPI](screenshots/04_dashboard_kpi_total_revenue.PNG)

---

# 🗂️ **Project Structure**

```
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
```

---

# 📁 **Data Files**

- [Books.csv](data/Books.csv)  
- [Customers.csv](data/Customers.csv)  
- [Orders.csv](data/Orders.csv)

---

# 📄 **Main Files**

- [Excel Dashboard File](SQL_Bookstore_Dashboard.xlsx)  
- [Full SQL Script](online_bookstore_sql_analysis.sql)  
- [MIT License](LICENSE)

---

# 🖼 **Additional Screenshots**

- [Books Sample](screenshots/02_Books_sample.png)  
- [Customers Sample](screenshots/02_Customers_sample.png)  
- [Orders Sample](screenshots/02_Orders_sample.png)  
- [SQL Output — Total Revenue](screenshots/03_sql_total_revenue_output.PNG)  
- [SQL Output — Monthly Revenue](screenshots/03_sql_monthly_revenue_output.png)  
- [SQL Output — Top Selling Books](screenshots/03_sql_top_selling_books_output.PNG)  
- [SQL Output — Top Customers](screenshots/03_sql_top_customers_output.PNG)  
- [Dashboard — Monthly Revenue Chart](screenshots/04_dashboard_monthly_revenue_chart.PNG)  
- [Dashboard — Top Selling Books Chart](screenshots/04_dashboard_top_selling_books_chart.PNG)  
- [Dashboard — Top Customers Chart](screenshots/04_dashboard_top_customers_chart.PNG)

---

# 🛠️ **Tools Used**

| Tool | Purpose |
|------|---------|
| **PostgreSQL** | Business queries, joins, aggregations |
| **DBeaver** | ERD + SQL execution |
| **Excel** | Dashboard visualization |
| **CSV Files** | Raw dataset |

---

# 🧱 **Database Schema**

### 📘 **Books Table**
`Book_ID · Title · Author · Genre · Published_Year · Price · Stock`

### 👤 **Customers Table**
`Customer_ID · Name · Email · Phone · City · Country`

### 🛒 **Orders Table**
`Order_ID · Customer_ID(FK) · Book_ID(FK) · Order_Date · Quantity · Total_Amount`

---

# 📝 **Key SQL Queries**

### ⭐ Total Revenue
```sql
SELECT SUM(Total_Amount) AS total_revenue FROM Orders;
```

### ⭐ Monthly Revenue Trend
```sql
SELECT DATE_TRUNC('month', Order_Date) AS month,
       SUM(Total_Amount) AS monthly_revenue
FROM Orders
GROUP BY month
ORDER BY month;
```

### ⭐ Top 10 Best-Selling Books
```sql
SELECT b.Title, SUM(o.Quantity) AS total_sold
FROM Orders o
JOIN Books b ON b.Book_ID = o.Book_ID
GROUP BY b.Title
ORDER BY total_sold DESC
LIMIT 10;
```

### ⭐ Top 5 Customers
```sql
SELECT c.Name, SUM(o.Total_Amount) AS amount_spent
FROM Orders o
JOIN Customers c ON c.Customer_ID = o.Customer_ID
GROUP BY c.Name
ORDER BY amount_spent DESC
LIMIT 5;
```

---

# 🔍 **Insights Generated**

### 📌 Sales Insights  
- Total revenue  
- Monthly sales trends  
- Best-selling books  

### 📌 Customer Insights  
- Top spenders  
- High-value cities  
- Early repeat customer signals  

### 📌 Inventory Insights  
- Stock availability  
- Low-stock alerts  
- Authors contributing most to sales  

---

# 📄 **License (MIT)**

Yeh project **MIT License** ke under licensed hai.  
Iska matlab hai ke aap is project ko **use, modify, distribute** kar sakte hain — bas copyright notice maintain rehna chahiye.

Full license text:  
➡️ [LICENSE](LICENSE)

---

# 📬 **Contact**

**Zaman**  
**Aspiring Data Analyst**  
**BS Data Science – University of Central Punjab (UCP), Lahore**  
📧 **Email:** zamanyaseen.71@gmail.com  
🔗 **LinkedIn:** https://www.linkedin.com/in/hafiz-zaman-yaseen-85057b36b  
