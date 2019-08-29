/* Maynor Alex Moreno
COMP 269_801RL
CH 12 HW
Due 12.11.17 */

-- Question 1 -- TESTED

CREATE VIEW customer_addresses AS
    SELECT c.customer_id, email_address, last_name, first_name,
           b.line1 AS bill_line1, b.line2 AS bill_line2, b.city AS bill_city, b.state AS bill_state, b.zip_code AS bill_zip,
           s.line1 AS ship_line1, s.line2 AS ship_line2, s.city AS ship_city, s.state AS ship_state, s.zip_code AS ship_zip
    FROM customers c JOIN addresses b
        ON c.billing_address_id = b.address_id
        JOIN addresses s
            ON c.shipping_address_id = s.address_id
    ORDER BY c.last_name, c.first_name;

-- Question 2 -- TESTED

SELECT customer_id, last_name, First_name, bill_line1 
    FROM customer_addresses;

-- Question 3 -- TESTED

UPDATE customer_addresses
SET ship_line1 = '1990 Westwood Blvd.'
WHERE customer_id = 8;

-- Question 4 -- TESTED

CREATE VIEW order_item_products AS
    SELECT o.order_id, o.order_date, o.tax_amount, ship_date, item_price, discount_amount, item_price - discount_amount AS item_total, product_name
    FROM Orders o JOIN Order_Items oi
        ON o.order_id = oi.order_id
        JOIN Products p
            ON oi.product_id = p.product_id;

-- QUESTION 5 -- TESTED

CREATE VIEW product_summary AS
    SELECT product_name, COUNT(order_id) AS order_count, SUM(item_total) AS order_total
    FROM order_item_products
    GROUP BY product_name;

-- Question 6
SELECT * FROM product_summary
ORDER BY order_total DESC
LIMIT 5;
