SELECT * FROM sales;
SELECT 
    profit,
    discount,
    CASE 
        WHEN profit > discount THEN 'High Profit'
        WHEN profit = discount THEN 'Equal Margin'
        ELSE 'High Discount'
    END AS Compare
FROM 
    sales;
