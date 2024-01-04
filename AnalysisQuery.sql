-- 1. What are the names of the players whose salary is greater than 100,000?

SELECT player_name, salary FROM Players WHERE salary > 100000

-- 2. What is the team name of the player with player_id = 3?

SELECT team_name FROM Teams AS T
JOIN Players AS P
ON T.team_id = P.team_id
WHERE player_id = 3

-- 3. What is the total number of players in each team?

SELECT team_name , COUNT(team_name) AS count FROM Teams AS T
JOIN Players AS P
ON T.team_id = P.team_id
GROUP BY team_name

-- 4. What is the team name and captain name of the team with team_id = 2?

SELECT T.team_id, team_name,captain_id,player_name, player_id FROM Teams AS T
JOIN Players AS P
ON T.team_id = P.team_id
WHERE T.team_id = 2 AND T.captain_id = P.player_id

-- 5. What are the player names and their roles in the team with team_id = 1?

SELECT player_name , role FROM Players
JOIN Teams
ON Players.team_id = Teams.team_id
WHERE Players.team_id = 1

-- 6. What are the team names and the number of matches they have won?

SELECT team_name, COUNT(team_id) as Win FROM Teams
JOIN Matches
ON Teams.team_id = Matches.winner_id
GROUP BY team_id, team_name

-- 7. What is the average salary of players in the teams with country 'USA'?

SELECT AVG(salary) FROM Players
JOIN Teams
ON Players.team_id = Teams.team_id
WHERE country = 'USA'

-- 8. Which team won the most matches?

SELECT TOP 1 team_name, COUNT(team_id) as Win FROM Teams
JOIN Matches
ON Teams.team_id = Matches.winner_id
GROUP BY team_id, team_name
ORDER BY Win DESC

-- 9. What are the team names and the number of players in each team whose salary is greater than 100,000?

SELECT team_name, COUNT(team_name) FROM Players AS P
JOIN Teams AS T
ON T.team_id = P.team_id
WHERE salary > 100000
GROUP BY team_name

-- 10. What is the date and the score of the match with match_id = 3?

SELECT match_date ,score_team1, score_team2 FROM Matches 
WHERE match_id = 3