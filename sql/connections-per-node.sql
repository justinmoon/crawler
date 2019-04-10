select node_id, count(*) from connections
group by node_id
order by count(*) desc
