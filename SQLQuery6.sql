--Identify the sport that was played in all summer Olympics.



with t1 as
		(select count(distinct games) as game
		from olympics_history
		where season='summer'),
	 t2 as 
		(select distinct games,sport
		from olympics_history
		where season='summer'
		),
	t3 as 
	  (select sport, count(*) as total_games
		from t2
		group by sport)


select sport 
from t3
join t1 on t1.game=t3.total_games
group by sport