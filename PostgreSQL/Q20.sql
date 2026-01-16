SELECT * FROM sales;
SELECT * FROM customer;
SELECT * FROM product;
SELECT 
    s.order_id,
    s.ship_mode,
    s.sales,
    
    DENSE_RANK() OVER (
        PARTITION BY s.ship_mode 
        ORDER BY s.sales DESC
    ) AS sales_rank_within_ship_mode
FROM 
    sales s
ORDER BY 
    s.ship_mode, sales_rank_within_ship_mode;








