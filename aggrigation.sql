-- In SQL and databases, Aggregation means taking multiple rows of data and combining/summarizing them into a single result.

-- Instead of viewing every individual record, aggregation lets you answer high-level questions like:

-- "How many total orders do we have?"
-- "What is our total revenue?"
-- "What is the average product price?"
-- 1. The Most Common Aggregate Functions
-- Function	What it does	Example Question
-- COUNT()	Counts number of rows / values	How many customers signed up?
-- SUM()	Calculates the total sum of numbers	What is the total quantity of items sold?
-- AVG()	Calculates the average value	What is the average price of products?
-- MIN()	Finds the smallest / minimum value	What is the cheapest product?
-- MAX()	Finds the largest / maximum value	What was the most expensive purchase?




-- Give me the total count of the customers present at our platform.
SELECT * FROM customers;

SELECT COUNT(*) AS Count_custom
FROM customers;

SELECT count(phone) FROM customers; --it give the count of non null value in that entire collumn.



SELECT DISTINCT city 
FROM customers ;


SELECT COUNT(DISTINCT city) AS
unique_city_count
FROM customers;

SELECT 
    ROW_NUMBER() OVER (ORDER BY city) AS s_no,
    city
FROM (
    SELECT DISTINCT city 
    FROM customers
    WHERE city IS NOT NULL
) subquery;


--1 give me the total reveneu of all the order item 

select
   order_item_id,
   quantity,
   unit_price,
   quantity * unit_price as Total_selling_value
 from order_items;

SELECT sum(quantity * unit_price) from order_items;


--2 give average price of product across all products

select avg(unit_price) from order_items;

SELECT Round(avg(price)) as Avg_price from products;
-- round function is used to find the roundoff value


--3 give me minimum and maximum price from product
SELECT * FROM products order by price ASC;
SELECT * FROM products order by price DESC;


SELECT min(price) FROM products;

SELECT max(price) FROM products;


--Q give me total number of category in each products

SELECT category_id,count(*)
from products AS total_no_ctg
group by category_id;


--Q Give me total number of active and inactive count in each category
SELECT is_active,category_id, 
count(*)
from products as total_active_products
GROUP BY is_active,category_id;



SELECT
p. category_id,
c. category_name, 
COUNT (*) FROM products as p 
LEFT JOIN categories as c on c.category_id = p.category_id 
GROUP BY p.category_id, c.category_name
HAVING COUNT(*)>=5;

--Q Find the department having more then one employeee
SELECT
departments_id, 
COUNT (*),

SUM(salary) as total_dep_salary 
FROM employees 
WHERE manager_id IS NOT NULL 
GROUP BY departments_id HAVING COUNT(*) >1;

select * FROM departments;


--Q Give me all the customers having atleast one cancelled order

SELECT * FROM customers as Cstm LEFT JOIN orders as O ON 
Cstm.customer_id = O.customer_id
where O.status = 'completed';


SELECT * FROM customers as Cstm LEFT JOIN orders as O ON 
Cstm.customer_id = O.customer_id
where O.status IS   NULL;


SELECT * FROM orders 
WHERE status = 'completed';



SELECT customer_id
FROM orders
where status = 'completed';



-- ===========SUB QUERY===========
SELECT * FROM customers
WHERE customer_id IN (SELECT customer_id
FROM orders
where status = 'completed');



--Q Give me price of all the products having price greater then avg price from all the products
SELECT * FROM products
WHERE price > (SELECT avg(price) from products);



--- CTE (Common Table Expression)-----

-- Q give me the products having price greater then avg price from all the products
WITH avg_price_table AS (SELECT avg(price) from products)
SELECT * FROM products
JOIN avg_price_table ON products.price > avg_price_table.avg;

-- STRUCTURE OF CTE:
-- WITH VARIABLE_NAME AS (QUERY)
-- SELECT * FROM VARIABLE_NAME;





WITH category_stats AS (
    SELECT
        p.category_id, 
        SUM(oi.quantity * oi.unit_price) AS category_sales 
    FROM order_items AS oi 
    LEFT JOIN products AS p ON p.product_id = oi.product_id 
    GROUP BY p.category_id
)
SELECT 
    c.category_name, 
    category_stats.category_sales 
FROM category_stats
LEFT JOIN categories AS c ON c.category_id = category_stats.category_id;