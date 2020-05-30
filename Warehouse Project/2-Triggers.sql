CREATE TRIGGER dbo.TriggerCustomerUpdate
ON
	orders AFTER
INSERT
  ,
 UPDATE
	AS BEGIN
UPDATE
	dbo.orders
SET created_on = GETDATE()
FROM
	orders o
	JOIN
		inserted i
		ON
			o.id = i.id
WHERE
	i.created_on IS NULL
END
--Trigger to set created_on date for orders, every time when new order is persisted
------TRIGGERS------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
