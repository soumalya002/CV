SELECT * FROM sales;
SELECT * FROM customer;
SELECT * FROM product;

SELECT a.customer_id,
a.customer_name,sum(b.sales) as total_sales
from customer as a join 
sales as b on a.customer_id=b.customer_id
group by a.customer_id,b.customer_id
order by total_sales;