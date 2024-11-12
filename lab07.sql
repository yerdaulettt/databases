-- Task 1
create index countries_name_index on countries (name);

-- Task 2
create index employees_name_surname_index on employees (name, surname);

-- Task 3
create unique index employees_salary_index_unique on employees (salary);

-- Task 4
create index employees_substring_name_index on employees (substring(name from 1 for 4));

-- Task 5
create index employees_salary_index on employees (salary);
create index departments_budget_index on departments (budget);