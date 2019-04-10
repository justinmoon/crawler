SELECT visits_missed, count(*) AS num_members
FROM nodes
WHERE id in (select node_id from connections)
GROUP BY visits_missed
ORDER BY visits_missed