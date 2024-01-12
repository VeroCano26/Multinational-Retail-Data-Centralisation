with time_table(hour, minutes, seconds, day, month, year, date_uuid) as (
	SELECT 
		EXTRACT(hour from CAST(timestamp as time)) as hour,
		EXTRACT(minute from CAST(timestamp as time)) as minutes,
		EXTRACT(second from CAST(timestamp as time)) as seconds,
		day as day,
		month as month,
		year as year,
		date_uuid
	FROM dim_date_times),
	
	timestamp_table(timestamp, date_uuid, year) as (
		SELECT MAKE_TIMESTAMP(CAST(time_table.year as int), CAST(time_table.month as int),
							  CAST(time_table.day as int), CAST(time_table.hour as int),	
							  CAST(time_table.minutes as int), CAST(time_table.seconds as float)) as order_timestamp,
			time_table.date_uuid as date_uuid, 
			time_table.year as year
		FROM time_table),
	
	time_stamp_diffs(year, time_diff) as (
		SELECT timestamp_table.year, timestamp_table.timestamp - LAG(timestamp_table.timestamp) OVER (ORDER BY timestamp_table.timestamp asc) as time_diff
		FROM orders_table
		JOIN timestamp_table ON orders_table.date_uuid = timestamp_table.date_uuid),

	year_time_diffs(year, average_time_diff) as (
		SELECT year, AVG(time_diff) as average_time_diff
		FROM time_stamp_diffs
		GROUP BY year
		ORDER BY average_time_diff desc)
		
SELECT 
	year, 
	CONCAT('hours: ', EXTRACT(HOUR FROM average_time_diff),
					'  minutes: ', EXTRACT(MINUTE FROM average_time_diff),
				   '  seconds: ', CAST(EXTRACT(SECOND FROM average_time_diff) as int),
				   '  milliseconds: ', CAST(EXTRACT(MILLISECOND FROM average_time_diff) as int))
FROM year_time_diffs;
