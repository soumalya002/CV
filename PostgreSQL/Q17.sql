SELECT * FROM sales;
SELECT * FROM customer;
SELECT * FROM product;
SELECT 
    p.product_name,
    s.order_date,
    s.sales,
    
    AVG(s.sales) OVER (
        PARTITION BY p.product_name
        ORDER BY s.order_date
        ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
    ) AS moving_avg_sales_3
FROM 
    sales s
JOIN 
    product p ON s.product_id = p.product_id
ORDER BY 
    p.product_name, s.order_date;





