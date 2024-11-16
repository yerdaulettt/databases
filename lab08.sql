-- Task 1
create database lab8;

-- Task 2
''' create table salesman (
	salesman_id integer primary key,
	name varchar(50),
	city varchar(50),
	commission real
);

create table customers (
	customer_id integer primary key,
	cust_name varchar(50),
	city varchar(50),
	grade integer,
	salesman_id integer references salesman
);

create table orders (
	ord_no integer primary key,
	purch_amt real,
	ord_date date,
	customer_id integer references customers,
	salesman_id integer references salesman
);

insert into salesman values
(5001, 'James Hoog', 'New York', 0.15),
(5002, 'Nail Knite', 'Paris', 0.13),
(5005, 'Pit Alex', 'London', 0.11),
(5006, 'Mc Lyon', 'Paris', 0.14),
(5003, 'Lauson Hen', default, 0.12),
(5007, 'Paul Adam', 'Rome', 0.13);

insert into customers values
(3002, 'Nick Rimando', 'New York', 100, 5001),
(3005, 'Graham Zusi', 'California', 200, 5002),
(3001, 'Brad Guzan', 'London', default, 5005),
(3004, 'Fabian Johns', 'Paris', 300, 5006),
(3007, 'Brad Davis', 'New York', 200, 5001),
(3009, 'Geoff Camero', 'Berlin', 100, 5003),
(3008, 'Julian Green', 'London', 300, 5002);

insert into orders values
(70001, 150.5, '2012-10-05', 3005, 5002),
(70009, 270.65, '2012-09-10', 3001, 5005),
(70002, 650.26, '2012-10-05', 3002, 5001),
(70004, 110.5, '2012-08-17', 3009, 5003),
(70007, 948.5, '2012-09-10', 3005, 5002),
(70005, 2400.6, '2012-07-27', 3007, 5001),
(70008, 5760, '2012-09-10', 3002, 5001); '''

-- Task 3
create role junior_dev login;

-- Task 4
create view new_york_salesmans as
select * from salesman where city = 'New York';

-- Task 5
create view show_order_details as
select ord_no, cust_name, name as salesman_name from
orders o join customers c on o.customer_id = c.customer_id
join salesman s on o.salesman_id = s.salesman_id;

grant all privileges on show_order_details to junior_dev;

-- Task 6
create view highest_grade_customers as
select * from customers where grade = (select max(grade) from customers);

grant select on highest_grade_customers to junior_dev;

-- Task 7
create view salesmans_count_in_cities as
select city, count(*) from salesman group by city;

-- Task 8
create view salesman_with_multiple_customers as
select salesman_id, name, s.city from salesman s join customers using (salesman_id)
group by salesman_id having count(*) > 1;

-- Task 9
create role intern;
grant junior_dev to intern;