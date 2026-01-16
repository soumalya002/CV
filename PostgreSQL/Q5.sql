SELECT * FROM sales;
SELECT * FROM customer;
SELECT * FROM product;
SELECT 
    p.category,
    COUNT(s.sales) AS total_sales,
    SUM(s.quantity) AS total_sales_amount,
    SUM(s.profit) AS total_profit,
    SUM(s.discount) AS total_discount
FROM 
    product as p
JOIN 
    sales s ON p.product_id = s.product_id
GROUP BY 
    p.category
ORDER BY 
    total_sales_amount DESC;

