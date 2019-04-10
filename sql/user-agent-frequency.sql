select user_agent, count(*) as frequency
from connections
where version is not null
group by user_agent
order by frequency DESC;