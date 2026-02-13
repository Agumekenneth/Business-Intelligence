-- AGUME KENNETH B30309 S24B38/017
CREATE DATABASE supermarket;
USE supermarket;

CREATE TABLE customers(
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(20) NOT NULL,
    last_name VARCHAR(20) NOT NULL,
    gender VARCHAR(10) NOT NULL,
    city VARCHAR(25) NOT NULL,
    reg_date DATE NOT NULL
);

CREATE TABLE products(
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50) NOT NULL,
    category VARCHAR(30) NOT NULL,
    unit_price DECIMAL(12,2) NOT NULL,
    cost_price DECIMAL(12,2) NOT NULL
);

CREATE TABLE employees(
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(25) NOT NULL,
    last_name VARCHAR(25) NOT NULL,
    branch VARCHAR(25) NOT NULL,
    hire_date DATE NOT NULL
);

CREATE TABLE sales(
    sale_id INT PRIMARY KEY,
    sale_date DATE NOT NULL,
    customer_id INT,
    product_id INT,
    employee_id INT,
    quantity INT NOT NULL,
    total_amount DECIMAL(12,2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id),
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);

INSERT INTO customers VALUES
(1,'Sarah','Namanda','Female','Kampala','2024-01-15'),
(2,'John','Opio','Male','Jinja','2024-03-10'),
(3,'Grace','Akello','Female','Mbarara','2024-05-22'),
(4,'David','Ssempa','Male','Entebbe','2024-07-19'),
(5,'Mary','Nabirye','Female','Kampala','2024-09-02'),
(6,'Peter','Mugisha','Male','Mbarara','2025-01-12'),
(7,'Esther','Ndagire','Female','Jinja','2025-02-05');

INSERT INTO products VALUES
(101,'Samsung TV 55”','Electronics',2500000,2000000),
(102,'HP Laptop','Electronics',3200000,2800000),
(103,'Rice 5kg','Groceries',55000,40000),
(104,'Cooking oil 2L','Groceries',18000,12000),
(105,'Blender','Home and Kitchen',120000,85000),
(106,'Microwave','Home and Kitchen',450000,380000),
(107,'Body Lotion','Personal Care',25000,15000),
(108,'Smartphone','Electronics',1500000,1200000);

INSERT INTO employees VALUES
(201,'Brian','Kato','Kampala','2023-02-01'),
(202,'Linda','Nankya','Jinja','2023-04-15'),
(203,'Kenneth','Tumusiime','Mbarara','2023-06-20'),
(204,'Cynthia','Namutebi','Entebbe','2023-08-10');

INSERT INTO sales VALUES
(1001,'2025-01-05',1,101,201,1,2500000),
(1002,'2025-01-07',2,103,202,5,275000),
(1003,'2025-01-10',3,102,203,1,3200000),
(1004,'2025-01-15',4,104,204,3,54000),
(1005,'2025-02-02',5,108,201,1,1500000),
(1006,'2025-02-05',6,105,203,2,240000),
(1007,'2025-02-10',7,107,202,4,100000),
(1008,'2025-02-18',1,103,201,3,165000),
(1009,'2025-03-01',2,106,202,1,450000),
(1010,'2025-03-05',3,101,203,1,2500000),
(1011,'2025-03-12',4,108,204,2,3000000),
(1012,'2025-03-20',5,104,201,5,90000);


-- STEP 2

-- a) products in electronics
SELECT * 
FROM products
WHERE category = 'Electronics';

-- b) customers from kamapla
SELECT * 
FROM customers
WHERE city = 'Kampala';

-- c) sales after 1st January 2025
SELECT *
FROM sales
WHERE sale_date > '2025-01-01';

-- d) product name and price > 500,000

SELECT product_name, unit_price
FROM products
WHERE unit_price > 500000;

-- e) total revenue per branch
SELECT e.branch, SUM(s.total_amount) AS total_revenue
FROM sales s
JOIN employees e ON s.employee_id = e.employee_id
GROUP BY e.branch;

-- f) total sales revenue
SELECT SUM(total_amount) AS total_revenue
FROM sales;

-- f) number of customers per city  
SELECT city, COUNT(*) AS total_customers
FROM customers
GROUP BY city;

-- STEP 3

-- a) category that contributes the most revenue
SELECT p.category, SUM(s.total_amount) AS revenue
FROM sales s
JOIN products p ON s.product_id = p.product_id
GROUP BY p.category
ORDER BY revenue DESC;

-- b) branch that needs performance improvement

-- Entebbe branch needs improvement

-- c) seasonal sales trends
SELECT MONTH(sale_date) AS month, SUM(total_amount) AS revenue
FROM sales
GROUP BY MONTH(sale_date)
ORDER BY month;

-- January has a good start, there was a moderate trend in Feburary and the most revenue was in March thus an upward revenue trend. 

-- d) Most profitable customers
SELECT c.first_name, c.last_name, SUM(s.total_amount) AS total_spent
FROM sales s
JOIN customers c ON s.customer_id = c.customer_id
GROUP BY c.customer_id
ORDER BY total_spent DESC;

-- Grace Akello and David Ssempa are the most profitable customers.

