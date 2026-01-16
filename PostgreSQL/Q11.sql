SELECT * FROM sales;
SELECT * FROM customer;
SELECT * FROM product;
SELECT 
    p.category,
    p.product_name,
    SUM(s.sales) AS total_sales,
    RANK() OVER (
        PARTITION BY p.category
        ORDER BY SUM(s.sales) DESC
    ) AS sales_rank
FROM 
    sales s
JOIN 
    product p ON s.product_id = p.product_id
GROUP BY 
    p.category, p.product_name
ORDER BY 
    p.category, sales_rank;
