
ALTER TABLE dim_users
	ALTER COLUMN user_uuid TYPE UUID USING user_uuid::UUID;
	
ALTER TABLE dim_users
	ALTER COLUMN first_name TYPE VARCHAR(255);

ALTER TABLE dim_users
	ALTER COLUMN last_name TYPE VARCHAR(255);
	
ALTER TABLE dim_users
	ALTER COLUMN country_code TYPE VARCHAR(2);

ALTER TABLE dim_users
	ALTER COLUMN join_date TYPE date USING join_date::date;

ALTER TABLE dim_users
	ALTER COLUMN date_of_birth TYPE date USING date_of_birth::date;
	
ALTER TABLE dim_users
	DROP COLUMN index;
	