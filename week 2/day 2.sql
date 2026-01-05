use test;
-- 1. Find the departments where the average salary is higher than the company-wide average salary.

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(100),
    department_id INT,
    salary DECIMAL(10,2)
);

CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100)
);

INSERT INTO departments (department_id, department_name) VALUES
(1, 'Engineering'),
(2, 'HR'),
(3, 'Sales'),
(4, 'Marketing');

INSERT INTO employees (emp_id, emp_name, department_id, salary) VALUES
-- Engineering (high avg)
(101, 'Alice', 1, 90000),
(102, 'Bob', 1, 95000),
(103, 'Charlie', 1, 100000),

-- HR (low avg)
(104, 'Diana', 2, 50000),
(105, 'Evan', 2, 52000),

-- Sales (mid avg)
(106, 'Frank', 3, 70000),
(107, 'Grace', 3, 72000),
(108, 'Henry', 3, 68000),

-- Marketing (above company avg)
(109, 'Irene', 4, 85000),
(110, 'Jack', 4, 88000);


SELECT d.department_name, AVG(e.salary) AS dept_avg
FROM departments d
JOIN employees e ON d.department_id = e.department_id
GROUP BY department_name
HAVING dept_avg > (
    SELECT AVG(salary) FROM employees
);


-- 2. Using a CTE, find the top 3 products sold in each region.

CREATE TABLE sales (
    sale_id INT PRIMARY KEY,
    product_id INT,
    region VARCHAR(50),
    quantity INT
);

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100)
);

INSERT INTO products (product_id, product_name) VALUES
(1, 'Laptop'),
(2, 'Phone'),
(3, 'Tablet'),
(4, 'Headphones'),
(5, 'Monitor');

INSERT INTO sales (sale_id, product_id, region, quantity) VALUES
-- North Region
(101, 1, 'North', 50),
(102, 2, 'North', 80),
(103, 3, 'North', 40),
(104, 4, 'North', 30),
(105, 5, 'North', 20),

-- South Region
(106, 1, 'South', 60),
(107, 2, 'South', 70),
(108, 3, 'South', 55),
(109, 4, 'South', 25),
(110, 5, 'South', 15),

-- East Region
(111, 1, 'East', 90),
(112, 2, 'East', 85),
(113, 3, 'East', 45),
(114, 4, 'East', 35),

-- West Region
(115, 1, 'West', 40),
(116, 2, 'West', 65),
(117, 3, 'West', 75),
(118, 4, 'West', 50),
(119, 5, 'West', 45);

WITH product_sales as (
SELECT s.region, p.product_name, sum(s.quantity) as total_sales,
row_number() over (partition by s.region order by sum(s.quantity) desc) as row_num
from sales s join products p on s.product_id = p.product_id
group by s.region, p.product_name
)
select region, product_name, total_sales
from product_sales
where row_num < 4;


-- 3. When is a correlated subquery inefficient?

-- a correlated subquery is in efficient when the subquery logic is complex and not optimized.
-- correlated subqueries run for every row therefore the overhead would be very large.
-- when the subquery tables are not indexed properly.

