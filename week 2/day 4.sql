-- 1. What is a database index and how does it improve query performance?

-- a database index is a data structure that is associated with one or multiple columns of a table which makes data reads faster.
-- indexes act like table of content for tables. instead of scanning rows, db can directly jump to the required rows
-- making searching, joins and filtering faster if the indexed column is used
create index idx_cust_email 
on customers (email);

-- 2. You have a query that is running slow. What is the first tool/command you would use to investigate it?

-- we can use EXPLAIN and EXPLAIN ANALYZE commands on that query to figure out it's execution order and actual time it takes
-- to execute. Based on that, we can try to re-write the query if a better solution is avaliable or add indexes on the
-- relevant columns if the query is being frequently used
explain
select t.mon, sum(t.monthly_sales) over(order by t.mon rows between unbounded preceding and current row) from
(select month(s.sale_date) as mon, sum(s.unit_price) as monthly_sales from sales s group by month(s.sale_date)) t;


-- 3. Explain the 'C' in ACID (Consistency).

-- C in ACID properties stand for consistency which states that a transaction must transition the database from one valid state to another
-- which includes keeping data integrity inact and preventing data from getting dirty.

