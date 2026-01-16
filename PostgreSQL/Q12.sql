SELECT * FROM sales;
SELECT * FROM customer;
SELECT * FROM product;
SELECT 
    p.product_name,
    s.order_date,
    s.sales,
    SUM(s.sales) OVER (
        PARTITION BY p.product_name
        ORDER BY s.order_date
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS cumulative_sales
FROM 
    sales s
JOIN 
    product p ON s.product_id = p.product_id
ORDER BY 
    p.product_name, s.order_date;

