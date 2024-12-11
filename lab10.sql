-- Task 1
begin transaction;
insert into orders values (53, 1, 101, now(), 2);
update books set quantity = quantity - 2 where book_id = 1;
commit;

-- Task 2
begin transaction;
alter table books add constraint quantity_check check (quantity > 0);
insert into orders values (55, 1, 102, now(), 100);
update books set quantity = quantity - 100 where book_id = 1;
commit;

-- Task 3
begin transaction isolation level read committed;
update books set price = 30 where book_id = 1;
commit;

-- Task 4
begin transaction;
update customers set email = 'someone@example.com' where customer_id = 101;
commit;