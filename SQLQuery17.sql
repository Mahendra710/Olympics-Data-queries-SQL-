--Identify which country won the most gold, most silver, most bronze medals and the most medals in each olympic games

with medalcount as (
     select games,nr.region as country,
	 sum(case when medal='gold' then 1 else 0 end) as gold_count,
	 sum (case when medal='silver' then 1 else 0 end) as silver_count,
	 sum(case when medal='bronze' then 1 else 0 end) as bronze_count,
	 sum(case when medal in ('gold','silver','bronze') then 1 else 0 end) total_medal_count,
	 rank() over(partition by games order by sum(case when medal='gold' then 1 else 0 end) desc) as gold_rank,
	 rank() over(partition by games order by sum(case when medal='silver' then 1 else 0 end) desc) as silver_rank,
	 rank() over(partition by games order by sum(case when medal='bronze' then 1 else 0 end) desc) as bronze_rank,
	 rank() over(partition by games order by sum(case when medal in ('gold','silver','bronze') then 1 else 0 end) desc) as total_medal_rank
	FROM
	olympics_history oh
	JOIN
		noc_regions nr ON nr.noc = oh.noc
	WHERE
		oh.medal IN ('Gold', 'Silver', 'Bronze')
	GROUP BY
		games,
		nr.region)


select games,
 MAX(CASE WHEN gold_rank = 1 THEN country END) AS gold_country,
    MAX(CASE WHEN gold_rank = 1 THEN gold_count END) AS gold_count,
    MAX(CASE WHEN silver_rank = 1 THEN country END) AS silver_country,
    MAX(CASE WHEN silver_rank = 1 THEN silver_count END) AS silver_count,
    MAX(CASE WHEN bronze_rank = 1 THEN country END) AS bronze_country,
    MAX(CASE WHEN bronze_rank = 1 THEN bronze_count END) AS bronze_count,
	Max(case when total_medal_rank =1 then country end) medal_country,
	Max(case when total_medal_rank=1 then total_medal_count end) as total_medal_count
FROM
    MedalCount
WHERE
    gold_rank = 1
    OR silver_rank = 1
    OR bronze_rank = 1 
	or total_medal_rank=1
group by games
ORDER BY
    games;