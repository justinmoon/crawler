select count(*) as never_active_nodes
from nodes
where nodes.id not in (
	select node_id
	from connections
	where version is not NULL
);