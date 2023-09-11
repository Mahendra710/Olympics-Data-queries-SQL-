--Identify which country won the most gold, most silver and most bronze medals in each olympic games



WITH MedalCounts AS (
    SELECT
        games,
        nr.region AS country,
        SUM(CASE WHEN oh.medal = 'Gold' THEN 1 ELSE 0 END) AS gold_count,
        SUM(CASE WHEN oh.medal = 'Silver' THEN 1 ELSE 0 END) AS silver_count,
        SUM(CASE WHEN oh.medal = 'Bronze' THEN 1 ELSE 0 END) AS bronze_count,
        RANK() OVER (PARTITION BY games ORDER BY SUM(CASE WHEN oh.medal = 'Gold' THEN 1 ELSE 0 END) DESC) AS gold_rank,
        RANK() OVER (PARTITION BY games ORDER BY SUM(CASE WHEN oh.medal = 'Silver' THEN 1 ELSE 0 END) DESC) AS silver_rank,
        RANK() OVER (PARTITION BY games ORDER BY SUM(CASE WHEN oh.medal = 'Bronze' THEN 1 ELSE 0 END) DESC) AS bronze_rank
    FROM
        olympics_history oh
    JOIN
        noc_regions nr ON nr.noc = oh.noc
    WHERE
        oh.medal IN ('Gold', 'Silver', 'Bronze')
    GROUP BY
        games,
        nr.region
)
SELECT games,
    MAX(CASE WHEN gold_rank = 1 THEN country END) AS gold_country,
    MAX(CASE WHEN gold_rank = 1 THEN gold_count END) AS gold_count,
    MAX(CASE WHEN silver_rank = 1 THEN country END) AS silver_country,
    MAX(CASE WHEN silver_rank = 1 THEN silver_count END) AS silver_count,
    MAX(CASE WHEN bronze_rank = 1 THEN country END) AS bronze_country,
    MAX(CASE WHEN bronze_rank = 1 THEN bronze_count END) AS bronze_count
FROM
    MedalCounts 
WHERE
    gold_rank = 1
    OR silver_rank = 1
    OR bronze_rank = 1
group by games
ORDER BY
    games;



