-- Task 1
create database lab2;

-- Task 2
create table countries (
	country_id serial primary key,
	country_name varchar(50),
	region_id integer,
	population integer
);

-- Task 3
insert into countries values (default, 'Palau', 19, 18055);

-- Task 4
insert into countries (country_name) values ('Japan');

-- Task 5
insert into countries (region_id) values (null);

-- Task 6
insert into countries (country_name, region_id, population) values
('Italy', 14, 54000000),
('Spain', 15, 78000000),
('France', 11, 89000000);

-- Task 7
alter table countries alter column country_name set default 'Kazakhstan';

-- Task 8
insert into countries (country_name) values (default);

-- Task 9
insert into countries default values;

-- Task 10
create table countries_new (
	like countries including all
);

-- Task 11
insert into countries_new select * from countries;

-- Task 12
update countries_new set region_id=1 where region_id is null;

-- Task 13
update countries_new set population=population * 1.1 returning country_name, population as "New Population";

-- Task 14
delete from countries where population < 100000;

-- Task 15
delete from countries_new using countries where countries_new.country_id=countries.country_id returning *;

-- Task 16
delete from countries returning *;