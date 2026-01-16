SELECT * FROM sales;
SELECT * FROM customer;
SELECT * FROM product;
WITH ranked_customers AS (
    SELECT 
        c.region,
        c.customer_id,
        c.customer_name,
        SUM(s.profit) AS total_profit,
        RANK() OVER (
            PARTITION BY c.region
            ORDER BY SUM(s.profit) DESC
        ) AS profit_rank
    FROM 
        customer c
    JOIN 
        sales s ON c.customer_id = s.customer_id
    GROUP BY 
        c.region, c.customer_id, c.customer_name
)
SELECT 
    region,
    customer_id,
    customer_name,
    total_profit,
    profit_rank
FROM 
    ranked_customers
WHERE 
    profit_rank <= 3
ORDER BY 
    region, profit_rank;


