drop database if exists tiny_theater;
create database tiny_theater;
use tiny_theater;

create table customer(
customer_id int primary key auto_increment,
first_name varchar(20) not null,
last_name varchar(20) not null,
phone_number varchar(25) null,
address varchar(40) null,
email varchar(30) not null);

create table theater(
theater_id int primary key auto_increment,
`name` varchar(40) not null,
address varchar(50) not null,
email varchar(30) not null,
phone_number varchar(25) not null);

create table shows(
show_id int primary key auto_increment,
title varchar(30) not null);

create table performance(
performance_id int primary key auto_increment,
performance_date date not null,
ticket_price double not null,
show_id int not null,
theater_id int not null,
constraint fk_performance_show_id
foreign key (show_id)
references shows(show_id),
constraint fk_performance_theater_id
foreign key (theater_id)
references theater(theater_id));

create table ticket(
ticket_id int primary key auto_increment,
performance_id int not null,
seat varchar(10) not null,
customer_id int not null,
theater_id int not null,
constraint fk_ticket_performance_id
foreign key (performance_id)
references performance(performance_id),
constraint fk_ticket_customer_id
foreign key (customer_id)
references customer(customer_id),
constraint fk_ticket_theater_id
foreign key (theater_id)
references theater(theater_id));

