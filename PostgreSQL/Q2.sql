select * from customers;
select * from sales;
SELECT 
    p.product_name,
    SUM(s.sales) AS total_sales
FROM 
    sales AS s
JOIN 
    product AS p ON s.product_id = p.product_id
GROUP BY 
    p.product_name
ORDER BY 
    total_sales DESC;
	