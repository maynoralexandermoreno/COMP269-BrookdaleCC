/* Maynor Alexander Moreno
-- COMP 269-801RL
-- CH 5 HW
-- Due 10.16.17 */

-- Question 1 
INSERT INTO Categories (category_name, category_id)
VALUES ('Brass', default);

-- Question 2
UPDATE Categories
SET category_name = 'Woodwinds'
WHERE category_id = 5;

-- Question 3
DELETE FROM Categories
WHERE category_id = 5; -- look up the number;

-- Question 4
INSERT INTO Products (product_id, category_id, product_code, product_name, description, list_price, discount_percent, date_added)
VALUES (default, 4, 'dgx_640', 'Yamaha DGX 640 88-Key Digital Piano', 'Long description to come.', 799.99, 0, '2017-10-16 14:52:22');

-- Question 5
UPDATE Products
SET discount_percent = 35.00
WHERE product_id = 11; -- look up the number

-- Question 6
DELETE FROM Products
WHERE category_id = 4;

DELETE FROM Categories
WHERE category_id = 4;