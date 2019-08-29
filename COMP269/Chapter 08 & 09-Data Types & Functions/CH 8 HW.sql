/*Maynor Alex Moreno
COMP 269-801RL
Chapter 8 HW
Due 11.6.17 */

-- Question 1 -- TESTED
SELECT list_price, FORMAT(list_price, 1) AS price_format, CONVERT(list_price, SIGNED) AS price_convert, CAST(list_price AS SIGNED) AS price_cast
FROM Products;
 
-- Question 2 -- TESTED, but it is kept to specifications of the HW (date, date char 10, date char 7, time); values are still same
SELECT date_added, CAST(date_added AS CHAR(10)) AS added_date, CAST(date_added AS CHAR(7)) AS added_char7, CAST(date_added AS TIME) AS added_time
FROM Products;