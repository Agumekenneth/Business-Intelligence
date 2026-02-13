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
