# 📚 Online Bookstore SQL Project

This project showcases end-to-end SQL analysis performed on an **Online Bookstore Dataset** using **PostgreSQL**. It includes database design, data import, business insights, and advanced analytical queries commonly used in real-world data analysis.

---

## 📁 Project Structure

```
Online-Bookstore-SQL-Project/
│
├── README.md
├── sql/
│   └── online_bookstore_sql_analysis.sql
│
├── data/
│   ├── Books.csv
│   ├── Customers.csv
│   └── Orders.csv
│
└── screenshots/   (optional)
    ├── erd.png
    ├── table_preview.png
    └── query_results.png
```

---

## 🛠️ Technologies Used
- PostgreSQL 14+
- pgAdmin 4
- SQL (Joins, Aggregates, Window Functions, Subqueries)
- CSV Dataset
- GitHub

---

# 🏗️ Database Schema

### **Books Table**
| Column | Type |
|--------|------|
| Book_ID | SERIAL PRIMARY KEY |
| Title | VARCHAR(100) |
| Author | VARCHAR(100) |
| Genre | VARCHAR(50) |
| Published_Year | INT |
| Price | NUMERIC(10,2) |
| Stock | INT |

### **Customers Table**
| Column | Type |
|--------|------|
| Customer_ID | SERIAL PRIMARY KEY |
| Name | VARCHAR(100) |
| Email | VARCHAR(100) |
| Phone | VARCHAR(15) |
| City | VARCHAR(50) |
| Country | VARCHAR(150) |

### **Orders Table**
| Column | Type |
|--------|------|
| Order_ID | SERIAL PRIMARY KEY |
| Customer_ID | INT (FK → Customers) |
| Book_ID | INT (FK → Books) |
| Order_Date | DATE |
| Quantity | INT |
| Total_Amount | NUMERIC(10,2) |

---

# 📥 Importing CSV Data

```sql
COPY Books(Book_ID, Title, Author, Genre, Published_Year, Price, Stock)
FROM 'Books.csv' DELIMITER ',' CSV HEADER;

COPY Customers(Customer_ID, Name, Email, Phone, City, Country)
FROM 'Customers.csv' DELIMITER ',' CSV HEADER;

COPY Orders(Order_ID, Customer_ID, Book_ID, Order_Date, Quantity, Total_Amount)
FROM 'Orders.csv' DELIMITER ',' CSV HEADER;
```

---

# 📊 Business Queries

### ✅ 1) Retrieve all Fiction books
```sql
SELECT * FROM Books WHERE Genre = 'Fiction';
```

### ✅ 2) Books published after 1950
```sql
SELECT * FROM Books
WHERE Published_Year > 1950
ORDER BY Published_Year ASC;
```

### ✅ 3) Customers from Canada
```sql
SELECT * FROM Customers WHERE Country = 'Canada';
```

### ✅ 4) Orders placed in November 2023
```sql
SELECT * FROM Orders
WHERE Order_Date BETWEEN '2023-11-01' AND '2023-11-30'
ORDER BY Order_Date ASC;
```

### ✅ 5) Total stock available
```sql
SELECT SUM(Stock) AS total_stock_available FROM Books;
```

### ✅ 6) Most expensive book
```sql
SELECT * FROM Books ORDER BY Price DESC LIMIT 1;
```

### ✅ 7) Orders with quantity > 1
```sql
SELECT * FROM Orders WHERE Quantity > 1;
```

### ✅ 8) Orders where amount > $20
```sql
SELECT * FROM Orders WHERE Total_Amount > 20;
```

### ✅ 9) Unique genres
```sql
SELECT DISTINCT Genre FROM Books;
```

### ✅ 10) Book with the lowest stock
```sql
SELECT * FROM Books
WHERE Stock = (SELECT MIN(Stock) FROM Books);
```

### ✅ 11) Total revenue generated
```sql
SELECT SUM(Total_Amount) AS revenue_generated FROM Orders;
```

