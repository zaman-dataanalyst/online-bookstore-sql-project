# 📚 **Bookstore Sales Analytics — SQL + Excel Dashboard**

Yeh project aik end-to-end **Data Analytics Case Study** hai jisme:

- **PostgreSQL** → Data analysis (joins + aggregations)  
- **DBeaver** → ERD + SQL execution  
- **Excel Dashboard** → KPI charts + visual insights  

Perfect addition for **Data Analyst / BI Analyst** portfolio.

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

# 🛠️ **Tools Used**

| Tool | Purpose |
|------|---------|
| **PostgreSQL** | SQL queries, joins, aggregations |
| **DBeaver** | ERD creation + SQL execution |
| **Excel** | Dashboard visualization |
| **CSV Files** | Raw dataset |

---

# 🧱 **Database Schema**

### 📘 **Books Table**
`Book_ID · Title · Author · Genre · Published_Year · Price · Stock`

### 👤 **Customers Table**
`Customer_ID · Name · Email · Phone · City · Country`

### 🛒 **Orders Table**
`Order_ID · Customer_ID (FK) · Book_ID (FK) · Order_Date · Quantity · Total_Amount`

📌 **ERD Screenshot:**  
`/screenshots/01_ERD.PNG`

---

# 📊 **Sample Raw Data Screenshots**

📌 `/screenshots/02_Books_sample.png`  
📌 `/screenshots/02_Customers_sample.png`  
📌 `/screenshots/02_Orders_sample.png`

Dataset contains **100+ synthetic records**.

---

# 📝 **Key SQL Queries (Dashboard Insights)**

## ⭐ **1) Total Revenue Generated**
```sql
SELECT SUM(Total_Amount) AS total_revenue
FROM Orders;
```

## ⭐ **2) Monthly Revenue Trend**
```sql
SELECT 
    DATE_TRUNC('month', Order_Date) AS month,
    SUM(Total_Amount) AS monthly_revenue
FROM Orders
GROUP BY month
ORDER BY month;
```

## ⭐ **3) Top 10 Best-Selling Books**
```sql
SELECT 
    b.Title AS book_title,
    SUM(o.Quantity) AS total_sold
FROM Orders o
JOIN Books b ON b.Book_ID = o.Book_ID
GROUP BY b.Title
ORDER BY total_sold DESC
LIMIT 10;
```

## ⭐ **4) Top 5 Customers by Spending**
```sql
SELECT 
    c.Name,
    SUM(o.Total_Amount) AS amount_spent
FROM Orders o
JOIN Customers c ON c.Customer_ID = o.Customer_ID
GROUP BY c.Name
ORDER BY amount_spent DESC
LIMIT 5;
```

📄 **Complete SQL Script:**  
`/online_bookstore_sql_analysis.sql`

---

# 📈 **Excel Dashboard Overview**

Includes:

- ✔ Total Revenue KPI  
- ✔ Monthly Revenue Trend (Line Chart)  
- ✔ Top Selling Books (Bar Chart)  
- ✔ Top Customers (Column Chart)

📸 **Dashboard Images:**  
`/screenshots/04_dashboard_full_view.png`  
`/screenshots/04_dashboard_kpi_total_revenue.PNG`  
`/screenshots/04_dashboard_monthly_revenue_chart.PNG`  
`/screenshots/04_dashboard_top_selling_books_chart.PNG`  
`/screenshots/04_dashboard_top_customers_chart.PNG`

---

# 🔍 **Key Insights**

### 📌 **Sales Insights**
- Total revenue calculation  
- Monthly sales trend & patterns  
- Best-selling books  

### 📌 **Customer Insights**
- Top spending customers  
- High-value cities  
- Repeat customer indicators  

### 📌 **Inventory Insights**
- Stock availability  
- Low-stock alerts  
- Authors driving highest sales  

---

# 🏁 **Conclusion**

This project demonstrates:

✔ SQL analysis  
✔ Business insights  
✔ Excel dashboard building  
✔ Clean dataset management  
✔ Professional documentation  

---

# 📄 **License**
MIT License — free to:

✔ Use  
✔ Modify  
✔ Distribute  
✔ Integrate  

`/LICENSE`

---

# 👤 **Author**

**Zaman**  
BS Data Science — UCP Lahore  
Aspiring Data Analyst  

📧 your_email@example.com  
🔗 LinkedIn: your_profile_link_here  

