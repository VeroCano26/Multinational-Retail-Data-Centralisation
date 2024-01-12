SELECT 
ROUND(SUM(product_quantity * product_price)::numeric, 2) AS total_sales,
dt.year, 
dt.month
FROM dim_date_times AS dt
JOIN orders_table AS ord ON dt.date_uuid = ord.date_uuid
JOIN dim_products AS pr ON pr.product_code = ord.product_code
GROUP BY dt.month, dt.year
ORDER BY total_sales DESC
LIMIT 10;
