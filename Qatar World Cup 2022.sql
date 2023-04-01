## Total no. of teams participated in the world cup
select count(distinct squad) as Total_no_of_teams
from appearances;

## No. of matches played in the world cup
select count(*) as No_of_matches
from fixtures_results;

## No. of group stage matches played in the world cup
select count(*) No_of_group_matches
from fixtures_results
where Stages = 'Group Stage';

## Toatal no. of stadium used in the tournament
select count(distinct venue) as Total_no_of_stadiums
from fixtures_results;

## Stadium that hosted highest no of matches
select venue,count(venue) as No_of_matches_hosted
from fixtures_results
group by Venue
order by 2 desc
limit 1;

## Champions of the world cup
select winner as Champions
from fixtures_results
where stages = 'Final';


## Runner-ups of the world cup
select loser as Runner_ups
from fixtures_results
where stages = 'Final';

## 3rd place team in the world cup
select winner as 3rd_place
from fixtures_results
where stages = '3rd place';

## Total no. of players participated
select count(*) as Total_players
from appearances;

## Youngest Player in the Tournament
select Player, Age, Squad
from appearances
order by age ASC
limit 1;

## Most fouled player
select Players, Fouls_Drawn
from defensive_stats
order by 2 desc
limit 1;

## Total Goals scored in the tournament
select (sum(Goals)+sum(Own_Goals)) as Total_goals_scored
from goal_scoring_stats g inner join defensive_stats d
on g.Player=d.players;

## Total Own Goals scored in the tournament
select sum(Own_Goals) as Total_own_goals_scored
from goal_scoring_stats g inner join defensive_stats d
on g.Player=d.players;

## Players who scored own goals
select Players,Own_goals
from defensive_stats
where own_goals>0;

## Top 5 Goal Scorers in the tournamnet
select Player, Goals
from goal_scoring_stats
order by 2 desc
limit 5;

## Top 5 Assist Providers in the tournamnet
select Players,Assists
from passing_stats
order by assists desc
limit 5;

## Top 3 Goal Contributors in the tournamnet
select g.Player,(g.Goals+p.Assists) as Goal_contribution
from goal_scoring_stats g inner join passing_stats p 
on g.Player=p.Players
order by 2 desc
limit 3;

## Most no of Penalties Scored
select Player,Penalty_Kick_Goals
from goal_scoring_stats
order by 2 desc
limit 1;

## Top 10 Players played most no. of minutes
select Player,Minutes_Played
from appearances
order by 2 desc
limit 10;

## Top 3 Goalkeepers in terms of Save Percentage(Min.270mins)
select Player,Squad as Country,Save_Percentage
from goalkeeping_stats gk inner join appearances a
on gk.Players=a.Player
where Minutes_Played > 270
order by Save_Percentage desc
Limit 3;

## Most Cleansheet obtained by a Goalkeeper(Min.270mins)
select Player,Squad as Country,Clean_Sheet
from goalkeeping_stats gk inner join appearances a
on gk.Players=a.Player
where Minutes_Played > 270
order by Clean_Sheet desc, Minutes_Played asc
Limit 1;

## Top 3 Goalkeepers with most passing accuracy(Min.270mins)
select gk.Players,Squad,Pass_Completion_Percentage
from goalkeeping_stats gk inner join passing_stats p
on gk.Players=p.Players inner join appearances a
on p.Players = a.Player
where Minutes_Played > 270
order by 3 desc
limit 3;


## Top 5 clubs which has maximum no of players participated in the tournament
select Club,count(club) as No_of_Players
from appearances
group by club
order by 2 desc
limit 5;

## Total no of Yellow Cards & Red Cards shown in the world cup
select sum(Yellow_Card)as Yellow_Cards ,sum(Red_Card) as Red_Cards
from defensive_stats;

## Players who recieved Red card
select Players,Red_Card
from defensive_stats
where Red_Card > 0;

## Player who recieved Maximum Yellow cards
select Player,Yellow_Card
from defensive_stats
order by 2 desc
limit 1;

## Top 5 Players with Most no of Interceptions
select d.Players,Interception
from defensive_stats d inner join appearances a
on d.Players = a.Player
where Minutes_Played > 270
order by Interception desc
limit 5;

## Top 3 Midfielders with Most no of Interceptions (Min. 270 mins)
select d.Players,Squad,Interception
from defensive_stats d inner join appearances a
on d.Players = a.Player
where Minutes_Played > 270 and a.Position like '%MF%'
order by Interception desc
limit 3;

