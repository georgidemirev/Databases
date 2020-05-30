CREATE VIEW dbo.free_employees AS
SELECT *
FROM
	employees
WHERE
	employees.order_id IS NULL
;

go
CREATE VIEW dbo.ordered_items AS
SELECT
	i.id
  , i.warehouse_id
  , i."name"
  , i."description"
  , p.total_quantity
FROM
	items AS i
	INNER JOIN
		(
			SELECT
				item_id
			  , SUM(quantity) total_quantity
			FROM
				order_items
			GROUP BY
				item_id
		)
		AS p
		ON
			i.id = p.item_id
;

------VIEWS------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--all free employees
--view for listing all items, that are already booked for orders;
------INDEXES------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--I have not added indexes, because there is not need for this complexity of the database.
--If in future version of the database i have for example a need for second id with different purpose,
--I will make this column indexable