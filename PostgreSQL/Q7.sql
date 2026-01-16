SELECT * FROM sales;
SELECT * FROM customer;
SELECT * FROM product;

SELECT 
DATE_TRUNC('month',order_date) as month,
sum(sales) as total_sales
from sales
group by month;