-- 1. Write a query to find all customers who have never placed an order.

CREATE DATABASE test;
USE test;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    email VARCHAR(100)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    amount DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);


INSERT INTO customers VALUES
(1, 'Alice', 'alice@email.com'),
(2, 'Bob', 'bob@email.com'),
(3, 'Charlie', 'charlie@email.com'),
(4, 'Diana', 'diana@email.com');

INSERT INTO orders VALUES
(101, 1, '2025-01-01', 250.00),
(102, 2, '2025-01-03', 150.00);


SELECT c.* FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
WHERE o.customer_id IS NULL;

-- 2. What is the difference between an INNER JOIN and a LEFT JOIN?

-- INNER JOIN returns only the rows where matching values exist in both tables based on the join condition.

select c.*, o.* from customers c
join orders o on c.customer_id = o.customer_id;

-- LEFT JOIN returns all rows from the left table and the matching rows from the right table.
-- If there is no match, the columns from the right table are returned as NULL.

SELECT c.*, o.* FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id;

-- 3. Combine results from two tables with compatible columns, including duplicates. Which operator would you use?

CREATE TABLE archived_orders (
    order_id INT,
    customer_id INT,
    order_date DATE,
    amount DECIMAL(10,2)
);

INSERT INTO archived_orders VALUES
(201, 1, '2024-12-15', 300.00),
(202, 3, '2024-11-20', 120.00);

SELECT * FROM orders
UNION ALL
SELECT * FROM archived_orders;
