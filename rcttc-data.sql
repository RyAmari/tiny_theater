use tiny_theater;

insert into customer(
first_name, last_name, phone_number, address, email)
select distinct 
`rcttc-data`.customer_first,
`rcttc-data`.customer_last,
`rcttc-data`.customer_phone,
`rcttc-data`.customer_address,
`rcttc-data`.customer_email
from `rcttc-data`;

select * from customer;

insert into theater(
`name`, address, email, phone_number)
select distinct
`rcttc-data`.theater,
`rcttc-data`.theater_address,
`rcttc-data`.theater_email,
`rcttc-data`.theater_phone
from `rcttc-data`;

select * from theater;

insert into shows(
title)
select distinct 
`rcttc-data`.`show`
from `rcttc-data`;

select * from shows;

insert into performance(
performance_date, ticket_price, show_id, theater_id)
select distinct
`rcttc-data`.`date`,
`rcttc-data`.ticket_price,
shows.show_id,
theater.theater_id
from `rcttc-data`
inner join shows on `rcttc-data`.`show` = shows.title
inner join theater on `rcttc-data`.theater = theater.`name`;

select * from performance;

insert into ticket(
performance_id, seat, customer_id, theater_id)
select distinct
p.performance_id,
`rcttc-data`.seat,
c.customer_id,
t.theater_id
from performance p
inner join shows s on p.show_id = s.show_id
inner join `rcttc-data` on `rcttc-data`.`show` = s.title
inner join customer c on`rcttc-data`.customer_last = c.last_name
inner join theater t on `rcttc-data`.theater = t.`name`;

select * from ticket;

update performance set 
ticket_price = 22.25
where performance_date = "2021-03-01" and show_id = 4;

select * from performance;

update customer set
phone_number = "1-801-EAT-CAKE"
where customer_id = 48;

select * from customer;

set sql_safe_updates=0;
delete from ticket
where customer_id = 65;

delete from customer 
where customer_id = 65;

set sql_safe_updates = 1;

select * from ticket
where theater_id = 1
order by performance_id desc;
