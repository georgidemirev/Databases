USE db
GO

--All the operations shown bellow are for one warehouse, because the idea is not to mess warehouses-----------------------------------------------------
--I am performing one usual operation in a wearhouse 

--show all the orders to make sure the trigger is working 
select * from "orders";
-- here we can see that the milisecond are different so the trigger is working


--show not finished orders ordered by due date in order to start working on that order
select
	orders.id as order_id
  , orders.customer_id
  , orders.is_finished
  , orders.due_date
  , customers.warehouse_id
  , customers."name" as customer_name
from
	orders
	join
		customers
		on
			orders.customer_id = customers.id
where
	is_finished                = 0
	and due_date     IS NOT NULL
	and customers.warehouse_id = 1
order by
	due_date asc
;


--show the list of items needed for the most urgent order
select *
from
	order_items
where
	order_id = 2
;
-- here order_id = 2 is the most urgent order


--see if there is enough items to fulfil the orders needs
select
	ordered_items.id
  , ordered_items.warehouse_id
  , ordered_items."name"
  , ordered_items."description"
  , ordered_items.total_quantity as total_reserved_quantity
  , p.quantity                   as needed_quantity
  , items.quantity               as total_item_quantity
from
	ordered_items
	join
		(
			select *
			from
				order_items
			where
				order_id = 2
		)
		as p
		on
			ordered_items.id = p.item_id
	join
		items
		on
			p.item_id = items.id
;
-- here order_id = 2 is the most urgent order
-- and from the difference between total_item_quantity and reserved_quantity we can
-- see if there is enough quantity for the order for every material
-- In this case it is seen that not all needed items are available
-- In future versions of the database-> the warehouse should be able to make orders to another warehouse to add more items in stock
-- In this version items are added when we see that we need them from this query


--show free employees ordered by name (and then by id)
select *
from
	free_employees
where
	warehouse_id = 1
order by
	"name"
  , id asc
;

--assign an employee to the most urgent order
update
	employees
set order_id = 2
where
	employees.id               = 1
	and employees.warehouse_id = 1
;

-- here order_id = 2 is the most urgent order
--show free employees again to make sure the employee is not available now because he is working on the order
select *
from
	free_employees
where
	warehouse_id = 1
order by
	"name"
  , id asc
;

--show the employees again to make sure everything is okay and the employee is assigned to the order
select *
from
	employees
;

--show employees and their assigned order
select
	employees.id as employee_id
  , employees."name"
  , orders.id as order_id
  , employees.warehouse_id
from
	employees
	join
		orders
		on
			employees.order_id = orders.id
where
	employees.warehouse_id = 1
;
