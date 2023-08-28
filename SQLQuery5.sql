

with t as (
select n.region, o.games
from olympics_history o
join noc_regions n on n.NOC=o.NOC
group by n.region,o.games)


select country 
from (SELECT region AS country, COUNT(*) AS total_games
    FROM t
    GROUP BY region
) subquery
WHERE total_games = 51
GROUP BY country;







