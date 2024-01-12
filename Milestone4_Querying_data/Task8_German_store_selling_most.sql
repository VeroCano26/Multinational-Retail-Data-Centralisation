SELECT 
	COUNT(orders_table.user_uuid) as total_sales,
	dim_store_details.store_type,
	MAX(dim_store_details.country_code) as country_code
FROM orders_table
	LEFT JOIN dim_store_details on orders_table.store_code = dim_store_details.store_code
	LEFT JOIN dim_products on orders_table.product_code = dim_products.product_code
WHERE dim_store_details.country_code = 'DE'
GROUP BY dim_store_details.store_type;