## Top 3 Midfielders with Most no of Ball Recoveries (Min. 270 mins)
select d.Players,Squad,Ball_Recoveries
from defensive_stats d inner join appearances a
on d.Players = a.Player
where Minutes_Played > 270 and a.Position like '%MF%'
order by 3 desc
limit 3;

## Top 3 Midfielders with Highest Passing Accuracy (Min. 270 mins)
select Players,Squad, Pass_Completion_Percentage
from passing_stats p inner join appearances a
on p.Players = a.Player
where Minutes_Played > 270 and a.Position like '%MF%'
order by Pass_Completion_Percentage desc
limit 3;

## Midfielder with Most no of Assists (Min. 270 mins)
select Player,Squad,Assists
from passing_stats p inner join appearances a
on p.Players = a.Player
where Minutes_Played > 270 and a.Position like '%MF%'
order by Assists desc
limit 1;

## Midfielder with Most no of Key Passes (Min. 270 mins)
select Player,Squad,Key_Passes
from passing_stats p inner join appearances a
on p.Players = a.Player
where Minutes_Played > 270 and a.Position like '%MF%'
order by Key_Passes desc
limit 1;

## Top 3 Defenders with Most no of Interceptions (Min. 270 mins)
select d.Players,Squad,Interception
from defensive_stats d inner join appearances a
on d.Players = a.Player
where Minutes_Played > 270 and a.Position like '%DF%'
order by Interception desc
limit 3;

## Top 3 Defenders with Most no of Shots Blocked (Min. 270 mins)
select d.Players,Squad,Shots_Blocked
from defensive_stats d inner join appearances a
on d.Players = a.Player
where Minutes_Played > 270 and a.Position like '%DF%'
order by 3 desc
limit 3;

## Top 3 Defenders with Most no of Tackles Won (Min. 270 mins)
select d.Players,Squad,Tackles_Won
from defensive_stats d inner join appearances a
on d.Players = a.Player
where Minutes_Played > 270 and a.Position like '%DF%'
order by 3 desc
limit 3;

## Top 3 Defenders with Most no of Clearances (Min. 270 mins)
select d.Players,Squad,Clearance
from defensive_stats d inner join appearances a
on d.Players = a.Player
where Minutes_Played > 270 and a.Position like '%DF%'
order by 3 desc
limit 3;

## Top 3 Defenders with Most no of Aerial Duels Win Perentage (Min. 270 mins)
select d.Players,Squad,Aerial_Duels_Won_Percentage
from defensive_stats d inner join appearances a
on d.Players = a.Player
where Minutes_Played > 270 and a.Position like '%DF%'
order by 3 desc
limit 3;

## Top 3 Defenders with Highest Passing Accuracy (Min. 270 mins)
select d.Players,Squad,Pass_Completion_Percentage
from defensive_stats d inner join appearances a
on d.Players = a.Player inner join passing_stats p on d.Players=p.Players
where Minutes_Played > 270 and a.Position like '%DF%'
order by 3 desc
limit 3;

## Player who Commited most errors (Min. 270 mins)
select d.Players,Squad,Errors
from defensive_stats d inner join appearances a
on d.Players = a.Player
where Minutes_Played > 270
order by 3 desc
limit 3;

## Top 3 defenders with Most no of Assists (Min. 270 mins)
select Player,Squad,Assists
from passing_stats p inner join appearances a
on p.Players = a.Player
where Minutes_Played > 270 and a.Position like '%DF%'
order by Assists desc
limit 3;

## Top 5 Players Dispossed Most (Min. 270 mins)
select Player,Squad,Dispossesed
from possesional_stats p inner join appearances a
on p.Players = a.Player
where Minutes_Played > 270
order by 3 desc
limit 5;

## Top 3 Midfielders Dispossed Most (Min. 270 mins)
select Player,Squad,Dispossesed
from possesional_stats p inner join appearances a
on p.Players = a.Player
where Minutes_Played > 270 and Position like "%MF%" 
order by 3 desc
limit 3;

## Top 3 Defenders Dispossed Most (Min. 270 mins)
select Player,Squad,Dispossesed
from possesional_stats p inner join appearances a
on p.Players = a.Player
where Minutes_Played > 270 and Position like "%DF%" 
order by 3 desc
limit 3;

## Top Scorers form Every Country
select * from(
select a.player,Squad,Goals,Rank() Over(Partition By Squad Order By goals DESC, p.Assists desc,Minutes_Played asc) as Rnk
from goal_scoring_stats g inner join appearances a
on g.player=a.player inner join passing_stats p on a.player = p.Players) X
where X.Rnk in (1)
order by Goals desc;