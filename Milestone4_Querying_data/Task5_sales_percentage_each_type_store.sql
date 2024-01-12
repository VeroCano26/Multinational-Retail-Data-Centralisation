SELECT 
  store_type,
  ROUND(SUM(product_quantity * product_price)::numeric, 2) AS total_sales,
  ROUND((SUM(product_quantity * product_price) / 
     (SELECT SUM(product_quantity * product_price) FROM dim_store_details AS st
      JOIN orders_table AS ord ON st.store_code = ord.store_code
      JOIN dim_products AS pr ON pr.product_code = ord.product_code))::numeric * 100, 2) 
    AS "percentage_total(%)"
FROM dim_store_details AS st
JOIN orders_table AS ord ON st.store_code = ord.store_code
JOIN dim_products AS pr ON pr.product_code = ord.product_code
GROUP BY store_type
ORDER BY total_sales DESC;