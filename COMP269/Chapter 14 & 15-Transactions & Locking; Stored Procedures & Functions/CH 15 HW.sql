/* Maynor Alex Moreno
COMP 269_801RL
CH 14 HW
Due 12/17/17 */

-- Question 1 - TESTED
use my_guitar_shop;

DROP PROCEDURE IF EXISTS insert_category;
DELIMITER //
CREATE PROCEDURE insert_category( 
  IN category_name_param VARCHAR(255)
)
BEGIN
	DECLARE category_name_is_duplicate TINYINT DEFAULT FALSE;
	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
		set category_name_is_duplicate = TRUE;
		
	START TRANSACTION;
		INSERT INTO Categories
		VALUES (default, category_name_param);
    
		IF category_name_is_duplicate = FALSE THEN
            COMMIT;
			SELECT 'The transaction was committed.';
		ELSE
			ROLLBACK;
			SELECT 'The transaction was rolled back.';
		END IF;
	END //
DELIMITER ;
CALL insert_category('Guitars');
Call insert_category('New Category');
DELETE FROM Categories WHERE category_id = Last_Insert_ID();






-- QUESTION 2 -- TESTED

DROP FUNCTION IF EXISTS discount_price;

DELIMITER //

CREATE FUNCTION discount_price
(
  item_id_param   INT
)
RETURNS DECIMAL(9,2)
BEGIN
  DECLARE discount_price INT;  
  SELECT item_price - discount_amount
  INTO discount_price
  FROM Order_Items
  WHERE item_id = item_id_param;
  
  RETURN(discount_price);
END//

DELIMITER ;

SELECT item_id, item_price, discount_amount, discount_price(item_id)
FROM Order_Items;