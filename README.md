# tiny_theater

create table customer(
- primary key id for customer
- first name
- last name
- phone number (can be null)
- address (can be null)

create table theater(
- primary key id for theater
- name column
- theater address/location column not null
- theater email column not null
- theater phone number not null

create table show(
- primary key id for show
- define title column (name)
- define ticket price column

create table performance(
- define theater_id column
- define date column
- define show_id column

create table reservation(
- customer_id
- show_id
- seat_id

create table seat(
- seat_id
- seat (Row/Column)
- theater_id

create table reservation_ticket(
- show_id
- quantity (tickets bought)

customer table references
theater (theater id)
theater(seat_id)
show (show_id) customer can see many shows customer can go to many theaters
theater table references theater can have many customers theater can have many shows

"show" table references show can have many viewers(customers) show can be shown at many theaters