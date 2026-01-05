use test;
-- 1. Calculate the running total of sales month by month.

select t.mon, sum(t.monthly_sales) over(order by t.mon rows between unbounded preceding and current row) from
(select month(s.sale_date) as mon, sum(s.unit_price) as monthly_sales from sales s group by month(s.sale_date)) t;

-- 2. Find the salary difference between an employee and the average salary of their department.

select e.emp_name, d.department_name, e.salary - avg(e.salary) over(partition by d.department_id) as salary_difference
from employees e join departments d on e.department_id = d.department_id;

-- 3. What is the difference between ROW_NUMBER() and RANK()?

-- row_number() provides numbers to rows one by one in the order they are arranged in (arranged using order by or default) and no number is skipped

select *, row_number() over() from sales;

-- while
-- rank() ranks the rows on the basis of a single column decided by order by clause in over(). rank() assigns duplicate value rows same rank, if so, the next numbers are skipped depending on how many duplicates exist

select *, rank() over(order by unit_price desc) from sales;