--SELF JOIN

select e.first_name + ' ' + e.last_name employee,
       m.first_name + ' ' + m.last_name manager
from sales.staffs e
inner join sales.staffs m on m.staff_id = e.manager_id
order by manager



select e.first_name + ' ' + e.last_name employee,
       m.first_name + ' ' + m.last_name manager
from sales.staffs e
left join sales.staffs m on m.staff_id = e.manager_id
order by manager



select c1.city,
       c1.first_name + ' ' + c1.last_name customer_1,
       c2.first_name + ' ' + c2.last_name customer_2
from sales.customers c1
inner join sales.customers c2 on c1.customer_id > c2.customer_id
and c1.city = c2.city
order by city,
         customer_1,
         customer_2



select c1.city,
       c1.first_name + ' ' + c1.last_name customer_1,
       c2.first_name + ' ' + c2.last_name customer_2
from sales.customers c1
inner join sales.customers c2 on c1.customer_id <> c2.customer_id
and c1.city = c2.city
order by city,
         customer_1,
         customer_2


select customer_id, first_name + ' ' + last_name c, 
       city
from sales.customers
where city = 'Albany'
order by c




SELECT c1.city,
       c1.first_name + ' ' + c1.last_name customer_1,
       c2.first_name + ' ' + c2.last_name customer_2
from sales.customers c1
inner join sales.customers c2 ON c1.customer_id > c2.customer_id
and c1.city = c2.city
where c1.city = 'Albany'
order by c1.city,
		 customer_1,
		 customer_2



--GROUP BY 

select customer_id,
       YEAR (order_date) order_year
from sales.orders
where customer_id IN (1, 2)
ORDER BY customer_id




select customer_id,
       YEAR (order_date) order_year
from sales.orders
where customer_id IN (1, 2)
group by customer_id,
         YEAR (order_date)
order by customer_id



select distinct
    customer_id,
    YEAR (order_date) order_year
from sales.orders
where customer_id IN (1, 2)
order by customer_id


select distinct
    customer_id,
    YEAR (order_date) order_year,
	COUNT (order_id) order_placed
from sales.orders
where customer_id IN (1, 2)
group by customer_id,
    YEAR (order_date)
order by customer_id



select city,
	   count(customer_id) customer_count
from sales.customers
group by city 
order by city 


select brand_name,
       min (list_price) min_price,
       min (list_price) max_price
from production.products p
inner join production.brands b ON b.brand_id = p.brand_id
where model_year = 2018
group by brand_name
order by brand_name



select brand_name,
       avg (list_price) avg_price
from production.products p
inner join production.brands b ON b.brand_id = p.brand_id
where model_year = 2018 
group by brand_name
order by brand_name



select order_id,
       sum (
       quantity * list_price * (1 - discount)
    ) net_value
from sales.order_items
group by order_id