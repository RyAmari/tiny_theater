# tiny_theater

create table customer(
- primary key id for customer
- first name
- last name
- phone number (can be null)
- address (can be null)
- seat (maybe assign seat id instead of seat directly through foreign key)
- show(assign show_id from show table through foreign key)

create table theater(
- primary key id for theater
- `name` column
- theater address/location column not null
- theater email column not null
- theater phone number not null
- define seat column (seat may need to be its own table, unsure how to implement this though so maybe not)

create table show(
- primary key id for show
- define title column (name)
- define date column
- define ticket price column


customer table references
theater (theater id)
theater(seat_id)
show (show_id)
customer can see many shows
customer can go to many theaters


theater table references
theater can have many customers
theater can have many shows


"show" table references
show can have many viewers(customers)
show can be shown at many theaters
