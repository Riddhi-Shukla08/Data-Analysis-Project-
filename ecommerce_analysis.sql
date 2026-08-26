 CREATE DATABASE ecommerce_analysis;
USE ecommerce_analysis;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    city VARCHAR(50),
    state VARCHAR(50),
    signup_date DATE
);

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50),
    price DECIMAL(10,2),
    stock INT
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    status VARCHAR(30),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    unit_price DECIMAL(10,2),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

CREATE TABLE payments (
    payment_id INT PRIMARY KEY,
    order_id INT,
    payment_method VARCHAR(30),
    payment_status VARCHAR(30),
    amount DECIMAL(10,2),
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

INSERT INTO customers VALUES
(1,'Aarav Sharma','Delhi','Delhi','2025-01-10'),
(2,'Priya Singh','Noida','Uttar Pradesh','2025-01-15'),
(3,'Rahul Verma','Ghaziabad','Uttar Pradesh','2025-02-02'),
(4,'Sneha Gupta','Meerut','Uttar Pradesh','2025-02-18'),
(5,'Vansh Kumar','Delhi','Delhi','2025-03-01'),
(6,'Ananya Mehta','Gurugram','Haryana','2025-03-15'),
(7,'Rohan Das','Kolkata','West Bengal','2025-04-01'),
(8,'Neha Jain','Jaipur','Rajasthan','2025-04-12'),
(9,'Karan Malhotra','Mumbai','Maharashtra','2025-05-05'),
(10,'Isha Kapoor','Pune','Maharashtra','2025-05-20'),
(11,'Mohit Yadav','Lucknow','Uttar Pradesh','2025-06-01'),
(12,'Simran Kaur','Chandigarh','Chandigarh','2025-06-15');

INSERT INTO products VALUES
(101,'Laptop','Electronics',55000.00,20),
(102,'Wireless Mouse','Electronics',800.00,100),
(103,'Keyboard','Electronics',1500.00,80),
(104,'Headphones','Electronics',2200.00,60),
(105,'Smartphone','Electronics',30000.00,25),
(106,'Backpack','Accessories',1800.00,50),
(107,'USB Cable','Accessories',500.00,150),
(108,'Power Bank','Accessories',1200.00,70),
(109,'Office Chair','Furniture',7500.00,15),
(110,'Desk Lamp','Furniture',1200.00,40);

INSERT INTO orders VALUES
(1001,1,'2025-06-01','Delivered'),
(1002,2,'2025-06-03','Delivered'),
(1003,3,'2025-06-05','Cancelled'),
(1004,1,'2025-06-08','Delivered'),
(1005,4,'2025-06-10','Delivered'),
(1006,5,'2025-06-12','Shipped'),
(1007,6,'2025-06-15','Delivered'),
(1008,7,'2025-06-18','Delivered'),
(1009,8,'2025-06-20','Pending'),
(1010,9,'2025-06-22','Delivered'),
(1011,10,'2025-06-25','Delivered'),
(1012,11,'2025-06-27','Shipped'),
(1013,12,'2025-06-28','Pending'),
(1014,4,'2025-06-29','Delivered');

INSERT INTO order_items VALUES
(1,1001,101,1,55000.00),
(2,1001,102,2,800.00),
(3,1002,105,1,30000.00),
(4,1002,107,2,500.00),
(5,1003,103,1,1500.00),
(6,1004,104,2,2200.00),
(7,1004,106,1,1800.00),
(8,1005,109,1,7500.00),
(9,1005,110,2,1200.00),
(10,1006,101,1,55000.00),
(11,1006,107,1,500.00),
(12,1007,105,1,30000.00),
(13,1007,108,2,1200.00),
(14,1008,106,2,1800.00),
(15,1008,102,1,800.00),
(16,1009,103,2,1500.00),
(17,1010,101,1,55000.00),
(18,1010,104,1,2200.00),
(19,1011,109,1,7500.00),
(20,1011,107,3,500.00),
(21,1012,105,1,30000.00),
(22,1012,102,1,800.00),
(23,1013,110,1,1200.00),
(24,1014,106,1,1800.00),
(25,1014,108,1,1200.00);

INSERT INTO payments VALUES
(501,1001,'UPI','Paid',56600.00),
(502,1002,'Card','Paid',31000.00),
(503,1003,'UPI','Refunded',1500.00),
(504,1004,'Card','Paid',6200.00),
(505,1005,'Cash','Paid',9900.00),
(506,1006,'UPI','Paid',55500.00),
(507,1007,'Card','Paid',32400.00),
(508,1008,'UPI','Paid',4400.00),
(509,1009,'Card','Pending',3000.00),
(510,1010,'Card','Paid',57200.00),
(511,1011,'UPI','Paid',9000.00),
(512,1012,'UPI','Paid',30800.00),
(513,1013,'Cash','Pending',1200.00),
(514,1014,'Card','Paid',3000.00);

SELECT customer_id, customer_name, city, state
FROM customers;

SELECT customer_id, customer_name, city
FROM customers
WHERE state = 'Uttar Pradesh';

SELECT product_id, product_name, category, price
FROM products
ORDER BY price DESC;

SELECT order_id, customer_id, order_date, status
FROM orders
WHERE status = 'Delivered'
ORDER BY order_date;

SELECT state, COUNT(*) AS customer_count
FROM customers
GROUP BY state
ORDER BY customer_count DESC;

SELECT state, COUNT(*) AS customer_count
FROM customers
GROUP BY state
HAVING COUNT(*) > 1
ORDER BY customer_count DESC;


SELECT o.order_id, c.customer_name, o.order_date, o.status
FROM orders o
INNER JOIN customers c
    ON o.customer_id = c.customer_id
ORDER BY o.order_id;

SELECT c.customer_id, c.customer_name,
       COUNT(o.order_id) AS total_orders
FROM customers c
LEFT JOIN orders o
    ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name
ORDER BY total_orders DESC, c.customer_id;

SELECT 'INNER JOIN' AS join_type, COUNT(*) AS row_count
FROM customers c
INNER JOIN orders o
    ON c.customer_id = o.customer_id

UNION ALL

SELECT 'LEFT JOIN' AS join_type, COUNT(*) AS row_count
FROM customers c
LEFT JOIN orders o
    ON c.customer_id = o.customer_id;

SELECT p.product_name,
       p.category,
       SUM(oi.quantity) AS units_sold,
       SUM(oi.quantity * oi.unit_price) AS sales_amount
FROM order_items oi
INNER JOIN products p
    ON oi.product_id = p.product_id
INNER JOIN orders o
    ON oi.order_id = o.order_id
WHERE o.status <> 'Cancelled'
GROUP BY p.product_id, p.product_name, p.category
ORDER BY sales_amount DESC;

SELECT c.customer_name,
       COUNT(DISTINCT o.order_id) AS total_orders,
       SUM(oi.quantity * oi.unit_price) AS total_spent
FROM customers c
INNER JOIN orders o
    ON c.customer_id = o.customer_id
INNER JOIN order_items oi
    ON o.order_id = oi.order_id
WHERE o.status <> 'Cancelled'
GROUP BY c.customer_id, c.customer_name
ORDER BY total_spent DESC;

SELECT product_id, product_name, category, price
FROM products
WHERE price > (SELECT AVG(price) FROM products)
ORDER BY price DESC;

SELECT customer_id, customer_name
FROM customers
WHERE customer_id IN (
    SELECT customer_id
    FROM orders
    GROUP BY customer_id
    HAVING COUNT(*) >= 2
);

SELECT c.customer_name,
       COALESCE(SUM(
           CASE
               WHEN o.status <> 'Cancelled'
               THEN oi.quantity * oi.unit_price
               ELSE 0
           END
       ),0) AS total_spent,
       CASE
           WHEN COALESCE(SUM(
               CASE
                   WHEN o.status <> 'Cancelled'
                   THEN oi.quantity * oi.unit_price
                   ELSE 0
               END
           ),0) >= 50000 THEN 'High Value'
           WHEN COALESCE(SUM(
               CASE
                   WHEN o.status <> 'Cancelled'
                   THEN oi.quantity * oi.unit_price
                   ELSE 0
               END
           ),0) >= 10000 THEN 'Medium Value'
           ELSE 'Low Value'
       END AS customer_segment
FROM customers c
LEFT JOIN orders o
    ON c.customer_id = o.customer_id
LEFT JOIN order_items oi
    ON o.order_id = oi.order_id
GROUP BY c.customer_id, c.customer_name
ORDER BY total_spent DESC;

SELECT customer_name, total_spent
FROM (
    SELECT c.customer_name,
           SUM(oi.quantity * oi.unit_price) AS total_spent
    FROM customers c
    INNER JOIN orders o
        ON c.customer_id = o.customer_id
    INNER JOIN order_items oi
        ON o.order_id = oi.order_id
    WHERE o.status <> 'Cancelled'
    GROUP BY c.customer_id, c.customer_name
) AS customer_sales
ORDER BY total_spent DESC
LIMIT 1;

SELECT customer_name, city, COUNT(*) AS duplicate_count
FROM customers
GROUP BY customer_name, city
HAVING COUNT(*) > 1;

SELECT category, COUNT(*) AS product_count
FROM products
WHERE price >= 1000
GROUP BY category
HAVING COUNT(*) >= 2;

             