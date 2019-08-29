/* Maynor A. Moreno
COMP 269_801RL
CH 10 In Class
Due 12.04.17 */
SET SESSION storage_engine = InnoDB;

-- Question 1 -TESTED
USE my_guitar_shop;
CREATE INDEX customers_zip_code_ix
	ON Addresses (zip_code);
    
-- Question 2 -- TESTED
DROP DATABASE IF EXISTS my_web_db;
CREATE DATABASE my_web_db COLLATE utf8;
USE my_web_db;

CREATE TABLE users
(
user_id				INT				PRIMARY KEY		AUTO_INCREMENT,
email_address		VARCHAR(100)	NOT NULL,
first_name			VARCHAR(45)		NOT NULL,
last_name			VARCHAR(45)		NOT NULL
);

CREATE TABLE products
(
product_id			INT				PRIMARY KEY		AUTO_INCREMENT,
product_name		VARCHAR(45)		NOT NULL
);

CREATE TABLE downloads
(
download_id			INT				PRIMARY KEY		AUTO_INCREMENT,
user_id				INT				NOT NULL, 
 CONSTRAINT downloads_fk_user_id
	FOREIGN KEY (user_id)
    REFERENCES users (user_id),
download_date		DATETIME		NOT NULL,
filename			VARCHAR(50)		NOT NULL,
product_id			INT				NOT NULL,
 CONSTRAINT downloads_fk_product_id
	FOREIGN KEY (product_id)
    REFERENCES products (product_id)
);

-- QUESTION 3 -- TESTED
INSERT INTO users VALUES
	(DEFAULT, "user1email@aol.com", "Joe", "Smith"),
	(DEFAULT, "user2email@hotmail.com", "John", "Doe");
INSERT INTO products VALUES
	(DEFAULT, "First Product"),
    (DEFAULT, "Second Product");
INSERT INTO downloads VALUES
	(DEFAULT, 1, now(), "file 1", 2),
    (DEFAULT, 2, now(), "file 2", 1),
    (DEFAULT, 2, now(), "file 3", 2);
SELECT u.email_address AS email_address, u.first_name AS first_name, u.last_name AS last_name, d.download_date AS download_date, d.filename AS filename, p.product_name AS product_name
FROM users u JOIN downloads d
	ON u.user_id = d.user_id
    JOIN products p
		ON d.product_id = p.product_id
ORDER BY email_address DESC, product_name ASC;

-- QUESTION 4 -- TESTED
ALTER TABLE my_web_db.products
ADD product_price DECIMAL(5,2) DEFAULT 9.99,
ADD product_date DATE DEFAULT now();

-- QUESTION 5 -- TESTED
ALTER TABLE my_web_db.users
MODIFY first_name		VARCHAR(20)		NOT NULL;

UPDATE users
SET first_name = null
WHERE user_id = 1;

UPDATE users
SET first_name = "SmittyWerbenManJensen"
WHERE user_id  = 2;