                ---Cryptocurrency Exchange---
 ---Let’s start by checking out the whole transactions table
 select * 
 from transactions;
 --- The money_in column records the amount (in USD) the user bought.
select sum(money_in)
from transactions;
 ---The money_out column records the amount (in USD) the user sold
select sum(money_out)
from transactions;
 ---How many money_in transactions are in this table?
select count(money_in)
from transactions;
 ---How many money_in transactions are in this table where ‘BIT’ is the currency?
select count(money_in)
from transactions
where currency = 'BIT';
 ---What was the largest transaction in this whole table? Was it money_in or money_out?
select max(money_in)
from transactions;

select max(money_out)
from transactions;
 ---What is the average money_in in the table for the currency Ethereum (‘ETH’)?
select avg(money_in)
from transactions
where currency = 'ETH';
 ---Let’s build a ledger for the different dates. Select date, average money_in, and average money_out from the table.And group everything by date
select date,
avg(money_in),
avg(money_out)
from transactions
group by date;
 ---To make the previous query easier to read, round the averages to 2 decimal places. Give the column aliases using AS for readability.
select date as 'Date',
round(avg(money_in), 2) as 'Average money in',
round(avg(money_out), 2) as 'Average money out'
from transactions
group by date; 
