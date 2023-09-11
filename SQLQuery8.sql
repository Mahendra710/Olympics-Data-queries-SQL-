--Fetch the total no of sports played in each Olympic games

with t1 as (
		select distinct sport, games 
		from olympics_history)
	select games, count(sport) as total_no_of_sports
	from t1
	group by games