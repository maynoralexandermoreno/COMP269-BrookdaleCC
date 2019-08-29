/*Maynor Alex Moreno
COMP 269-801RL
Chapter 9 HW
Due 11.6.17 */

-- Question 1 - TESTED
SELECT list_price, discount_percent, ROUND((list_price * (discount_percent/100)), 2) AS discount_amount
FROM Products;

-- Question 2 - TESTED; Format is fine, but in the image month does not match up with either the true month or day. It seems that instead of month, it has been set to HOUR
SELECT order_date, DATE_FORMAT(order_date, '%Y') AS order_year, DATE_FORMAT(order_date, '%b-%d-%Y') AS date_formatted, DATE_FORMAT(order_date, '%h:%i %p') AS order_time, DATE_FORMAT(order_date, '%m/%d/%y %H:%S') AS order_dateTime
FROM Orders;

-- Question 3 - TESTED
SELECT card_number, LENGTH(card_number) AS card_number_length, SUBSTRING(card_number, Length(card_number) - 3, 4) AS last_four_digits, CONCAT('XXXX-XXXX-XXXX-',SUBSTRING(card_number, Length(card_number) - 3, 4))
FROM Orders;

-- Question 4 -- TESTED; without the where clause it is golden 
/* However, hw wants where clause to choose order dates
with MAY 2015...there are no dates where the month is 05
I included the where clause code as a line comment so that my code matches the solution image*/
SELECT order_id, order_date, DATE_ADD(order_date, INTERVAL 2 DAY) AS approx_ship_date, ship_date, ( DAYOFYEAR(ship_date) - DAYOFYEAR(order_date) ) AS days_to_ship
FROM Orders
WHERE YEAR(order_date) = 2015 AND MONTH(order_date) = 3
;