--Fetch the top 5 athletes who have won the most medals (gold/silver/bronze)

WITH t1 AS (
    SELECT name, team, COUNT(medal) AS no_of_medal
    FROM olympics_history
    WHERE medal IN ('Gold', 'Silver', 'Bronze')
    GROUP BY name, team
),
t2 AS (
    SELECT *, DENSE_RANK() OVER (ORDER BY no_of_medal DESC) AS rnk
    FROM t1
)
SELECT *
FROM t2
where rnk<=5;

