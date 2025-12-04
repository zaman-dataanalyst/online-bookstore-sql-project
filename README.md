
# 📚 **Bookstore Sales Analytics — SQL + Excel Dashboard**

Yeh project aik end‑to‑end **Data Analytics Case Study** hai jisme:

- **PostgreSQL** → Data analysis  
- **DBeaver** → ERD + SQL execution  
- **Excel Dashboard** → KPI charts  

---

# 🗂️ **Project Structure (With Proper Links)**

### 📁 **Data Files**
- [Books.csv](data/Books.csv)  
- [Customers.csv](data/Customers.csv)  
- [Orders.csv](data/Orders.csv)

### 🖼️ **Screenshots**
- [ERD Diagram](screenshots/01_ERD.PNG)
- [Books Sample](screenshots/02_Books_sample.png)
- [Customers Sample](screenshots/02_Customers_sample.png)
- [Orders Sample](screenshots/02_Orders_sample.png)
- [SQL Output — Total Revenue](screenshots/03_sql_total_revenue_output.PNG)
- [SQL Output — Monthly Revenue](screenshots/03_sql_monthly_revenue_output.png)
- [SQL Output — Top Selling Books](screenshots/03_sql_top_selling_books_output.PNG)
- [SQL Output — Top Customers](screenshots/03_sql_top_customers_output.PNG)
- [Dashboard — Full View](screenshots/04_dashboard_full_view.png)
- [Dashboard KPI — Total Revenue](screenshots/04_dashboard_kpi_total_revenue.PNG)
- [Dashboard — Monthly Revenue Chart](screenshots/04_dashboard_monthly_revenue_chart.PNG)
- [Dashboard — Top Selling Books Chart](screenshots/04_dashboard_top_selling_books_chart.PNG)
- [Dashboard — Top Customers Chart](screenshots/04_dashboard_top_customers_chart.PNG)

### 📄 **Main Files**
- [Excel Dashboard File](SQL_Bookstore_Dashboard.xlsx)
- [Full SQL Script](online_bookstore_sql_analysis.sql)
- [License](LICENSE)

---

# 🛠️ **Tools Used**

| Tool | Purpose |
|------|---------|
| **PostgreSQL** | Data analysis |
| **DBeaver** | ERD + SQL |
| **Excel** | Dashboard |
| **CSV Files** | Raw Data |

---

# 🧱 **Database Schema**

### 📘 **Books Table**
`Book_ID · Title · Author · Genre · Published_Year · Price · Stock`

### 👤 **Customers Table**
`Customer_ID · Name · Email · Phone · City · Country`

### 🛒 **Orders Table**
`Order_ID · Customer_ID (FK) · Book_ID (FK) · Order_Date · Quantity · Total_Amount`

📌 **ERD:**  
[View ERD](screenshots/01_ERD.PNG)

---

# 📊 **Sample Raw Data Screenshots**

- [Books Sample](screenshots/02_Books_sample.png)  
- [Customers Sample](screenshots/02_Customers_sample.png)  
- [Orders Sample](screenshots/02_Orders_sample.png)

Dataset includes **100+ synthetic records**.

---

# 📝 **Key SQL Queries (Dashboard Insights)**

## ⭐ **1) Total Revenue Generated**
```sql
SELECT SUM(Total_Amount) AS total_revenue
FROM Orders;
```

## ⭐ **2) Monthly Revenue Trend**
```sql
SELECT DATE_TRUNC('month', Order_Date) AS month,
       SUM(Total_Amount) AS monthly_revenue
FROM Orders
GROUP BY month
ORDER BY month;
```

## ⭐ **3) Top 10 Best-Selling Books**
```sql
SELECT b.Title, SUM(o.Quantity) AS total_sold
FROM Orders o
JOIN Books b ON b.Book_ID = o.Book_ID
GROUP BY b.Title
ORDER BY total_sold DESC
LIMIT 10;
```

## ⭐ **4) Top 5 Customers by Spending**
```sql
SELECT c.Name, SUM(o.Total_Amount) AS amount_spent
FROM Orders o
JOIN Customers c ON c.Customer_ID = o.Customer_ID
GROUP BY c.Name
ORDER BY amount_spent DESC
LIMIT 5;
```

📄 **Complete SQL File:**  
[Download SQL Script](online_bookstore_sql_analysis.sql)

---

# 📈 **Excel Dashboard Overview**

- Total Revenue KPI  
- Monthly Revenue Trend  
- Top Selling Books  
- Top Customers  

📸 **Dashboard Screenshots:**
- [Full Dashboard View](screenshots/04_dashboard_full_view.png)
- [KPI — Total Revenue](screenshots/04_dashboard_kpi_total_revenue.PNG)
- [Monthly Revenue Chart](screenshots/04_dashboard_monthly_revenue_chart.PNG)
- [Top Selling Books Chart](screenshots/04_dashboard_top_selling_books_chart.PNG)
- [Top Customers Chart](screenshots/04_dashboard_top_customers_chart.PNG)

---

# 🔍 **Key Insights**

### 📌 **Sales Insights**
- Total revenue  
- Monthly performance  
- Best-selling books  

### 📌 **Customer Insights**
- Top spenders  
- High-value cities  
- Repeat customer indicators  

### 📌 **Inventory Insights**
- Remaining stock  
- Low-stock alerts  
- Top authors  

---

# 🏁 **Conclusion**

Yeh project demonstrate karta hai:

- SQL analysis  
- Business insights  
- Excel dashboarding  
- Dataset management  
- Professional documentation  

---

# 📄 **License**
MIT License — Free to use, modify, distribute.

---

# 👤 **Author**

**Zaman**  
BS Data Science — UCP Lahore  
Aspiring Data Analyst  
