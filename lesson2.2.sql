--JOINS INNE JOIN
select product_name,
    list_price,
    category_id
from production.products
order by product_name DESC


select product_name,
       list_price,
       category_id
from production.products
order by product_name DESC



select product_name,
       category_name,
       list_price
from production.products p
INNER JOIN production.categories c 
ON c.category_id = p.category_id
order by product_name DESC



select product_name,
       order_id
from production.products p
left join sales.order_items o on o.product_id = p.product_id
where order_id is null



select p.product_name,
       o.order_id,
       i.item_id,
       o.order_date
from production.products p
LEFT JOIN sales.order_items i
ON i.product_id = p.product_id
LEFT JOIN sales.orders o
ON o.order_id = i.order_id
ORDER BY
order_id



SELECT p.product_id,
       product_name,
       order_id
from production.products p
LEFT JOIN sales.order_items o 
ON o.product_id = p.product_id AND 
o.order_id = 100
order by
order_id desc




SELECT p.product_id,
       product_name,
       order_id
from production.products p
right join sales.order_items o 
ON o.product_id = p.product_id AND 
o.order_id = 100
order by
order_id desc




select product_name,
       order_id
from production.products p
right join sales.order_items o on o.product_id = p.product_id
where order_id is null


CREATE TABLE pm.projects(
    id INT PRIMARY KEY IDENTITY,
    title VARCHAR(255) NOT NULL
);

CREATE TABLE pm.members(
    id INT PRIMARY KEY IDENTITY,
    name VARCHAR(120) NOT NULL,
    project_id INT,
    FOREIGN KEY (project_id) 
        REFERENCES pm.projects(id)
)



INSERT INTO 
    pm.projects(title)
VALUES
    ('New CRM for Project Sales'),
    ('ERP Implementation'),
    ('Develop Mobile Sales Platform');


INSERT INTO
    pm.members(name, project_id)
VALUES
    ('John Doe', 1),
    ('Lily Bush', 1),
    ('Jane Doe', 2),
    ('Jack Daniel', null);


select m.name member, 
       p.title project
from pm.members m
FULL OUTER JOIN pm.projects p 
ON p.id = m.project_id



select m.name member, 
       p.title project
from pm.members m
FULL OUTER JOIN pm.projects p 
ON p.id = m.project_id
where m.id IS NULL OR P.id IS NULL




select product_id,
       product_name,
       store_id,
    0 as quantity
from production.products
CROSS JOIN sales.stores
ORDER BY product_name, store_id



SELECT
    s.store_id,
    p.product_id,
    ISNULL(sales, 0) sales
FROM
    sales.stores s
CROSS JOIN production.products p
LEFT JOIN (
    SELECT
        s.store_id,
        p.product_id,
        SUM (quantity * i.list_price) sales
    FROM
        sales.orders o
    INNER JOIN sales.order_items i ON i.order_id = o.order_id
    INNER JOIN sales.stores s ON s.store_id = o.store_id
    INNER JOIN production.products p ON p.product_id = i.product_id
    GROUP BY
        s.store_id,
        p.product_id
) c ON c.store_id = s.store_id
AND c.product_id = p.product_id
WHERE
    sales IS NULL
ORDER BY
    product_id,
    store_id;