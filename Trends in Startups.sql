---Getting started, take a look at the startups table, how many columns are there?
select *
from startups;

---Calculate the total number of companies in the table.
select count(name)
from startups;

---We want to know the total value of all companies in this table.
select sum(valuation)
from startups;

---What is the highest amount raised by a startup?
select max(raised)
from startups;

---What is the highest amount raised by a startup during 'Seed' stage?
select max(raised)
from startups
where stage = 'Seed';

---In what year was the oldest company on the list founded?
select min(founded)
from startups;

            ---Let's find out the valuations among different sectors---
---Return the average valuation.
select avg(valuation)
from startups;

---Return the average valuation, in each category.
select category, avg(valuation)
from startups
group by category;
---round up the averages by two decimals
select category, round(avg(valuation), 2)
from startups
group by category;
--- and order the list with highest averages to lowest
select category, round(avg(valuation), 2)
from startups
group by 1
order by 2 desc;

                    ---What are the most competitive markets?---
---First, return the name of each category with 
---the total number of companies that belong to it
select distinct category
from startups;

---Next, filter the result to only include categories that have more than three companies in them.
select category, count(*)
from startups
group by category
having count(*) > 3;

      ---Let's see if there's a difference in startups sizes among different locations---
---What is the average size of a startup in each location?
select location, avg(employees)
from startups
group by location;

---What is the average size of a startup in each location, with average sizes above 500?
select location, avg(employees)
from startups
group by location
having avg(employees) > 500;