---

# 🔥 Advanced Analytical Queries

### ✅ 12) Total books sold per genre
```sql
SELECT b.Genre, SUM(o.Quantity) AS total_books_sold
FROM Orders o
JOIN Books b ON b.Book_ID = o.Book_ID
GROUP BY b.Genre
ORDER BY total_books_sold DESC;
```

### ✅ 13) Average price of Fantasy books
```sql
SELECT ROUND(AVG(Price), 2) AS avg_fantasy_price
FROM Books
WHERE Genre = 'Fantasy';
```

### ✅ 14) Customers with at least 2 orders
```sql
SELECT c.Name, o.Customer_ID, COUNT(o.Order_ID) AS order_count
FROM Orders o
JOIN Customers c ON c.Customer_ID = o.Customer_ID
GROUP BY o.Customer_ID, c.Name
HAVING COUNT(o.Order_ID) >= 2
ORDER BY order_count DESC;
```

### ✅ 15) Most frequently ordered books (handles ties)
```sql
SELECT o.Book_ID, b.Title, COUNT(o.Order_ID) AS order_count
FROM Orders o
JOIN Books b ON b.Book_ID = o.Book_ID
GROUP BY o.Book_ID, b.Title
HAVING COUNT(o.Order_ID) = (
    SELECT MAX(book_order_count)
    FROM (
        SELECT COUNT(Order_ID) AS book_order_count
        FROM Orders
        GROUP BY Book_ID
    ) AS counts
)
ORDER BY o.Book_ID ASC;
```

### ✅ 16) Top 3 most expensive Fantasy books
```sql
SELECT * FROM Books
WHERE Genre = 'Fantasy'
ORDER BY Price DESC
LIMIT 3;
```

### ✅ 17) Total quantity sold by each author
```sql
SELECT b.Author, COALESCE(SUM(o.Quantity), 0) AS total_sold_books
FROM Books b
LEFT JOIN Orders o ON b.Book_ID = o.Book_ID
GROUP BY b.Author
ORDER BY total_sold_books DESC;
```

### ✅ 18) Cities where customers spent over $30
```sql
SELECT c.City, SUM(o.Total_Amount) AS amount_spent
FROM Customers c
JOIN Orders o ON c.Customer_ID = o.Customer_ID
GROUP BY c.City
HAVING SUM(o.Total_Amount) > 30
ORDER BY amount_spent DESC;
```

### ✅ 19) Remaining stock after fulfilling orders
```sql
SELECT b.Book_ID, b.Title, b.Stock,
       COALESCE(SUM(o.Quantity), 0) AS order_quantity,
       b.Stock - COALESCE(SUM(o.Quantity), 0) AS remaining_stock
FROM Books b
LEFT JOIN Orders o ON b.Book_ID = o.Book_ID
GROUP BY b.Book_ID, b.Title, b.Stock
ORDER BY b.Book_ID ASC;
```

---

# 🧠 Insights Generated
- Best-selling genres
- Total revenue and sales trends
- Most frequently ordered books
- Customer spending behavior
- Author-wise sales performance
- Stock remaining / stock shortages
- High-value customer cities

These insights demonstrate strong SQL analysis capability using real-world business logic.

---

# 🏁 Conclusion
This Online Bookstore SQL Project demonstrates:
- Strong SQL querying skills
- Database schema design proficiency
- Ability to analyze real datasets
- Joins, subqueries, window functions
- Business intelligence–style insights
- Portfolio-ready SQL analysis

Perfect for Data Analyst, SQL Analyst, BI Analyst, and Data Science portfolios.

---

# 📬 Contact
**Zaman**  
**Aspiring Data Analyst**  
**BS Data Science – University of Central Punjab (UCP), Lahore**  
📧 **Email:** yourname@gmail.com  
🔗 **LinkedIn:** https://www.linkedin.com/in/your-profile

