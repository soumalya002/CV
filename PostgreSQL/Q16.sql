SELECT * FROM sales;
SELECT * FROM customer;
SELECT * FROM product;
SELECT 
    c.region,
    SUM(s.sales) AS total_region_sales,
    
    -- Total sales across all regions using a window function
    SUM(SUM(s.sales)) OVER () AS total_sales_all_regions,
    
    -- Percentage contribution
    ROUND(
        100.0 * SUM(s.sales) / SUM(SUM(s.sales)) OVER (), 2
    ) AS percent_of_total_sales
FROM 
    sales s
JOIN 
    customer c ON s.customer_id = c.customer_id
GROUP BY 
    c.region
ORDER BY 
    percent_of_total_sales DESC;




