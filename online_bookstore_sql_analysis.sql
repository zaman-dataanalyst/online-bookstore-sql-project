/* ------------------------------------------------------------
   Project: Online Bookstore SQL Analysis
   Description: Dataset imported from CSV files. 
   This script creates tables, loads data, and answers
   business questions using SQL.
------------------------------------------------------------- */


/* ============================
      1. CREATE TABLES
=============================== */

DROP TABLE IF EXISTS Books;
CREATE TABLE Books (
    Book_ID SERIAL PRIMARY KEY,
    Title VARCHAR(100),
    Author VARCHAR(100),
    Genre VARCHAR(50),
    Published_Year INT,
    Price NUMERIC(10, 2),
    Stock INT
);

Select * FROM Customers;

DROP TABLE IF EXISTS Customers;
CREATE TABLE Customers (
    Customer_ID SERIAL PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(100),
    Phone VARCHAR(15),
    City VARCHAR(50),
    Country VARCHAR(150)
);

DROP TABLE IF EXISTS Orders;
CREATE TABLE Orders (
    Order_ID SERIAL PRIMARY KEY,
    Customer_ID INT REFERENCES Customers(Customer_ID),
    Book_ID INT REFERENCES Books(Book_ID),
    Order_Date DATE,
    Quantity INT,
    Total_Amount NUMERIC(10, 2)
);


/* ============================
      2. IMPORT DATA
=============================== */

COPY Books(Book_ID, Title, Author, Genre, Published_Year, Price, Stock)
FROM 'D:\OneDrive - Punjab Group of Colleges\Desktop\Books.csv'
DELIMITER ','
CSV HEADER;

COPY Customers (Customer_ID, Name, Email, Phone, City, Country)
FROM 'D:\OneDrive - Punjab Group of Colleges\Desktop\Customers.csv'
DELIMITER ','
CSV HEADER;

COPY Orders (Order_ID, Customer_ID, Book_ID, Order_Date, Quantity, Total_Amount)
FROM 'D:\OneDrive - Punjab Group of Colleges\Desktop\Orders.csv'
DELIMITER ','
CSV HEADER;




/* ============================
      3. BUSINESS QUERIES
=============================== */

-- 1) Retrieve all books in the Fiction genre
SELECT * 
FROM Books
WHERE Genre = 'Fiction';



-- 2) Find books published after 1950
SELECT *
FROM Books
WHERE Published_Year > 1950
ORDER BY Published_Year ASC;



-- 3) List all customers from Canada
SELECT *
FROM Customers
WHERE Country = 'Canada';



-- 4) Show orders placed in November 2023
SELECT *
FROM Orders
WHERE Order_Date BETWEEN '2023-11-01' AND '2023-11-30'
ORDER BY Order_Date ASC;



-- 5) Total stock of books available
SELECT SUM(Stock) AS total_stock_available
FROM Books;



-- 6) Most expensive book
SELECT *
FROM Books
ORDER BY Price DESC
LIMIT 1;



-- 7) Customers who ordered more than 1 quantity
SELECT *
FROM Orders
WHERE Quantity > 1;



-- 8) Orders where total amount exceeds $20
SELECT *
FROM Orders
WHERE Total_Amount > 20;



-- 9) List all unique genres
SELECT DISTINCT Genre
FROM Books;



-- 10) Book with lowest stock 
SELECT *
FROM Books
WHERE Stock = (SELECT MIN(Stock) FROM Books);



-- 11) Total revenue generated
SELECT SUM(Total_Amount) AS revenue_generated
FROM Orders;


-- 12) Monthly sales trend (total revenue per month)
SELECT 
    TO_CHAR(DATE_TRUNC('month', Order_Date),'YYYY-MM') AS month,
    SUM(Total_Amount) AS monthly_revenue
FROM Orders
GROUP BY month
ORDER BY month;



/* ==========================================
      ADVANCED ANALYSIS QUERIES
============================================ */


-- 1) Total number of books sold per genre
SELECT 
    b.Genre,
    SUM(o.Quantity) AS total_books_sold
FROM Orders o
JOIN Books b ON b.Book_ID = o.Book_ID
GROUP BY b.Genre
ORDER BY total_books_sold DESC;



-- 2) Average price of Fantasy books
SELECT ROUND(AVG(Price), 2) AS avg_fantasy_price
FROM Books
WHERE Genre = 'Fantasy';



-- 3) Customers who placed at least 2 orders
SELECT 
    c.Name,
    o.Customer_ID,
    COUNT(o.Order_ID) AS order_count
FROM Orders o
JOIN Customers c ON c.Customer_ID = o.Customer_ID
GROUP BY o.Customer_ID, c.Name
HAVING COUNT(o.Order_ID) >= 2
ORDER BY order_count DESC;



-- 4) Most frequently ordered books (handles ties)
SELECT 
    o.Book_ID,
    b.Title,
    COUNT(o.Order_ID) AS order_count
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



-- 5) Top 3 most expensive Fantasy books
SELECT *
FROM Books
WHERE Genre = 'Fantasy'
ORDER BY Price DESC
LIMIT 3;



-- 6) Total quantity of books sold by each author
SELECT 
    b.Author,
    COALESCE(SUM(o.Quantity), 0) AS total_sold_books
FROM Books b
LEFT JOIN Orders o ON b.Book_ID = o.Book_ID
GROUP BY b.Author
ORDER BY total_sold_books DESC;



-- 7) Cities where customers spent more than $30
SELECT 
    c.City,
    SUM(o.Total_Amount) AS amount_spent
FROM Customers c
JOIN Orders o ON c.Customer_ID = o.Customer_ID
GROUP BY c.City
HAVING SUM(o.Total_Amount) > 30
ORDER BY amount_spent DESC;



-- 8) Customer who spent the most
SELECT 
    c.Customer_ID,
    c.Name,
    SUM(o.Total_Amount) AS amount_spent
FROM Customers c
JOIN Orders o ON c.Customer_ID = o.Customer_ID
GROUP BY c.Customer_ID, c.Name
ORDER BY amount_spent DESC
LIMIT 1;


-- 8B) Top 5 High-Value Customers (by Total Amount Spent)
SELECT 
    c.Name,
    SUM(o.Total_Amount) AS amount_spent
FROM Customers c
JOIN Orders o ON c.Customer_ID = o.Customer_ID
GROUP BY c.Customer_ID, c.Name
ORDER BY amount_spent DESC
LIMIT 5;



-- 9) Remaining stock after fulfilling all orders
SELECT 
    b.Book_ID,
    b.Title,
    b.Stock,
    COALESCE(SUM(o.Quantity), 0) AS order_quantity,
    b.Stock - COALESCE(SUM(o.Quantity), 0) AS remaining_stock
FROM Books b
LEFT JOIN Orders o ON b.Book_ID = o.Book_ID
GROUP BY b.Book_ID, b.Title, b.Stock
ORDER BY b.Book_ID ASC;



-- 10) Top 10 best-selling books (by total quantity sold)

SELECT 
    b.Title AS book_title,
    SUM(o.Quantity) AS total_sold
FROM Orders o
JOIN Books b ON b.Book_ID = o.Book_ID
GROUP BY b.Title
ORDER BY total_sold DESC
LIMIT 10;

