select * from customers;
select * from sales;
SELECT 
    a.region,
	sum(b.sales) as total_sales
	from customer as a
	join
	sales as b on
	a.customer_id=b.customer_id
	group by 
	a.region
	order by
	total_sales desc;
	