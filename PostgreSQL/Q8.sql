SELECT * FROM sales;
SELECT * FROM customer;
SELECT * FROM product;

SELECT state,
count(*) as number_of_person_in_each_state
from customer
group by state;