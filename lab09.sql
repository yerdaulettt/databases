-- Task 1
create function increase_value(value integer) returns integer as
$$
begin
	return value + 10;
end;
$$
language plpgsql;

-- Task 2
create or replace function compare_numbers(a integer, b integer, out result varchar(7)) as
$$
begin
	if a > b then result = 'Greater';
	elsif a < b then result = 'Lesser';
	else result = 'Equal';
	end if;
end;
$$
language plpgsql;

-- Task 3
drop function if exists number_series;
create function number_series(n integer) returns integer[] as
$$
declare
	result integer[];
begin
	for i in 1..n loop
		result[i] = i;
	end loop;
	return result;
end;
$$
language plpgsql;

-- Task 4
create function find_employee(employee_name varchar(50))
returns table (
	eid integer,
	ename varchar(50),
	esurname varchar(50),
	esalary real
) as
$$
begin
	return query
	select * from employees where name = employee_name;
end;
$$
language plpgsql;

-- Task 5
create function list_products(category_name varchar(50))
returns table (
	pid integer,
	pname varchar(100),
	pquantity integer,
	pprice real,
	pcategory varchar(50)
) as
$$
begin
	return query
	select * from products where category = category_name;
end;
$$
language plpgsql;

-- Task 6
create function calculate_bonus(eid integer) returns real as
$$
declare
	total real;
begin
	select bonus into total from employees where id = eid;
	return total + 150;
end;
$$
language plpgsql;

create function update_salary(eid integer) returns void as
$$
begin
	update employees set salary = salary + calculate_bonus(eid) where id = eid;
	update employees set bonus = 0 where id = eid;
end;
$$
language plpgsql;

-- Task 7
create function complex_calculation(a integer, a1 integer, b varchar(50), b1 varchar(50)) returns varchar(1000) as
$$
<<main>>
declare
	result1 integer;
	result2 varchar(1000);
begin
	<<intcalcs>>
	begin
		result1 = a + a1;
	end intcalcs;
	
	<<varcalcs>>
	begin
		result2 = b || b1;
	end varcalcs;
	return result1 || ' ' || result2;
end main;
$$
language plpgsql;