                        ---Pre-Gaming for Aggregates---
---Start by getting a feel for the met table:
 select *
 from met
 limit 10;

---How many pieces are in the American Decorative Art collection?
 select count(*)
 from met;

---Count the number of pieces where the category includes ‘celery’.
select count(*)
from met
where category like '%celery%';

---Find the title and medium of the oldest piece(s) in the collection.
select min(date)
FROM met;
---
select date, title, medium
from met
where date like '%1600%';

---Find the top 10 countries with the most pieces in the collection.
select country, count(*)
from met
group by country
order by count(*) desc
limit 10;

---Find the categories HAVING more than 100 pieces.
select category, count(*)
from met
group by 1
having count(*) > 100;

--Count the number of pieces where the medium contains ‘gold’ or ‘silver’.
--And sort in descending order.
select medium, count(*)
from met
where medium like '%gold%'
  or medium like '%silver%'
group by 1
order by 2 desc;