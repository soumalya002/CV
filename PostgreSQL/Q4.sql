SELECT * FROM sales;
SELECT * FROM customer;
SELECT 
    c.segment,
    COUNT(s.sales) AS total_sales,
    SUM(s.quantity) AS total_sales_amount,
    SUM(s.profit) AS total_profit,
    SUM(s.discount) AS total_discount
FROM 
    customer c
JOIN 
    sales s ON c.customer_id = s.customer_id
GROUP BY 
    c.segment
ORDER BY 
    total_sales_amount DESC;

