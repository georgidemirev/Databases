USE db
GO

----Warehouses------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ 
insert into warehouses ("name", "location") values('second warehous','location 2');
insert into warehouses ("name", "location") values('first warehous','location 1');
------Customers------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ 
insert into customers (warehouse_id, "name") values('1','Ivan');
insert into customers (warehouse_id, "name") values('1','Georgi');
insert into customers (warehouse_id, "name") values('1','Ivan');
insert into customers (warehouse_id, "name") values('2','Stoqn');
------Orders------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ 
insert into "orders" (customer_id, is_finished, due_date) values('2','0','2020-09-15 00:00:00');
insert into "orders" (customer_id, is_finished, due_date) values('2','0','2020-07-15 00:00:00');
insert into "orders" (customer_id, is_finished) values('1','0');
insert into "orders" (customer_id, is_finished, due_date) values('2','1','2020-08-05 00:00:00');
insert into "orders" (customer_id, is_finished, due_date) values('3','0','2020-08-12 00:00:00');
insert into "orders" (customer_id, is_finished, due_date) values('1','1','2020-11-15 00:00:00');
insert into "orders" (customer_id, is_finished, due_date) values('1','1','2020-11-15 00:00:00');
insert into "orders" (customer_id, is_finished, due_date) values('4','0','2020-08-01 00:00:00');
insert into "orders" (customer_id, is_finished, due_date) values('4','0','2020-12-15 00:00:00');
insert into "orders" (customer_id, is_finished) values('4','1');

------Items------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ 
insert into items (warehouse_id, "name", "description", quantity) values('1','pc','good pc','1111');
insert into items (warehouse_id, "name", "description", quantity) values('1','pc','not good pc','2222');
insert into items (warehouse_id, "name", "description", quantity) values('1','mouse','good mouse','3333');
insert into items (warehouse_id, "name", "description", quantity) values('1','pc','very good pc','4444');
insert into items (warehouse_id, "name", "description", quantity) values('1','pc','bad pc','5555');
insert into items (warehouse_id, "name", "description", quantity) values('1','mouse','good mouse','23525');
insert into items (warehouse_id, "name", "description", quantity) values('1','mouse','very good mouse','3525235');
insert into items (warehouse_id, "name", "description", quantity) values('1','mouse','not good mouse','22266');
insert into items (warehouse_id, "name", "description", quantity) values('2','mouse','good mouse','6666');
insert into items (warehouse_id, "name", "description", quantity) values('2','pc','not good pc','7777');


------Order_items------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ 
insert into order_items (item_id, order_id, quantity) values('1','2','200');
insert into order_items (item_id, order_id, quantity) values('2','2','444');
insert into order_items (item_id, order_id, quantity) values('3','2','333');
insert into order_items (item_id, order_id, quantity) values('4','3','200');
insert into order_items (item_id, order_id, quantity) values('5','3','200');
insert into order_items (item_id, order_id, quantity) values('6','2','200');
insert into order_items (item_id, order_id, quantity) values('7','3','200');
insert into order_items (item_id, order_id, quantity) values('1','7','333');
insert into order_items (item_id, order_id, quantity) values('2','7','2700');
insert into order_items (item_id, order_id, quantity) values('3','7','789');


  ------Employees------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ 
insert into employees(warehouse_id, "name") values('1','Gosho');
insert into employees(warehouse_id, "name") values('1','Pesho');
insert into employees(warehouse_id, order_id, "name") values('1','1','Mitko');
insert into employees(warehouse_id, order_id, "name") values('1','1','Gosho');
insert into employees(warehouse_id, order_id, "name") values('1','2','Pesho');
insert into employees(warehouse_id, "name") values('1','Stefan');
insert into employees(warehouse_id, order_id, "name") values('2','2','Stoqn');
insert into employees(warehouse_id, order_id, "name") values('2','3','Ceco');
insert into employees(warehouse_id, order_id, "name") values('2','4','Boiko');
insert into employees(warehouse_id, "name") values('2','Liuben');
