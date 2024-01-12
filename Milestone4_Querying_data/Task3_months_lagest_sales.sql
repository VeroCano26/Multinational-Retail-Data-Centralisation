SELECT 
       SUM(pr.product_price * ord.product_quantity) AS sales, dt.month  
FROM dim_products AS pr
JOIN orders_table AS ord ON pr.product_code = ord.product_code
JOIN dim_date_times AS dt ON dt.date_uuid = ord.date_uuid
  GROUP BY dt.month
  ORDER BY sales DESC
  LIMIT 6