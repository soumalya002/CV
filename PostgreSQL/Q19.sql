SELECT * FROM sales;
SELECT * FROM customer;
SELECT * FROM product;
SELECT 
    c.customer_id,
    c.customer_name,
    s.order_date,
    s.profit,

    -- Running total of profit by customer, ordered by order date
    SUM(s.profit) OVER (
        PARTITION BY c.customer_name 
        ORDER BY s.order_date
    ) AS running_total_profit
FROM 
    sales s
JOIN 
    customer c ON s.customer_id = c.customer_id
ORDER BY 
    c.customer_name, s.order_date;







