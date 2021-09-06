-- 1
-- What are the column names?

select *
from transaction_data
limit 10;
-- 2
-- Find the full_names and emails
-- of the transactions listing 20252 as the zip code.
select full_name, email, zip
from transaction_data
where zip = 20252;

-- 3
-- Use a query to find the names 
-- and emails associated with these transactions.
select full_name, email
from transaction_data
where full_name = 'Art Vandelay'
or full_name like '% der %';

-- 4
-- Find the ip_addresses and emails listed with these transactions.
select ip_address, email
from transaction_data
where ip_address like '10.%';

-- 5
-- Find the emails in transaction_data with
-- ‘temp_email.com’ as a domain.
select email
from transaction_data
where email like '%temp_email.com';

-- 6
-- The finance department is looking for a specific transaction. 
-- They know that the transaction occurred from an ip address starting 
-- with ‘120.’ and their full name starts with ‘John’.
select *
from transaction_data
where full_name like 'John%'
  and ip_address like '120.%';
-- Can you find the transaction?


-- 7
-- Challenge
-- Return only those customers residing in GA. Use the list of ZIP CODE prefixes
-- (https://en.wikipedia.org/wiki/List_of_ZIP_Code_prefixes)
-- to determine the best query for zip codes belonging to Georgia(GA).

select *
from transaction_data
where zip like '30%' and '31%'


