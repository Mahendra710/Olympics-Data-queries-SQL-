--In which Sport/event, India has won highest medals.

select top 1 sport,sum(case when medal in ('silver','gold','bronze') then 1 else 0 end) as total_medal
from olympics_history o
join noc_regions nr on nr.NOC=o.NOC
where nr.region='India'
group by nr.region,sport
order by total_medal desc

