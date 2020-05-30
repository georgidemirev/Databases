USE master
GO
if exists
(
	select *
	from
		sysdatabases
	where
		name='db'
)
DROP DATABASE db
GO
CREATE DATABASE db
GO
USE db
GO
CREATE TABLE warehouses
	(
		id         int NOT NULL IDENTITY
	  , "name"     char(30) NOT NULL
	  , "location" varchar(100) NOT NULL
	)
;

CREATE TABLE customers
	(
		id           int NOT NULL IDENTITY
	  , warehouse_id int NOT NULL
	  , "name"       char(30) NOT NULL
	)
;

CREATE TABLE "orders"
	(
		id          int NOT NULL IDENTITY
	  , customer_id int NOT NULL
	  , is_finished bit NOT NULL
	  , due_date datetime2(0)
	  , created_on datetime
	)
;

CREATE TABLE items
	(
		id            int NOT NULL IDENTITY
	  , warehouse_id  int NOT NULL
	  , "name"        char(30) NOT NULL
	  , "description" char(255)
	  , quantity      int NOT NULL
	)
;

CREATE TABLE order_items
	(
		id       int NOT NULL IDENTITY
	  , item_id  int NOT NULL
	  , order_id int NOT NULL
	  , quantity int NOT NULL
	)
;

CREATE TABLE employees
	(
		id           int NOT NULL IDENTITY
	  , warehouse_id int NOT NULL
	  , order_id     int
	  , "name"       char(30) NOT NULL
	  ,
	 )
;

------PRIMARY_KEYS------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
ALTER TABLE warehouses ADD CONSTRAINT PK_warehouses PRIMARY KEY(id)
;

ALTER TABLE customers ADD CONSTRAINT PK_customers PRIMARY KEY(id)
;

ALTER TABLE "orders" ADD CONSTRAINT PK_orders PRIMARY KEY (id)
;

ALTER TABLE order_items ADD CONSTRAINT PK_order_items PRIMARY KEY(id)
;

ALTER TABLE items ADD CONSTRAINT PK_items PRIMARY KEY(id)
;

ALTER TABLE employees ADD CONSTRAINT PK_employees PRIMARY KEY(id)
;

------FEREIGN_KEYS------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--one to many
ALTER TABLE customers ADD CONSTRAINT FK_customers_warehouses FOREIGN KEY(warehouse_id) REFERENCES warehouses(id)
;

ALTER TABLE "orders" ADD CONSTRAINT FK_orders_customers FOREIGN KEY(customer_id) REFERENCES customers(id)
;

ALTER TABLE order_items ADD CONSTRAINT FK_order_items_orders FOREIGN KEY(order_id) REFERENCES "orders"(id)
;

ALTER TABLE items ADD CONSTRAINT FK_items_warehouses FOREIGN KEY(warehouse_id) REFERENCES warehouses(id)
;

ALTER TABLE employees ADD CONSTRAINT FK_employees_warehouses FOREIGN KEY(warehouse_id) REFERENCES warehouses(id)
;

ALTER TABLE employees ADD CONSTRAINT FK_employees_orders FOREIGN KEY(order_id) REFERENCES "orders"(id)
;

--one to one
ALTER TABLE order_items ADD CONSTRAINT FK_order_items_items FOREIGN KEY(item_id) REFERENCES items(id)
;