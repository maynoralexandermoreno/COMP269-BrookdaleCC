/* Maynor Alexander Moreno
-- COMP 269-801RL
-- CH 7 HW
-- Due 10.30.17 */

-- Question 1 -- TESTED
SELECT DISTINCT category_name
FROM Categories c
WHERE c.category_id IN 
(SELECT DISTINCT p.category_id
FROM Products p
WHERE c.category_id = p.category_id);

-- Question 2 -- TESTED
SELECT product_name, list_price
FROM Products
WHERE list_price > 
(SELECT AVG(list_price)
FROM Products)
ORDER BY list_price ASC;

-- Question 3 -- TESTED
SELECT category_name
FROM Categories c
WHERE NOT EXISTS 
(SELECT * FROM Products p
WHERE c.category_id = p.category_id);

-- Question 4 -- TESTED
SELECT email_address, order_id AS order_id, MAX(order_total) as max_order_total
FROM(
SELECT email_address, o.order_id AS order_id, SUM((oi.item_price - oi.discount_amount) * oi.quantity) AS order_total
FROM Customers c JOIN Orders o
ON c.customer_id = o.customer_id
	JOIN Order_Items oi
    ON o.order_id = oi.order_id
GROUP BY email_address, o.order_id
) t
GROUP BY email_address;

-- Question 5 -- TESTED
SELECT product_name, discount_percent
FROM(
SELECT product_name, discount_percent, product_id, COUNT(discount_percent) AS count_discounts
FROM Products
GROUP BY discount_percent
) t
WHERE count_discounts = 1
ORDER BY product_name;

-- Question 6 -- TESTED
SELECT email_address, o.order_id, o.order_date
FROM Customers c JOIN Orders o
	on c.customer_id = o.customer_id
WHERE o.order_date =
(SELECT MIN(order_date)
FROM Orders
WHERE o.customer_id = customer_id
GROUP BY customer_id);