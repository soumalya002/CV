SELECT * FROM sales;
SELECT * FROM customer;
SELECT * FROM product;
SELECT 
    c.segment,
    c.customer_id,
    c.customer_name,
    s.sales,

    -- Window function for average sales per segment
    AVG(s.sales) OVER (PARTITION BY c.segment) AS avg_segment_sales,

    -- Window function for ranking customers by sales within their segment
    ROW_NUMBER() OVER (
        PARTITION BY c.segment 
        ORDER BY s.sales DESC
    ) AS row_number_in_segment

FROM 
    sales s
JOIN 
    customer c ON s.customer_id = c.customer_id

ORDER BY 
    c.segment, row_number_in_segment;


