--Which year saw the highest and lowest no of countries participating in Olympics?

With t as 
		(select year,region
		from olympics_history o
		join noc_regions n on n.NOC=o.NOC
		group by year,region )

select year ,count(*) as total_no_of_country
from t
group by year
order by total_no_of_country


-- Year with the highest number of countries
SELECT TOP 1 year, COUNT(DISTINCT NOC) AS highest_no_of_countries
FROM olympics_history
GROUP BY year
ORDER BY highest_no_of_countries DESC;

-- Year with the lowest number of countries
SELECT TOP 1 year, COUNT(DISTINCT NOC) AS lowest_no_of_countries
FROM olympics_history
GROUP BY year
ORDER BY lowest_no_of_countries ASC;

