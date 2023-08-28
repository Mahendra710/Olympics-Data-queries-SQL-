--Mention the total no of nations who participated in each olympic game?

with t as
		(select Games,region
		from olympics_history o
		join noc_regions n on n.NOC=o.NOC
		group by games,region)

Select games,count(*) as total_no_of_nations
from t
group by games
order by games

