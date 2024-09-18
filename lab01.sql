-- Task 1
create database lab1;

-- Task 2
create table users (
	id serial,
	firstname varchar(50),
	lastname varchar(50)
);

-- Task 3
alter table users add column isadmin integer;

-- Task 4
alter table users alter column isadmin set data type boolean using isadmin::boolean;

-- Task 5
alter table users alter column isadmin set default false;

-- Task 6
alter table users add primary key (id);

-- Task 7
create table tasks (
	id serial,
	name varchar(50),
	user_id integer
);

-- Task 8
drop table tasks;

-- Task 9
drop database lab1;