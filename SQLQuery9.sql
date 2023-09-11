-- Fetch oldest athletes to win a gold medal

WITH t1 AS (
    SELECT *, CAST(CASE WHEN o.age = 'NA' THEN '0' ELSE o.age END AS INT) AS calculated_age
    FROM olympics_history o
    WHERE Medal = 'Gold'
),
t2 AS (
    SELECT *, RANK() OVER (ORDER BY calculated_age DESC) AS rnk
    FROM t1
)
SELECT *
FROM t2
WHERE rnk = 1;






