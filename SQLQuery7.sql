--Which Sports were played only once in the Olympics?

with t1 as
    (select distinct games, sport
    from olympics_history),
    t2 as
    (select sport, count(*) as no_of_games
    from t1
    group by sport)

  select t2.sport 
      from t2
      join t1 on t1.sport = t2.sport
      where t2.no_of_games = 1
      order by t1.sport;