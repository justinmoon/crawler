SELECT 
	count(distinct node_id)
FROM 
	connections
WHERE 
	version IS NOT NULL AND
	node_id IN (
		SELECT id 
		FROM nodes
		WHERE nodes.ip LIKE '%onion%'
	);

	
