--Fetch the top 5 athletes who have won the most gold medals

with t1 as (
select name,count(medal) as m
from olympics_history
where medal='gold'
group by name),

t2 as (
select *,DENSE_RANK()over(order by m desc) as rnk
from t1)

select name,m
from t2
where rnk<=5
order by rnk