SELECT * FROM sales;
SELECT * FROM customer;
SELECT * FROM product;
SELECT 
    c.customer_id,
    c.customer_name,
    s.order_id,
    s.sales,
    
    MAX(s.sales) OVER (
        PARTITION BY c.customer_name
    ) AS max_order_sales,
    
    MIN(s.sales) OVER (
        PARTITION BY c.customer_name
    ) AS min_order_sales
FROM 
    sales s
JOIN 
    customer c ON s.customer_id = c.customer_id
ORDER BY 
    c.customer_name, s.order_date;






