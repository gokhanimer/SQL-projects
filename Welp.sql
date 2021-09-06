                              --Welp--
--Let’s see what these tables contain by running the following commands
select * 
from places;

select *
from reviews;

--If each dollar sign ($) represents $10, how could you find all places that cost $20 or less?
select * 
from places
where price_point = '$'
or price_point = '$$';

--Write a query to do an INNER JOIN on the two tables to show all reviews for restaurants that have at least one review.
select * 
from places
inner join reviews
on places.id = reviews.place_id;

--Modify your previous query to select only the most important columns in order to display a log of reviews by selecting the following:
--From the places table: name, average_rating
--From the reviews table: username, rating, review_date, note
select places.name, places.average_rating, reviews.username, reviews.rating, reviews.review_date, reviews.note
from places
inner join reviews
on places.id = reviews.place_id;

--How are the results of this query different? Would this or the INNER JOIN be more useful for a log of reviews?
select places.name, places.average_rating, reviews.username, reviews.rating, reviews.review_date, reviews.note
from places 
left join reviews 
   on places.id = reviews.place_id;
--Write a query to find all the ids of places that currently do not have any reviews in our reviews table.
select places.id, places.name
from places 
left join reviews 
   on places.id = reviews.place_id
where reviews.place_id is not places.id;