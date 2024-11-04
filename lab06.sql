-- Task 1
create database lab6;

-- Task 2
'''
create table locations (
	location_id serial primary key,
	street_address varchar(25),
	postal_code varchar(12),
	city varchar(30),
	state_province varchar(12)
);

create table departments (
	department_id serial primary key,
	department_name varchar(50) unique,
	budget integer,
	location_id integer references locations
);

create table employees (
	employee_id serial primary key,
	first_name varchar(50),
	last_name varchar(50),
	email varchar(50),
	phone_number varchar(20),
	salary integer,
	department_id integer references departments
);

insert into locations(street_address, postal_code, city, state_province) values
('Kazybek bi, 100', 05000, 'Almaty', 02),
('Akhmet Baitursynuly, 19', 01000, 'Astana', 01),
('Abai, 67', 07050, 'Shymkent', 13);

insert into departments(department_name, budget, location_id) values
('IT', 5700, 1),
('Sales', 10000, 2),
('Marketing', 4000, 1),
('Logistics', 2450, 3),
('B2B', 9000, 2);

insert into employees(first_name, last_name, email, phone_number, salary, department_id) values
('Azamat', 'Kasymuly', 'azeke@mail.com', 87779998989, 500, 3),
('Maksat', 'Yerzhanuly', 'make@mail.com', 87009998989, 550, 3),
('Murat', 'Alimuly', 'mura@mail.com', 87770008989, 300, 4),
('Aizere', 'Azatkyzy', 'aiza@mail.com', 87470009999, 700, 1),
('Aya', 'Jankyzy', 'aya@mail.com', 87750908989, 700, 1),
('Akj', 'asd', 'aasdsda@mail.com', 87755555589, 300, 2),
('Kj', 'jfjf', 'baaaa@mail.com', 87777777777, 300, 2),
('kald', 'dkdkd', 'klkl@mail.com', 87776667777, 300, 5),
('SAd', 'asdasd', 'juju@mail.com', 87478901111, 300, 5); '''

-- Task 3
select e.first_name, e.last_name, d.department_id, d.department_name from
employees e cross join departments d where e.department_id = d.department_id;

-- Task 4
select e.first_name, e.last_name, d.department_id, d.department_name from
employees e join departments d on employees.department_id = departments.department_id;

-- Task 5
select e.first_name, e.last_name, d.department_id, d.department_name from
employees e join departments d on employees.department_id = departments.department_id
where departments.department_id = 1 or departments.department_id = 4;

-- Task 6
select e.first_name, e.last_name, d.department_name, l.city, l.state_province from
employees e join departments d on e.department_id = d.department_id
join locations l on d.location_id = l.location_id;

-- Task 7
select * from departments left outer join employees using (department_id);

-- Task 8
select e.first_name, e.last_name, e.department_id, d.department_name from
departments d right outer join employees e on d.department_id = e.department_id;