/* Maynor Alex Moreno
Chapter 3 HW Due 10.2.17
(Not in Textbook)
COMP 269-801RL */

/* Question 1 - TESTED*/

SELECT product_code, product_name, list_price, discount_percent
FROM Products
ORDER BY list_price DESC;

/*Question 2 - TESTED*/

SELECT CONCAT(last_name, ", " , first_name) AS full_name
FROM Customers
WHERE last_name >= 'M' 
ORDER BY last_name ASC; 

/*Question 3 - TESTED*/
SELECT product_name, list_price, date_added
FROM Products
WHERE list_price > 500 AND list_price < 2000
ORDER BY date_added DESC;

/* Question 4 - TESTED*/
SELECT product_name, list_price, discount_percent, ROUND( (list_price * discount_percent / 100) , 2 ) AS discount_amount, ROUND( (list_price - (list_price * discount_percent / 100)) , 2) AS discount_price
FROM Products
ORDER BY discount_price DESC
LIMIT 5;

/* Question 5 - TESTED*/
SELECT item_id, item_price, discount_amount, quantity, item_price * quantity AS price_total, discount_amount * quantity AS discount_total, (item_price - discount_amount) * quantity AS item_total
FROM Order_Items
WHERE (item_price - discount_amount) * quantity  > '500'
ORDER BY item_total DESC;

/* Question 6 - TESTED*/
SELECT order_id, order_date, ship_date
FROM ORDERS
WHERE ship_date IS NULL;

/* Question 7 - TESTED*/
SELECT now() AS today_unformatted, DATE_FORMAT(now(), ' %e-%b-%Y ')AS today_formatted;

/* Question 8 - TESTED*/
SELECT 100 AS price, .07 AS tax_rate, 100 * .07 AS tax_amount, 100 + (100 * .07) AS total;