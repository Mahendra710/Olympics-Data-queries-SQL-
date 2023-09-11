--Find the Ratio of male and female athletes who participated in all Olympic games

with t1 as (
SELECT
    SUM(CASE WHEN sex = 'M' THEN 1 ELSE 0 END) AS MaleCount,
    SUM(CASE WHEN sex = 'F' THEN 1 ELSE 0 END) AS FemaleCount
from olympics_history)
select malecount,femalecount,(MaleCount*1.0/femalecount) as Male_to_female_ratio
from t1
