                    --Multiple Tables with Reddit--
--Let’s start by examining the three tables.
--Write queries to select the rows from each table. Because some of the tables have many rows, select just the first 10 rows from each.
SELECT * FROM users
limit 10;

SELECT * FROM posts
limit 10;

SELECT * FROM subreddits
limit 10;

--Write a query to count how many different subreddits there are.
select count(*)
from subreddits;

---Write a few more queries to figure out the following information:
--What user has the highest score?
select max(score), username
from users;
--What post has the highest score?
select max(score), title
from posts;
--What are the top 5 subreddits with the highest subscriber_count?
select *
from subreddits
order by subscriber_count
limit 5;

--Now you need to find out which subreddits have the most popular posts. We’ll say that a post is popular if it has a score of at least 5000. We’ll do this using a WITH and a JOIN.
--First, you’ll need to create the temporary table that we’ll nest in the WITH clause by writing a query to select all the posts that have a score of at least 5000.
--Next, place the previous query within a WITH clause, and alias this table as popular_posts.
--Finally, utilize an INNER JOIN to join this table with the subreddits table, with subreddits as the left table. Select the subreddit name, the title and score of each post, and order the results by each popular post’s score in descending order.
with popular_posts as (
  select *
  from posts
  where score >= 5000
)
select subreddits.name, popular_posts.title, popular_posts.score
from subreddits
inner join popular_posts
on subreddits.id = popular_posts.subreddit_id
order by popular_posts.score desc;

--Next, you need to find out the highest scoring post for each subreddit.
--Do this by using an INNER JOIN, with posts as the left table.

select posts.title, subreddits.name, max(posts.score)
from posts
inner join subreddits
on posts.subreddit_id = subreddits.id
group by subreddits.id;

--Finally, you need to write a query to calculate the average score of all the posts for each subreddit.
--Consider utilizing a JOIN, AVG, and GROUP BY to accomplish this, with the subreddits table as the left table.

select subreddits.name, avg(posts.score)
from subreddits
inner join posts
group by subreddits.name
order by 2 desc;