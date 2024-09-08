select first_name,
       last_name
from sales.staffs
union
select first_name,
       last_name
from sales.customers



SELECT COUNT (*)
FROM sales.staffs      

select COUNT (*)
from sales.customers



SELECT first_name,
       last_name
FROM sales.staffs
union all
select first_name,
       last_name
from sales.customers



select first_name,
       last_name
from sales.staffs
union all
select first_name,
       last_name
from sales.customers
order by first_name,
         last_name



select product_id
from production.products
except
select product_id
from sales.order_items



select product_id
from production.products
except
select product_id
from sales.order_items
order by product_id


select product_id
from production.products
except
select product_id
from sales.order_items;




select product_id
from production.products
except
select product_id
from sales.order_items
order by product_id







select city
from sales.customers
intersect
select city
from sales.stores
order by city




select customer_id,
       year (order_date),
       count (order_id) order_count
from sales.orders
group by customer_id,
		 year (order_date)
having count (order_id) >= 2
order by customer_id




select order_id,
       sum( quantity * list_price * (1 - discount)) net_value
from sales.order_items
group by order_id
having
    sum (quantity * list_price * (1 - discount)) > 20000
order by net_value



select category_id,
       max(list_price) max_list_price,
       min(list_price) min_list_price
from production.products
group by category_id
having max(list_price) > 4000 or min (list_price) < 500



select category_id,
       avg (list_price) avg_list_price
from production.products
group by category_id
having avg (list_price) between 500 and 1000

