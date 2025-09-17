--Create Database
CREATE DATABASE OnlineBookstore;

--Creatre Tables
DROP TABLE IF EXISTS Books;
CREATE TABLE BOOKS(
   Book_id SERIAL primary key,
   Title varchar(100),
   Author varchar(100),
   Genre varchar(50),
   Published_Year int,
   Price numeric(10,2),
   Stock INT
);

DROP TABLE IF EXISTS Customers;
CREATE TABLE CUSTOMERS(
    Customer_id SERIAL primary key,
	name varchar(100),
	email varchar(100),
	phone varchar(15),
	city varchar(50),
	country varchar(150)
);

DROP TABLE IF EXISTS Orders;
CREATE TABLE Orders(
  Order_id SERIAL primary key,
  customer_id INT REFERENCES Customers(Customer_id),
  book_id  INT REFERENCES Books(book_id),
  order_date Date,
  Quantity INT,
  Total_Amount NUMERIC(10,2)
);

SELECT * FROM BOOKS;
SELECT * FROM CUTOMERS;
SELECT * FROM BOOKS;


--Retrive all books in the "fiction" genre
SELECT * FROM BOOKS
WHERE genre='Fiction';

--Find books published after the year 1950
select * from books
where published_year > 1950;

--List all  customers from canada
select  * from customers
where country = 'Canada';

--Show order placed in November 2023
select * from orders
where order_date between '2023-11-01' AND '2023-11-30';

--Retrieve the total stock of books available
SELECT SUM(STOCK) AS Total_Stock
FROM BOOKS;

--Find the details of the most expensive book:
SELECT * FROM Books 
ORDER BY Price DESC 
LIMIT 1;


--Show all customers who ordered more than 1 quantity of a book:
SELECT * FROM Orders 
WHERE quantity>1;



--Retrieve all orders where the total amount exceeds $20:
SELECT * FROM Orders 
WHERE total_amount>20;



--List all genres available in the Books table:
SELECT DISTINCT genre FROM Books;


--Find the book with the lowest stock:
SELECT * FROM Books 
ORDER BY stock 
LIMIT 1;


--Calculate the total revenue generated from all orders:
SELECT SUM(total_amount) As Revenue 
FROM Orders;
