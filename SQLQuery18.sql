--Which countries have never won gold medal but have won silver/bronze medals?

SELECT 
    nr.region AS country,
    SUM(CASE WHEN oh.medal = 'Gold' THEN 1 ELSE 0 END) AS gold,
    SUM(CASE WHEN oh.medal = 'Silver' THEN 1 ELSE 0 END) AS silver,
    SUM(CASE WHEN oh.medal = 'Bronze' THEN 1 ELSE 0 END) AS bronze
FROM
    olympics_history oh
JOIN
    noc_regions nr ON nr.noc = oh.noc
WHERE
    oh.medal IN ('Gold', 'Silver', 'Bronze')
GROUP BY
    nr.region
HAVING
    SUM(CASE WHEN oh.medal = 'Gold' THEN 1 ELSE 0 END) = 0
ORDER BY
    country;
