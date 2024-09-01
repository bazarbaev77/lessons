--SELECT STATEMENT  

Select 
	customer_id,
	order_id,
	order_date,
	shipped_date
From sales.orders


Select * From sales.orders


Select * From sales.customers
Where [state] = 'CA' 


Select * From sales.customers
Where [state] = 'CA' 
Order By first_name


Select 
	city,
	count(*) 
From sales.customers
Where 
	[state] = 'CA' 
Group By city
having count(*) > 10
Order By city


Select first_name,
	   last_name, 
	   phone,
	   email
From sales.customers
Where
	phone like '%[10987]%'
Order By first_name desc



--ORDER BY CLAUSE 

Select first_name,
	   last_name
From sales.customers
Order by first_name



Select first_name,
	   last_name
From sales.customers
Order by first_name desc



Select city,
	   first_name,
	   last_name
From sales.customers
Order by city, first_name 



Select city,
	   first_name,
	   last_name
From sales.customers
Order by city desc, first_name asc 



Select city,
	   first_name,
	   last_name
From sales.customers
Order by [state]



Select first_name,
	   last_name
From sales.customers
Order by len(first_name), first_name



Select first_name,
	   last_name
From sales.customers
Order by 1, 2


--OFFSET AND FETCH
Select product_name,
	   list_price
From production.products
Order by list_price, product_name
Offset 10 rows


Select product_name,
	   list_price
From production.products
Order by list_price, product_name
Offset 10 rows
Fetch Next 10 rows only




Select product_name,
	   list_price
From production.products
Order by list_price, product_name
Offset 0 rows
Fetch Next 10 rows only 