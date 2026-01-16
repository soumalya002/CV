SELECT * FROM sales;
SELECT * FROM customer;
SELECT * FROM product;
SELECT 
    p.product_name,
    s.order_date,
    s.sales,
    
    -- Previous day's sales for the same product
    LAG(s.sales, 1, 0) OVER (
        PARTITION BY p.product_name 
        ORDER BY s.order_date
    ) AS previous_day_sales,
    
    -- Difference from previous day
    s.sales - LAG(s.sales, 1, 0) OVER (
        PARTITION BY p.product_name 
        ORDER BY s.order_date
    ) AS sales_difference
FROM 
    sales s
JOIN 
    product p ON s.product_id = p.product_id
ORDER BY 
    p.product_name, s.order_date;



