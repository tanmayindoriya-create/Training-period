-- rank cities by population within each country
select *, dense_rank() over(partition by country order by population) from cities;

-- join 1

with customer_cte as (select *, row_number() over() as rn from customers),
orders_cte as (select *, row_number() over() as rn from orders)
select c.*, o.* from customer_cte c join orders_cte o on c.rn = o.rn;

-- join 2

with rank_cities as 
(select o.*, p.MCity, row_number() over(partition by o.orders order by p.MStartDate desc) as rn
from orders o left join parts p on o.OPart = p.Part and p.MStartDate <= o.ODate)
select orders, OPart, ODate, coalesce(MCity, 'Noida') as delivery_city
from rank_cities where rn = 1;

-- join 3

select distinct e.emp_id, e.emp_name from employees e join employees m on e.emp_id = m.manager_id