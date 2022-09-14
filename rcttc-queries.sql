use tiny_theater;
-- Find all performances in the last quarter of 2021 (Oct. 1, 2021 - Dec. 31 2021).
select 
performance_id,
show_id,
performance_date
from performance
where performance_date between '2021-10-01' and '2021-12-31';

-- List customers without duplication.
select 
first_name,
customer_id
from customer;

-- Find the three cheapest shows.
select 
performance_id,
show_id,
ticket_price
from performance
order by ticket_price asc limit 3;

-- List customers and the show they're attending with no duplication.
select distinct
t.customer_id,
customer.first_name,
shows.title
from ticket t
inner join performance on t.performance_id = performance.performance_id
inner join customer on t.customer_id = customer.customer_id
inner join shows on performance.show_id = shows.show_id;

-- List customer, show, theater, and seat number in one query.
select distinct
t.customer_id,
customer.first_name,
t.seat,
shows.title,
theater.`name`
from ticket t
inner join performance on t.performance_id = performance.performance_id
inner join customer on t.customer_id = customer.customer_id
inner join shows on performance.show_id = shows.show_id
inner join theater on performance.theater_id = theater.theater_id;

-- Find customers without an address.
select *
from customer 
where address is null;

-- Recreate the spreadsheet data with a single query.
select distinct
t.customer_id,
customer.first_name,
customer.last_name,
customer.address,
customer.phone_number,
customer.email,
t.seat,
shows.title,
performance.ticket_price,
performance.performance_date,
theater.`name`,
theater.address
from ticket t
inner join performance on t.performance_id = performance.performance_id
inner join customer on t.customer_id = customer.customer_id
inner join shows on performance.show_id = shows.show_id
inner join theater on performance.theater_id = theater.theater_id;

-- Find all customers without '.com' in email address
select 
c.customer_id,
c.first_name,
c.last_name,
c.email
from customer c
where c.email not like '%.com';

-- Count total tickets purchased per customer.
select c.first_name, c.last_name, count(t.ticket_id)
from ticket t
inner join customer c on c.customer_id = t.customer_id
group by c.customer_id;


-- Calculate the total revenue per show based on tickets sold.
select p.show_id, s.title, sum(ticket_price)
from ticket t
inner join performance p on p.performance_id = t.performance_id
inner join shows s on s.show_id=p.show_id
group by s.show_id;


-- Calculate the total revenue per theater based on tickets sold.
select p.theater_id, th.`name`, sum(ticket_price)
from ticket t
inner join performance p on p.performance_id = t.performance_id
inner join theater th on th.theater_id=p.theater_id
group by th.theater_id;

-- Who is the biggest supporter of RCTTC? Who spent the most in 2021?
select t.customer_id, c.first_name, c.last_name, sum(ticket_price)
from ticket t
inner join performance p on p.performance_id = t.performance_id
inner join customer c on c.customer_id=t.customer_id
group by c.customer_id
order by sum(ticket_price) desc limit 1;
