SELECT * FROM sales;
SELECT * FROM customer;
SELECT * FROM product;

SELECT b.sub_category,
	sum(a.sales) as total_sales from
	sales as a join product as b on a.product_id=b.product_id
	group by sub_category;