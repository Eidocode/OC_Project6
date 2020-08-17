SELECT `order`.number AS "Num", user.lastname, user.firstname, contact.city,
	`order`.added_date AS "Date", pizza.name AS "Pizza", pizza.unit_price_ht AS "Un.Price", 
    item.quantity AS "Qty", (item.quantity * pizza.unit_price_ht) AS "Total.HT", state.order_state AS "State"
FROM item 
INNER JOIN `order` ON `order`.number = item.order_number 
INNER JOIN state ON state.id = `order`.state_id
INNER JOIN pizza ON pizza.id = item.pizza_id
INNER JOIN customer ON customer.id = `order`.customer_id
INNER JOIN user ON user.id = customer.user_id
INNER JOIN contact ON contact.id = customer.contact_id
ORDER BY `order`.number;