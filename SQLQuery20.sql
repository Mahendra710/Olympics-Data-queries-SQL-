--Break down all olympic games where India won medal for Hockey and how many medals in each olympic games

SELECT
    oh.games AS Olympic_Game,
    SUM(CASE WHEN oh.medal IN ('Gold', 'Silver', 'Bronze') THEN 1 ELSE 0 END) AS Total_Medals
FROM
    olympics_history oh
WHERE
    oh.NOC = 'IND'
    AND oh.sport = 'Hockey'
GROUP BY
    oh.games
HAVING
    SUM(CASE WHEN oh.medal IN ('Gold', 'Silver', 'Bronze') THEN 1 ELSE 0 END) > 0
ORDER BY
    Olympic_Game;
