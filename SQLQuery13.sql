--Fetch the top 5 most successful countries in olympics. Success is defined by no of medals won

select *
from olympics_history o 
join noc_regions n on n.NOC=o.Noc

WITH t1 AS (
    SELECT region, COUNT(medal) AS no_of_medal
    FROM olympics_history o
	join noc_regions n on n.NOC=o.Noc
    WHERE medal IN ('Gold', 'Silver', 'Bronze')
    GROUP BY region
),
t2 AS (
    SELECT *, DENSE_RANK() OVER (ORDER BY no_of_medal DESC) AS rnk
    FROM t1
)
SELECT *
FROM t2
where rnk<=5