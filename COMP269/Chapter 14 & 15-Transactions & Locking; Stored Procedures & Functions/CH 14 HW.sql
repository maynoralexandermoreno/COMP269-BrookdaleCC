/* Maynor Alex Moreno
COMP 269_801RL
CH 14 HW
Due 12/17/17 */

-- Question 1
USE my_guitar_shop;
DROP PROCEDURE IF EXISTS test;
DELIMITER //
CREATE PROCEDURE test()
BEGIN
	DECLARE sql_error TINYINT DEFAULT FALSE;
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
		SET sql_error = TRUE;
	START TRANSACTION;
		DELETE FROM Addresses
		WHERE customer_id = 8;
      
		DELETE FROM Customers
		WHERE customer_id = 8;

		IF sql_error = FALSE THEN
			COMMIT;
            SELECT 'The transaction was comitted.';
		ELSE
			ROLLBACK;
            SELECT 'The transaction was rolled back.';
		END IF;
	END//
DELIMITER ;

call test();