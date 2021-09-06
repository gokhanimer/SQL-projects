                                      --Gaming Data with Twitch--
-- 1 Start by getting a feel for the stream table and the chat table.
--Select the first 20 rows from each of the two tables.
--What are the column names?
SELECT *
FROM stream
LIMIT 20;

SELECT *
FROM chat
LIMIT 20;


-- 2 What are the unique games in the stream table?
SELECT DISTINCT game
FROM stream;

-- 3 What are the unique channels in the stream table?
SELECT DISTINCT channel
FROM stream;

-- 4 What are the most popular games in the stream table?
SELECT game, COUNT(*)
FROM stream
GROUP BY game
ORDER BY COUNT(*) DESC;

-- 5 These are some big numbers from the game League of Legends (also known as LoL).
-- Where are these LoL stream viewers located?
SELECT country, COUNT(*)
FROM stream
WHERE game = 'League of Legends'
GROUP BY game
ORDER BY COUNT(*) DESC;

-- 6 Create a list of players and their number of streamers.
SELECT player, COUNT(*)
FROM stream
GROUP BY game
ORDER BY COUNT(*) DESC;

-- 7 Create a new column named genre for each of the games.
-- Group the games into their genres: Multiplayer Online Battle Arena (MOBA), First Person Shooter (FPS), Survival, and Other.
SELECT game,
 CASE
  WHEN game = 'Dota 2'
      THEN 'MOBA'
  WHEN game = 'League of Legends' 
      THEN 'MOBA'
  WHEN game = 'Heroes of the Storm'
      THEN 'MOBA'
    WHEN game = 'Counter-Strike: Global Offensive'
      THEN 'FPS'
    WHEN game = 'DayZ'
      THEN 'Survival'
    WHEN game = 'ARK: Survival Evolved'
      THEN 'Survival'
  ELSE 'Other'
  END AS 'genre',
  COUNT(*)
FROM stream
GROUP BY 1
ORDER BY 3 DESC;

-- 8 How does our row "time" look like?
SELECT time
FROM stream
LIMIT 10;

-- 9 Formatting the time
SELECT time,
   strftime('%S', time)
FROM stream
GROUP BY 1
LIMIT 20;

-- 10 Okay, now we understand how strftime() works. Let’s write a query that returns two columns:
          --The hours of the time column
          --The view count for each hour
SELECT strftime('%H', time),
   COUNT(*)
FROM stream
WHERE country = 'US'
GROUP BY 1;

-- 11 The stream table and the chat table share a column: device_id.
 --Let’s join the two tables on that column.
SELECT *
FROM stream
JOIN chat
  ON stream.device_id = chat.device_id;



