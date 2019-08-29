/* Maynor Alex Moreno
Chapter 4 HW
Due 10.9.17 */

-- Question 1
SELECT category_name, product_name, list_price
FROM Products p JOIN Categories c
ON p.category_id = c.category_id
ORDER BY category_name, product_name ASC;

-- Question 2
SELECT first_name, last_name, line1, city, state, zip_code
FROM Addresses a JOIN Customers c
ON a.customer_id = c.customer_id 
WHERE c.email_address = "allan.sherwood@yahoo.com";

-- Question 3
SELECT first_name, last_name, line1, city, state, zip_code
FROM Addresses a JOIN Customers c
ON a.address_id = c.shipping_address_id;

-- Question 4
SELECT last_name, first_name, order_date, product_name, item_price, discount_amount, quantity
FROM Customers c JOIN Orders o
	ON c.customer_id = o.customer_id
		JOIN Order_Items i
        ON o.order_id = i.order_id
			JOIN Products p
			ON i.product_id = p.product_id
ORDER BY last_name, order_date, product_name;

-- Question 5
SELECT p1.product_name, p1.list_price
FROM Products p1 JOIN products p2
ON p1.list_price = p2.list_price
	AND p1.product_id <> p2.product_id
ORDER BY product_name;

-- Question 6
SELECT c.category_name, p.product_id
FROM Categories c LEFT Join Products p
ON c.category_id = p.category_id
WHERE product_id IS NULL;

-- Question 7
SELECT 'NOT SHIPPED' AS ship_status, order_id, order_date
FROM ORDERS
WHERE ship_date IS NULL


UNION

SELECT 'SHIPPED' AS ship_status, order_id, order_date
FROM ORDERS
WHERE ship_date IS NOT NULL

ORDER BY order_date;
