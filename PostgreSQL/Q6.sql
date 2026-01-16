SELECT * FROM sales;
SELECT * FROM customer;
SELECT * FROM product;

SELECT ship_mode,
count(*) as total_ships
from sales
group by ship_mode;