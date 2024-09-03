--create database lessons 
--use lessons 

Select distinct city 
from sales.customers
order by city 



Select distinct city, [state]
from sales.customers



Select distinct phone 
from sales.customers
order by phone 



select city,
	   [state],
	   zip_code
From sales.customers
group by city,
	     [state],
		 zip_code
Order By city,
	     [state],
		 zip_code

--WHERE CLAUSE

Select distinct city, [state], zip_code
From sales.customers

Select product_id,
       product_name,
       category_id,
       model_year,
       list_price
From production.products
where category_id = 1
Order by list_price desc



Select product_id,
       product_name,
       category_id,
       model_year,
       list_price
From production.products
where category_id = 1 and model_year = 2018
Order by list_price desc



Select product_id,
       product_name,
       category_id,
       model_year,
       list_price
From production.products
where list_price > 300 and model_year = 2018
Order by list_price desc



Select product_id,
       product_name,
       category_id,
       model_year,
       list_price
From production.products
where list_price > 3000 or model_year = 2018
Order by list_price desc




Select product_id,
       product_name,
       category_id,
       model_year,
       list_price
From production.products
where list_price between 1899.00 and 1999.99
Order by list_price desc




Select product_id,
       product_name,
       category_id,
       model_year,
       list_price
From production.products
where list_price in (299.99, 369.99, 489.99)
Order by list_price desc



Select product_id,
       product_name,
       category_id,
       model_year,
       list_price
From production.products
where product_name like '%Cruiser%'
Order by list_price desc


--NULL OPERATOR
Select customer_id,
	   first_name,
	   last_name,
	   phone
From sales.customers
Where phone = NULL
Order by first_name



Select customer_id,
	   first_name,
	   last_name,
	   phone
From sales.customers
Where phone is NULL
Order by first_name



Select customer_id,
	   first_name,
	   last_name,
	   phone
From sales.customers
Where phone is not NULL
Order by first_name



--AND OPERATOR 
Select *  
From production.products
Where category_id = 1 and list_price > 400
Order by list_price desc



Select *  
From production.products
Where category_id = 1 
and list_price > 400
and brand_id = 1
Order by list_price desc




Select *  
From production.products
Where brand_id = 1 
or brand_id = 2 
and list_price > 1000
Order by list_price desc



Select *  
From production.products
Where (brand_id = 1 OR brand_id = 2)
and list_price > 1000
Order by list_price desc



--OR OPERATOR
Select product_name,
	   list_price
from production.products
Where list_price < 200
or list_price > 6000
order by list_price 



Select product_name,
	   brand_id
from production.products
Where brand_id = 1
or brand_id = 2 
or brand_id = 4
order by brand_id desc 



Select product_name,
	   brand_id
from production.products
Where brand_id in (1, 2, 3)
order by brand_id desc 



Select product_name,
	   brand_id
from production.products
Where brand_id = 1
or brand_id = 2 
and list_price > 500
order by brand_id desc , list_price



Select product_name,
	   brand_id,
	   list_price
from production.products
Where brand_id = 1
or brand_id = 2 
and list_price > 500
order by brand_id 



--IN OPERATOR	
Select product_name,
	   list_price
from production.products
where list_price IN (89.99, 109.99, 159.99)
order by list_price



Select product_name,
	   list_price
from production.products
where list_price = 89.99 or list_price=109.99 or list_price =  159.99
order by list_price



select product_id
from production.stocks
where store_id = 1 and quantity >= 30



select product_name,
       list_price
from production.products
where product_id IN (select product_id from
					 production.stocks where
					 store_id = 1 AND quantity >= 30
					)
order by product_name





Select product_id,
	   product_name,
	   list_price
from production.products
where list_price BETWEEN 149.99 AND 199.99
order by list_price




--LIKE OPERATOR
Select order_id,
	   customer_id,
	   order_date,
	   order_status
from sales.orders
where order_date BETWEEN '20170115' AND '20170117'
order by order_date



select customer_id,
       first_name,
       last_name
from sales.customers
where last_name like 'z%'
order by first_name



select customer_id,
       first_name,
       last_name
from sales.customers
where last_name like '%er'
order by first_name



select customer_id,
       first_name,
       last_name
from sales.customers
where last_name LIKE 't%s'
order by first_name



select customer_id,
       first_name,
       last_name
from sales.customers
where last_name LIKE '_u%'
order by first_name



select customer_id,
       first_name,
       last_name
from sales.customers
where last_name LIKE '[YZ]%'
order by first_name




select customer_id,
       first_name,
       last_name
from sales.customers
where last_name LIKE '[A-C]%'
order by first_name



select customer_id,
       first_name,
       last_name
from sales.customers
where last_name LIKE '[^A-X]%'
order by first_name



select customer_id,
       first_name,
       last_name
from sales.customers
where last_name LIKE 'A%'
order by first_name




CREATE TABLE sales.feedbacks (
  feedback_id INT IDENTITY(1, 1) PRIMARY KEY, 
  comment VARCHAR(255) NOT NULL
);

INSERT INTO sales.feedbacks(comment)
VALUES('Can you give me 30% discount?'),
      ('May I get me 30USD off?'),
      ('Is this having 20% discount today?');


select feedback_id,
       comment
from sales.feedbacks
where comment LIKE '%30%'



select feedback_id, 
       comment
FROM 
   sales.feedbacks
WHERE 
   comment LIKE '%30!%%' ESCAPE '!'



select first_name + ' ' + last_name
from sales.customers
order by first_name



select first_name + ' ' + last_name as h
from sales.customers
order by first_name



select category_name 'Product Category'
from production.categories



select sales.customers.customer_id,
       first_name,
       last_name,
       order_id
from sales.customers
inner join sales.orders on sales.orders.customer_id = sales.customers.customer_id
