                              ---Understanding the dataset---
 ---Let’s find the most popular Hacker News stories
 select title, score
 from hacker_news
 order by score desc
 limit 5;

 ---First, find the total score of all the stories
select sum(score)
from hacker_news;

 ---Find the individual users who have gotten combined scores of more than 200, and their combined scores.
select user, SUM(score)
from hacker_news
group by user
having sum(score) > 200
order by 2 desc;
 
 ---Add their scores together and divide it by the total sum
select (517 + 309 + 304 + 282) / 6366.0;

 ---How many times has each offending user posted a rickrolling video?
select user,
count(*)
from hacker_news
where url like '%watch?v=dQw4w9WgXcQ%'
group by 1
order by 2 desc;
                            ---Which sites feed Hacker News?---
---Hacker News stories are essentially links that take users to other websites.
---Which of these sites feed Hacker News the most:
---GitHub, Medium, or New York Times?
select case
   when url like '%github.com%' then 'GitHub'
   when url like '%medium.com%' then 'Medium'
   when url like '%nytimes.com%' then 'New York Times'
   else 'Other'
  end as 'Source'
from hacker_news;
 
 ---Add a column for the number of stories from each URL using COUNT()
select case
   when url like '%github.com%' then 'GitHub'
   when url like '%medium.com%' then 'Medium'
   when url like '%nytimes.com%' then 'New York Times'
   else 'Other'
  end as 'Source',
  count(*)
from hacker_news
group by 1;
                        ---What's the best time to post a story?---
--Before we get started, let’s run this query and take a look at the timestamp column
SELECT timestamp
FROM hacker_news
LIMIT 10;
 --- testing strftime
SELECT timestamp,
   strftime('%H', timestamp)
FROM hacker_news
GROUP BY 1
LIMIT 20;
 ---Okay, now we understand how strftime() works. Let’s write a query that returns three columns:

--The hours of the timestamp
SELECT strftime('%H', timestamp), 
--The average score for each hour
AVG(score),
--The count of stories for each hour    
COUNT(*)
FROM hacker_news
GROUP BY 1
ORDER BY 1;
--Round the average scores (ROUND()).
--Rename the columns to make it more readable (AS).
--Add a WHERE clause to filter out the NULL values in timestamp
SELECT strftime('%H', timestamp) AS 'Hour', 
ROUND(AVG(score), 1) AS 'Average Score',
COUNT(*) AS 'Number of Stories'
FROM hacker_news
WHERE timestamp IS NOT NULL
GROUP BY 1
ORDER BY 1;

 ---