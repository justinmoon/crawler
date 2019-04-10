select (
	select count(distinct node_id) 
	from connections 
	where strftime('%s','now') - start < 60*60
) as visited_in_last_hour,(
	select count(distinct node_id) 
	from connections 
	where strftime('%s','now') - start < 60*60*24
) as nodes_active_in_last_day,(
	select count(distinct node_id) 
	from connections 
	where strftime('%s','now') - start < 60*60*24*7
) as nodes_active_in_last_week;
