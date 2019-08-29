/* Maynor Alexander Moreno
-- COMP 269-801RL
-- CH 6 HW
-- Due 10.23.17 */

-- Question 1 - TESTED
SELECT COUNT(order_id) AS order_count, SUM(tax_amount) AS tax_total
FROM ORDERS;

-- Question 2 - TESTED

SELECT c.category_name AS category_name, COUNT(p.product_id) AS product_count, MAX(p.list_price) AS most_expensive_product
FROM Categories c JOIN Products p
	ON c.category_id = p.category_id
GROUP BY c.category_name -- without this, it will only return the item with the max list price, 1 row
ORDER BY COUNT(p.product_id) DESC;

-- Question 3 - TESTED
SELECT c.email_address AS email_address, SUM(o.item_price * o.quantity) AS item_price_total, SUM(o.discount_amount * o.quantity) AS discount_amount_total
FROM Customers c JOIN Orders ord
	ON c.customer_id = ord.customer_id
		JOIN Order_Items o
			ON ord.order_id = o.order_id
GROUP BY c.email_address
ORDER BY SUM(o.item_price * o.quantity) DESC;

-- Question 4 - TESTED
SELECT c.email_address AS email_address, COUNT(o.order_id) AS order_count, SUM((o.item_price - o.discount_amount) * quantity) AS order_total
FROM Customers c JOIN Orders ord
	ON c.customer_id = ord.customer_id
		JOIN Order_Items o
			ON ord.order_id = o.order_id
GROUP BY c.email_address
HAVING COUNT(o.order_id) > 1
ORDER BY SUM((o.item_price - o.discount_amount) * quantity) DESC;

-- Question 5 - TESTED
SELECT c.email_address AS email_address, COUNT(o.order_id) AS order_count, SUM((o.item_price - o.discount_amount) * quantity) AS order_total
FROM Customers c JOIN Orders ord
	ON c.customer_id = ord.customer_id
		JOIN Order_Items o
			ON ord.order_id = o.order_id
WHERE o.item_price > 400
GROUP BY c.email_address
HAVING COUNT(o.order_id) > 1
ORDER BY SUM((o.item_price - o.discount_amount) * quantity) DESC;

-- Question 6 - TESTED
SELECT p.product_name AS product_name, SUM((o.item_price - o.discount_amount) * o.quantity) AS product_total
FROM Products p JOIN Order_Items o
	ON p.product_id = o.product_id
GROUP BY p.product_name WITH ROLLUP;

-- QUESTION 7 - TESTED
SELECT c.email_address AS email_address, COUNT(distinct product_id) AS number_of_products
FROM Customers c JOIN Orders ord
	ON c.customer_id = ord.customer_id
		JOIN Order_Items o
			ON ord.order_id = o.order_id
GROUP BY c.email_address
HAVING COUNT(distinct product_id) > 1;